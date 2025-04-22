-- 1 : Trigger to Update Stock Quantity After an Order

CREATE OR REPLACE FUNCTION update_stock_quantity_after_order()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Stock
    SET quantity = quantity - NEW.quantity
    WHERE mobile_id = NEW.mobile_id;
    RETURN NEW;
END;
$$

CREATE TRIGGER update_stock_quantity
AFTER INSERT ON ordertable
FOR EACH ROW
EXECUTE FUNCTION update_stock_quantity_after_order();

insert into ordertable values(100,40,102,1,'2023-01-01',1,1);

select * from ordertable;
select * from stock;

-- 2 : Trigger to Check Email Format in Customer Table

CREATE OR REPLACE FUNCTION check_customer_email_format()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF NEW.email !~ '^[a-zA-Z0-9._%-]+@[a-zA-Z0-9._%-]+\.[a-zA-Z]{2,4}$' THEN
        RAISE EXCEPTION 'Invalid email format.';
    END IF;
    RETURN NEW;
END;
$$

CREATE TRIGGER check_customer_email_format_trigger
BEFORE INSERT OR UPDATE ON Customer
FOR EACH ROW
EXECUTE FUNCTION check_customer_email_format();

insert into customer(customer_id, email) values(100,'error');

-- 3 : Trigger to Prevent Negative Stock Quantity

CREATE OR REPLACE FUNCTION prevent_negative_stock_quantity()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.quantity < 0 THEN
        RAISE EXCEPTION 'Stock quantity cannot be negative.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_negative_stock_quantity
BEFORE INSERT OR UPDATE ON Stock
FOR EACH ROW
EXECUTE FUNCTION prevent_negative_stock_quantity();

insert into stock values(999,101,'2020-11-12',-8);

-- 4 : Trigger to Prevent Deleting Suppliers with Active Stock

CREATE OR REPLACE FUNCTION prevent_delete_supplier()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF TG_OP = 'DELETE' THEN
        -- Check if there are active stocks for the supplier
        IF EXISTS (
            SELECT 1
            FROM Stock
            WHERE OLD.supplier_id = Stock.supplier_id
        ) THEN
            RAISE EXCEPTION 'Cannot delete supplier with active stock';
        END IF;
    END IF;

    RETURN OLD;
END;
$$;

CREATE TRIGGER prevent_delete_supplier_trigger
BEFORE DELETE ON Supplier
FOR EACH ROW
EXECUTE FUNCTION prevent_delete_supplier();

DELETE FROM Supplier WHERE supplier_id = 1;

-- 5 : Trigger to Enforce Unique Email

CREATE OR REPLACE FUNCTION enforce_unique_email()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM customer WHERE email = NEW.email) THEN
        RAISE EXCEPTION 'Email must be unique.';
    END IF;
    RETURN NEW;
END;
$$

CREATE TRIGGER enforce_unique_email_trigger
BEFORE INSERT ON customer
FOR EACH ROW
EXECUTE FUNCTION enforce_unique_email();

insert into customer(customer_id, email) values (100, 'dakshilgorasiya@gmail.com');