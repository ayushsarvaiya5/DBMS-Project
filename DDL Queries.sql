    -- Table 1: Supplier Table
CREATE TABLE Supplier (
    supplier_id NUMERIC PRIMARY KEY,
    email VARCHAR(255),
    phoneno NUMERIC(15),
    fname VARCHAR(50),
    mname VARCHAR(50),
    lname VARCHAR(50)
);

-- Table 2: Mobile Table
CREATE TABLE Mobile (
    mobile_id NUMERIC PRIMARY KEY,
    price NUMERIC(10,2),
    brand VARCHAR(50),
    model VARCHAR(50),
    RAM NUMERIC,
    ROM NUMERIC,
    battery VARCHAR(50),
    processor VARCHAR(50),
    screen_size NUMERIC(4,2),
    operating_system VARCHAR(50),
    display_quantity NUMERIC
);

-- Table 3: Stock Table
CREATE TABLE Stock (
    stock_id NUMERIC PRIMARY KEY,
    mobile_id NUMERIC,
    purchase_date DATE,
    quantity NUMERIC,
    supplier_id NUMERIC,
    FOREIGN KEY (supplier_id) REFERENCES stock(supplier_id),
    FOREIGN KEY (mobile_id) REFERENCES Mobile(mobile_id)
);


-- Table 4: Payment Table
CREATE TABLE Payment (
    payment_id NUMERIC PRIMARY KEY,
    payment_date DATE,
    payment_amount DECIMAL(10,2),
    payment_mode VARCHAR(50),
    supplier_id NUMERIC,
    stock_id NUMERIC,
    FOREIGN KEY (supplier_id) REFERENCES Supplier,
    FOREIGN KEY (stock_id) REFERENCES Stock
);

-- Table 5: Employee Table
CREATE TABLE Employee (
    employee_id NUMERIC PRIMARY KEY,
    name VARCHAR(100),
    salary NUMERIC(10,2),
    joining_date DATE,
    role VARCHAR(50)
);

-- Table 6: Warranty Table
CREATE TABLE Warranty (
    warranty_id NUMERIC PRIMARY KEY,
    type VARCHAR(50),
    duration NUMERIC,
    starting_date DATE
);

-- Table 7: Customer Table
CREATE TABLE Customer (
    customer_id NUMERIC PRIMARY KEY,
    fname VARCHAR(50),
    mname VARCHAR(50),
    lname VARCHAR(50),
    street VARCHAR(255),
    city VARCHAR(50),
    email VARCHAR(255),
    phone_no NUMERIC
);

-- Table 8: State Pincode Info Table
CREATE TABLE StatePincodeInfo (
    pincode NUMERIC PRIMARY KEY,
    city VARCHAR(50),
    state VARCHAR(50)
);


-- Table 9: Order Table
CREATE TABLE OrderTable (
    order_id NUMERIC PRIMARY KEY,
    quantity NUMERIC,
    mobile_id NUMERIC,
    customer_id NUMERIC,
    ordered_date DATE,
    employee_id NUMERIC,
    warranty_id NUMERIC,
    FOREIGN KEY (mobile_id) REFERENCES Mobile(mobile_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id),
    FOREIGN KEY (warranty_id) REFERENCES Warranty(warranty_id)
);

-- Table 10: Bill Table
CREATE TABLE Bill (
    bill_id NUMERIC PRIMARY KEY,
    total_amount NUMERIC(10,2),
    date DATE,
    gst_no VARCHAR(50),
    order_id NUMERIC,
    customer_id NUMERIC,
    FOREIGN KEY (order_id) REFERENCES OrderTable(order_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);