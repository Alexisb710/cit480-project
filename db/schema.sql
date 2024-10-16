CREATE TABLE User (
    User_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Email VARCHAR(255) UNIQUE,
    Password VARCHAR(255),
    Phone VARCHAR(20),
    Role ENUM('A', 'C')
);

CREATE TABLE Address (
    Address_ID INT PRIMARY KEY AUTO_INCREMENT,
    User_ID INT,
    Street VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    Zip_code VARCHAR(20),
    Country VARCHAR(100),
    Type ENUM('B', 'S'),
    FOREIGN KEY (User_ID) REFERENCES User(User_ID)
);

CREATE TABLE Payment (
    Payment_ID INT PRIMARY KEY AUTO_INCREMENT,
    Order_ID INT,
    Payment_method ENUM('CC', 'PP'),
    Payment_status ENUM('P', 'C', 'F'),
    Payment_date TIMESTAMP,
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
);

CREATE TABLE Shipment (
    Shipment_ID INT PRIMARY KEY AUTO_INCREMENT,
    Order_ID INT,
    Shipment_method ENUM('C', 'P', 'ISP'),
    Shipment_date TIMESTAMP,
    Tracking_number VARCHAR(255),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
);

CREATE TABLE Cart (
    Cart_ID INT PRIMARY KEY AUTO_INCREMENT,
    User_ID INT,
    Total_price DECIMAL(10, 2),
    FOREIGN KEY (User_ID) REFERENCES User(User_ID)
);

CREATE TABLE Orders (
    -- the table is named Orders because Order is a reserved keyword in sql
    Order_ID INT PRIMARY KEY AUTO_INCREMENT,
    User_ID INT,
    Total_amount DECIMAL(10, 2),
    Order_status ENUM('P', 'S', 'D', 'C'),
    Created_At TIMESTAMP,
    FOREIGN KEY (User_ID) REFERENCES User(User_ID)
);

CREATE TABLE Order_Item (
    Order_ID INT,
    Product_ID INT,
    Quantity INT,
    Item_price DECIMAL(10, 2),
    PRIMARY KEY (Order_ID, Product_ID),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);

CREATE TABLE Product (
    Product_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255),
    Description TEXT,
    Price DECIMAL(10, 2),
    Category_ID INT,
    Brand_ID INT,
    FOREIGN KEY (Category_ID) REFERENCES Category(Category_ID),
    FOREIGN KEY (Brand_ID) REFERENCES Brand(Brand_ID)
);

CREATE TABLE Category (
    Category_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255)
);

CREATE TABLE Brand (
    Brand_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255)
);
