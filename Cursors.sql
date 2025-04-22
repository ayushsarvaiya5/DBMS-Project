
-- 1 : Cursor to Retrieve Customer Information 

CREATE OR REPLACE FUNCTION Cursor_to_get_customer_info()
RETURNS SETOF Customer 
LANGUAGE plpgsql
AS $$
DECLARE
    customer_cursor CURSOR FOR SELECT * FROM Customer;
    customer_record Customer;
BEGIN
    OPEN customer_cursor;
    LOOP
        FETCH customer_cursor INTO customer_record;
        EXIT WHEN NOT FOUND;
        RETURN NEXT customer_record;
    END LOOP;
    CLOSE customer_cursor;
    RETURN;
END;
$$

SELECT * FROM Cursor_to_get_customer_info();


-- 2 : Cursor to Fetch Employees with Role 'Salesperson'

CREATE OR REPLACE FUNCTION Cursor_to_process_salespersons()
RETURNS SETOF Employee
LANGUAGE plpgsql
AS $$
DECLARE
    salespersons_cursor CURSOR FOR SELECT * FROM Employee WHERE role = 'Salesperson';
    employee_record Employee%ROWTYPE;
BEGIN
    OPEN salespersons_cursor;
    LOOP
        FETCH salespersons_cursor INTO employee_record;
        EXIT WHEN NOT FOUND;

        RETURN NEXT employee_record;
    END LOOP;
    CLOSE salespersons_cursor;

    RETURN;
END;
$$;

SELECT * FROM Cursor_to_process_salespersons();


-- 3 : Cursor to Fetch Customers in Rajkot

CREATE OR REPLACE FUNCTION Cursor_to_process_rajkot_customers()
RETURNS SETOF Customer
LANGUAGE plpgsql
AS $$
DECLARE
    rajkot_customers_cursor CURSOR FOR SELECT * FROM Customer WHERE city = 'Rajkot';
    customer_record Customer%ROWTYPE;
BEGIN
    OPEN rajkot_customers_cursor;
    LOOP
        FETCH rajkot_customers_cursor INTO customer_record;
        EXIT WHEN NOT FOUND;

        RETURN NEXT customer_record;
    END LOOP;
    CLOSE rajkot_customers_cursor;
    RETURN;
END;
$$;

SELECT * FROM Cursor_to_process_rajkot_customers();


-- 4 : Cursor to Fetch Stock Purchased in 2023

CREATE OR REPLACE FUNCTION Cursor_to_process_stock_2023()
RETURNS SETOF Stock
LANGUAGE plpgsql
AS $$
DECLARE
    stock_2023_cursor CURSOR FOR SELECT * FROM Stock WHERE EXTRACT(YEAR FROM purchase_date) = 2023;
    stock_record Stock%ROWTYPE;
BEGIN
    OPEN stock_2023_cursor;
    LOOP
        FETCH stock_2023_cursor INTO stock_record;
        EXIT WHEN NOT FOUND;

        RETURN NEXT stock_record;
    END LOOP;
    CLOSE stock_2023_cursor;
    RETURN;
END;
$$;

SELECT * FROM Cursor_to_process_stock_2023();


-- 5 : Cursor to Fetch Orders Placed in May 2023:

CREATE OR REPLACE FUNCTION Cursor_to_process_may_2023_orders()
RETURNS SETOF OrderTable
LANGUAGE plpgsql
AS $$
DECLARE
    may_orders_cursor CURSOR FOR SELECT * FROM OrderTable WHERE ordered_date BETWEEN '2023-05-01' AND '2023-05-31';
    order_record OrderTable%ROWTYPE;
BEGIN
    OPEN may_orders_cursor;
    LOOP
        FETCH may_orders_cursor INTO order_record;
        EXIT WHEN NOT FOUND;

        RETURN NEXT order_record;
    END LOOP;
    CLOSE may_orders_cursor;
    RETURN;
END;
$$;

SELECT * FROM Cursor_to_process_may_2023_orders();
