-- Inserting data into Supplier Table
INSERT INTO Supplier (supplier_id, email, phoneno, fname, mname, lname)
VALUES 
(1, 'rohitsharma@gmail.com', 1234567890, 'Rohit', 'R', 'Sharma'),
(2, 'viratkohli@gmail.com', 9876543210, 'Virat', 'S', 'Kohli'),
(3, 'jaspritbumrah@gmail.com', 1122334455, 'Jasprit', 'D', 'Bumrah'),
(4, 'hardikpandya@gmail.com', 9988776655, 'Hardik', 'B', 'Pandya'),
(5, 'ravindrajadeja@gmail.com', 3344556677, 'Ravindra', 'M', 'Jadeja');


-- Inserting data into Mobile Table
INSERT INTO Mobile (mobile_id, price, brand, model, RAM, ROM, battery, processor, screen_size, operating_system, display_quantity)
VALUES 
(101, 25000, 'Samsung', 'Galaxy S21', 8, 128, '4000 mAh', 'Exynos 2100', 6.2, 'Android', 100),
(102, 80000, 'Apple', 'iPhone 13', 6, 128, '3110 mAh', 'A15 Bionic', 6.1, 'iOS', 120),
(103, 20000, 'OnePlus', '9 Pro', 12, 256, '4500 mAh', 'Snapdragon 888', 6.7, 'Android', 80),
(104, 12000, 'Xiaomi', 'Redmi Note 10', 6, 64, '5020 mAh', 'Snapdragon 678', 6.43, 'Android', 150),
(105, 23000, 'Google', 'Pixel 5', 8, 128, '4080 mAh', 'Snapdragon 765G', 6.0, 'Android', 90);

-- Inserting data into Stock Table
INSERT INTO Stock (stock_id, mobile_id, purchase_date, quantity, supplier_id)    
VALUES 
(1, 101, '2023-01-15', 50, 5),
(2, 102, '2023-02-20', 60, 3),
(3, 103, '2023-03-10', 40, 1),
(4, 104, '2023-04-05', 25, 2),
(5, 105, '2023-05-12', 35, 1);

-- Inserting data into Payment Table
INSERT INTO Payment (payment_id, payment_date, payment_amount, payment_mode, supplier_id, stock_id)
VALUES 
(1, '2023-01-20', 45000, 'Credit Card', 1, 1),
(2, '2023-02-25', 24000, 'Debit Card', 2, 2),
(3, '2023-03-15', 28000, 'Net Banking', 3, 3),
(4, '2023-04-10', 12500, 'Cash', 4, 4),
(5, '2023-05-17', 21000, 'Cheque', 5, 5);

-- Inserting data into Employee Table
INSERT INTO Employee (employee_id, name, salary, joining_date, role)
VALUES 
(1, 'Magan', 50000, '2023-01-01', 'Manager'),
(2, 'Dhruvil', 30000, '2023-02-01', 'Salesperson'),
(3, 'Malhar', 35000, '2023-03-01', 'Technician'),
(4, 'Yash', 48000, '2023-04-01', 'Manager'),
(5, 'Varun', 32000, '2023-05-01', 'Salesperson');

-- Inserting data into Warranty Table
INSERT INTO Warranty (warranty_id, type, duration, starting_date)
VALUES 
(1, 'Extended', 24, '2023-01-15'),
(2, 'Standard', 12, '2023-02-20'),
(3, 'Extended', 24, '2023-03-10'),
(4, 'Standard', 12, '2023-04-05'),
(5, 'Extended', 24, '2023-05-12');

-- Inserting data into Customer Table
INSERT INTO Customer (customer_id, fname, mname, lname, street, city, email, phone_no)
VALUES 
(1, 'Dakshil', 'A', 'Gorasiya', '123 Taxshila Duplex', 'Bhavnagar', 'dakshilgorasiya@gmail.com', 1234567890),
(2, 'Nisarg', 'S', 'Soni', '456 Nand Dham', 'Patan', 'nisargsoni@gmail.com', 9876543210),
(3, 'Chirag', 'E', 'Rathod', '789 Dev Bhoomi', 'Anand', 'chiragrathod@gmail.com', 1122334455),
(4, 'Dhruv', 'O', 'Patel', '101 Ambi Bangloues', 'Rajkot', 'dhruvpatel@gmail.com', 9988776655),
(5, 'Dev', 'L', 'Mali', '202 Himalya Heights', 'Rajkot', 'devmali@gmail.com',   3344556677);

-- Inserting data into State Info Table
INSERT INTO StatePincodeInfo (pincode, city, state)
VALUES 
(380001, 'Bhavnagar', 'Gujarat'),
(395001, 'Patan', 'Gujarat'),
(388001, 'Anand', 'Gujarat'),
(360001, 'Rajkot', 'Gujarat');

-- Inserting data into Order Table
INSERT INTO OrderTable (order_id, quantity, mobile_id, customer_id, ordered_date, employee_id, warranty_id)
VALUES 
(1, 2, 101, 1, '2023-01-25', 1, 1),
(2, 1, 102, 2, '2023-02-28', 2, 2),
(3, 3, 103, 3, '2023-03-15', 3, 3),
(4, 2, 104, 4, '2023-04-10', 1, 4),
(5, 1, 105, 5, '2023-05-20', 5, 5);

-- Inserting data into Bill Table
INSERT INTO Bill (bill_id, total_amount, date, gst_no, order_id, customer_id)
VALUES 
(1, 25000, '2023-01-28', 'GST123', 1, 1),
(2, 80000, '2023-03-05', 'GST456', 2, 2),
(3, 20000, '2023-03-20', 'GST789', 3, 3),
(4, 12000, '2023-04-15', 'GST101', 4, 4),
(5, 23000, '2023-06-01', 'GST202', 5, 5);


select * from Supplier;

select * from Stock;

select * from Mobile;

select * from Payment;

select * from Employee;

select * from Warranty;

select * from Customer;

select * from StatePincodeInfo;

select * from OrderTable;

select * from Bill;
