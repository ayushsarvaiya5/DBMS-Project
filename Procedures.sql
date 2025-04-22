
-- 1 : Procedure to Update Employee Salary

CREATE OR REPLACE PROCEDURE update_employee_salary(
    IN employeeid NUMERIC,
    IN new_salary NUMERIC(10, 2)
)
AS $$
BEGIN
    UPDATE Employee
    SET salary = new_salary
    WHERE Employee.employee_id = employeeid;
END;
$$ LANGUAGE plpgsql;

CALL update_employee_salary(1,50000);

select salary from employee where employee_id = 1;

-- 2 : Procedure to Update Stock Quantity for a Mobile

CREATE OR REPLACE PROCEDURE update_stock_quantity(
    IN mobileid NUMERIC,
    IN new_quantity NUMERIC
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Stock
    SET quantity = quantity + new_quantity
    WHERE Stock.mobile_id = mobileid;
END;
$$

CALL update_stock_quantity(102, 20);

select quantity from stock where mobile_id = 102;

-- 3 : Procedure to Insert Employee

CREATE OR REPLACE PROCEDURE insert_employee(
    IN in_employee_id NUMERIC,
	IN in_name VARCHAR(100),
	IN in_salary NUMERIC(10,2),
	IN in_joining_date DATE,
	IN in_role VARCHAR(20)
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO employee (employee_id, name, salary, joining_date, role)
	VALUES (in_employee_id, in_name, in_salary, in_joining_date, in_role);
END;
$$

CALL insert_employee(6, 'Tirth', 15000, '2023-11-23', 'Salesperson');

select * from employee; 

-- 4 : Procedure to Delete Expired Warranties

CREATE OR REPLACE PROCEDURE delete_expired_warranties()
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Warranty
    WHERE starting_date + interval '1 month' * duration < CURRENT_DATE;
END;
$$

CALL delete_expired_warranties();

-- 5 : Procedure to Update Mobile Prices with Discount

CREATE OR REPLACE PROCEDURE update_mobile_prices_with_discount(
    IN discount_percentage NUMERIC
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE mobile
    SET price = price - (price * discount_percentage / 100);
END;
$$

CALL update_mobile_prices_with_discount(10);
