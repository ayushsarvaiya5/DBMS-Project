
-- 1 : Function to Calculate Total Stock Value by Mobile Brand

CREATE OR REPLACE FUNCTION calculate_stock_value_by_brand(brand_name VARCHAR(50))
RETURNS NUMERIC(10, 2)
LANGUAGE plpgsql
AS $$
DECLARE
    total_value NUMERIC(10, 2);
BEGIN
    SELECT SUM(price * quantity) INTO total_value
    FROM Stock
    JOIN Mobile ON Stock.mobile_id = Mobile.mobile_id
    WHERE brand = brand_name;

    RETURN total_value;
END;
$$

select calculate_stock_value_by_brand('Apple');


-- 2 : Function to Calculate Total Salary Expense by Role

CREATE OR REPLACE FUNCTION calculate_salary_expense_by_role(role_name VARCHAR(50))
RETURNS NUMERIC(10, 2)
LANGUAGE plpgsql
AS $$
DECLARE
    total_salary NUMERIC(10, 2);
BEGIN
    SELECT SUM(salary) INTO total_salary
    FROM Employee
    WHERE role = role_name;

    RETURN total_salary;
END;
$$

select calculate_salary_expense_by_role('Manager');

-- 3 : Function to Retrieve Order Details by ID

CREATE OR REPLACE FUNCTION get_order_details(orderid NUMERIC)
RETURNS TABLE (
    quantity NUMERIC,
    mobile_brand VARCHAR(50),
    f_name VARCHAR(150),
	l_name VARCHAR(150),
    ordered_date DATE
)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY SELECT o.quantity, m.brand, c.fname, c.lname, o.ordered_date
    FROM OrderTable o
    JOIN Mobile m ON o.mobile_id = m.mobile_id
    JOIN Customer c ON o.customer_id = c.customer_id
    WHERE order_id = orderid;
END;
$$

select * from get_order_details(1);

-- 4 : Function to Calculate Total Revenue by Date Range

CREATE OR REPLACE FUNCTION calculate_total_revenue_by_date_range(start_date DATE, end_date DATE)
RETURNS NUMERIC(10, 2)
LANGUAGE plpgsql
AS $$
DECLARE
    total_revenue NUMERIC(10, 2);
BEGIN
    SELECT SUM(total_amount) INTO total_revenue
    FROM Bill
    WHERE date BETWEEN start_date AND end_date;

    RETURN total_revenue;
END;
$$

select calculate_total_revenue_by_date_range('2023-03-01','2023-03-28');

-- 5 : Function to Retrieve Stock Quantity by Mobile ID

CREATE OR REPLACE FUNCTION get_stock_quantity_by_mobile_id(mobileid NUMERIC)
RETURNS NUMERIC
LANGUAGE plpgsql
AS $$
DECLARE
    stock_quantity NUMERIC;
BEGIN
    SELECT SUM(quantity) INTO stock_quantity
    FROM Stock
    WHERE Stock.mobile_id = mobileid;

    RETURN stock_quantity;
END;
$$

select get_stock_quantity_by_mobile_id(101);

-- 6 : Function to Calculate Total Payment Amount by Payment Mode

CREATE OR REPLACE FUNCTION calculate_total_payment_amount_by_mode(paymentMode VARCHAR(50))
RETURNS DECIMAL(10, 2)
LANGUAGE plpgsql
AS $$
DECLARE
    total_amount DECIMAL(10, 2);
BEGIN
    SELECT SUM(payment_amount) INTO total_amount
    FROM Payment
    WHERE Payment.payment_mode = paymentMode;

    RETURN total_amount;
END;
$$

select calculate_total_payment_amount_by_mode('Cash');

-- 7 : Function to Retrieve State for a Given Pincode

CREATE OR REPLACE FUNCTION get_state_by_pincode(pc NUMERIC)
RETURNS VARCHAR(50)
LANGUAGE plpgsql
AS $$
DECLARE
    state_name VARCHAR(50);
BEGIN
    SELECT state INTO state_name
    FROM StatePincodeInfo
    WHERE pincode = pc;

    RETURN state_name;
END;
$$

select get_state_by_pincode(380001);

-- 8 : Function to Caculate Total Revenue by Employee

CREATE OR REPLACE FUNCTION calculate_total_revenue_by_employee(employeeid NUMERIC)
RETURNS NUMERIC(10, 2)
LANGUAGE plpgsql
AS $$
DECLARE
    total_revenue NUMERIC(10, 2);
BEGIN
    SELECT SUM(total_amount) INTO total_revenue
    FROM Bill
    JOIN OrderTable ON Bill.order_id = OrderTable.order_id
    WHERE OrderTable.employee_id = employeeid;

    RETURN total_revenue;
END;
$$

select calculate_total_revenue_by_employee(1);

-- 9 : Function to Retrieve Mobiles with Low Stock

CREATE OR REPLACE FUNCTION get_low_stock_mobiles(threshold_quantity NUMERIC)
RETURNS TABLE (
    mobile_id NUMERIC,
    brand VARCHAR(50),
    model VARCHAR(50),
    current_stock NUMERIC
)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY SELECT M.mobile_id, M.brand, M.model, S.quantity
    FROM Mobile M
    JOIN Stock S ON M.mobile_id = S.mobile_id
    WHERE S.quantity < threshold_quantity;
END;
$$

select * from get_low_stock_mobiles(30);

-- 10 : Function to Calculate Total Revenue by City

CREATE OR REPLACE FUNCTION calculate_total_revenue_by_city(ct VARCHAR(50))
RETURNS NUMERIC(10, 2)
LANGUAGE plpgsql
AS $$
DECLARE
    total_revenue NUMERIC(10, 2);
BEGIN
    SELECT SUM(total_amount) INTO total_revenue
    FROM Bill
    JOIN OrderTable ON Bill.order_id = OrderTable.order_id
    JOIN Customer ON OrderTable.customer_id = Customer.customer_id
    WHERE Customer.city = ct;

    RETURN total_revenue;
END;
$$

select calculate_total_revenue_by_city('Anand');