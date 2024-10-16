-- Create User table
CREATE TABLE Users (
    User_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Email VARCHAR(255) UNIQUE,
    Password VARCHAR(255),
    Phone VARCHAR(20),
    Role ENUM('A', 'C')
);

-- Create Category table (referenced by Product)
CREATE TABLE Category (
    Category_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255)
);

-- Create Brand table (referenced by Product)
CREATE TABLE Brand (
    Brand_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255)
);

-- Create Product table (which references Category and Brand)
CREATE TABLE Product (
    Product_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255),
    Description TEXT,
    Price DECIMAL(10, 2),
    Category_ID INT NOT NULL,
    Brand_ID INT NOT NULL,
    FOREIGN KEY (Category_ID) REFERENCES Category(Category_ID),
    FOREIGN KEY (Brand_ID) REFERENCES Brand(Brand_ID)
);

-- Create Orders table (referenced by other tables)
CREATE TABLE Orders (
    -- the table is named Orders because Order is a reserved keyword in SQL
    Order_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    User_ID INT NOT NULL,
    Total_amount DECIMAL(10, 2),
    Order_status ENUM('P', 'S', 'D', 'C'),
    Created_At TIMESTAMP,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);

-- Create Address table (referenced by User)
CREATE TABLE Address (
    Address_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    User_ID INT NOT NULL,
    Street VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    Zip_code VARCHAR(20),
    Country VARCHAR(100),
    Type ENUM('B', 'S'),
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);

-- Create Payment table (references Orders)
CREATE TABLE Payment (
    Payment_ID INT PRIMARY KEY AUTO_INCREMENT,
    Order_ID INT NOT NULL,
    Payment_method ENUM('CC', 'PP'),
    Payment_status ENUM('P', 'C', 'F'),
    Payment_date TIMESTAMP,
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
);

-- Create Shipment table (references Orders)
CREATE TABLE Shipment (
    Shipment_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Order_ID INT NOT NULL,
    Shipment_method ENUM('C', 'P', 'ISP'),
    Shipment_date TIMESTAMP,
    Tracking_number VARCHAR(255),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
);

-- Create Cart table (references User)
CREATE TABLE Cart (
    Cart_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    User_ID INT NOT NULL,
    Total_price DECIMAL(10, 2),
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);

-- Create Order_Item table (references Orders and Product)
CREATE TABLE Order_Item (
    Order_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Quantity INT,
    Item_price DECIMAL(10, 2),
    CONSTRAINT PK_Order_Product PRIMARY KEY (Order_ID, Product_ID),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);