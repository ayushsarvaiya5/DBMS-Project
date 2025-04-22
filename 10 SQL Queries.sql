-- 1 : Retrieve the details of the most expensive mobile:

SELECT * FROM Mobile ORDER BY price desc limit 1;

-- 2 : Retrieve the order details with the corresponding employee names.

SELECT o.order_id, o.quantity, e.name AS employee_name
FROM OrderTable o
JOIN Employee e ON o.employee_id = e.employee_id;

-- 3 : Retrieve the number of orders placed by each customer.

SELECT c.fname, c.lname, COUNT(o.order_id) AS order_count
FROM Customer c
JOIN OrderTable o ON c.customer_id = o.customer_id
GROUP BY c.customer_id;

-- 4 : List the mobiles with their brand and model having a price greater than 30000.

SELECT brand, model FROM Mobile WHERE price > 30000;

-- 5 : Show the customers who have placed orders with a total amount greater than 50000.

SELECT DISTINCT c.customer_id, c.fname, c.lname
FROM Customer c
JOIN OrderTable o ON c.customer_id = o.customer_id
JOIN Bill b ON o.order_id = b.order_id
WHERE b.total_amount > 50000;

-- 6 : Retrieve the orders placed in May 2023.

SELECT * FROM OrderTable
WHERE ordered_date BETWEEN '2023-05-01' AND '2023-05-31';

-- 7 : List the customers who have ordered a mobile with a warranty duration of 24 months.

SELECT c.fname, c.lname
FROM Customer c
JOIN OrderTable o ON c.customer_id = o.customer_id
JOIN Warranty w ON o.warranty_id = w.warranty_id
WHERE w.duration = 24;

-- 8 : Display the customers who live in Gujarat.

SELECT c.fname, c.lname
FROM Customer c
JOIN StatePincodeInfo spi ON c.city = spi.city
WHERE spi.state = 'Gujarat';

-- 9 : List the customers who have ordered mobiles with a screen size greater than 6.0 inches.

SELECT c.fname, c.lname
FROM Customer c
JOIN OrderTable o ON c.customer_id = o.customer_id
JOIN Mobile m ON o.mobile_id = m.mobile_id
WHERE m.screen_size > 6.0;

-- 10 : Display the total number of orders placed by each employee.

SELECT e.name, COUNT(o.order_id) AS total_orders
FROM Employee e
JOIN OrderTable o ON e.employee_id = o.employee_id
GROUP BY e.employee_id;