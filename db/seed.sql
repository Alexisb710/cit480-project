-- Insert Users with phone numbers in the format (xxx)xxx-xxxx
INSERT INTO User (Name, Email, Password, Phone, Role) VALUES
('John Doe', 'john.doe@example.com', 'password123', '(555)123-4567', 'C'),
('Alice Smith', 'alice.smith@example.com', 'password456', '(555)234-5678', 'C'),
('Bob Johnson', 'bob.johnson@example.com', 'password789', '(555)345-6789', 'C'),
('Charlie Brown', 'charlie.brown@example.com', 'password111', '(555)456-7890', 'C'),
('Admin User', 'admin@example.com', 'adminpass', '(555)567-8901', 'A');


-- Insert Addresses
INSERT INTO Address (User_ID, Street, City, State, Zip_code, Country, Type) VALUES
(1, '123 Main St', 'Springfield', 'IL', '62704', 'USA', 'B'),
(2, '456 Oak St', 'Metropolis', 'IL', '62960', 'USA', 'S'),
(3, '789 Pine St', 'Smallville', 'KS', '67524', 'USA', 'B'),
(4, '101 Maple St', 'Gotham', 'NY', '10001', 'USA', 'S'),
(5, '202 Cedar St', 'Star City', 'CA', '90210', 'USA', 'B');

-- Insert Brands
INSERT INTO Brand (Name) VALUES
('Brand A'),
('Brand B'),
('Brand C'),
('Brand D'),
('Brand E');

-- Insert Categories
INSERT INTO Category (Name) VALUES
('Fitness Equipment'),
('Climbing Gear'),
('Footwear'),
('Accessories'),
('Outdoors');

-- Insert Products
INSERT INTO Product (Name, Description, Price, Category_ID, Brand_ID) VALUES
('10lb Dumbbells', 'A set of 10lb dumbbells for strength training', 29.99, 1, 5),
('Climbing Clip', 'Sturdy clip for climbing safety', 19.99, 2, 3),
('Climbing Shoes', 'Professional climbing shoes for better grip', 99.99, 2, 3),
('Running Shoes', 'Lightweight running shoes for marathon training', 89.99, 3, 4),
('Jump Rope', 'Durable jump rope for cardio workouts', 14.99, 4, 5),
('Yoga Mat', 'Non-slip yoga mat for home and studio use', 25.99, 1, 1),
('Resistance Bands', 'Set of resistance bands for strength training', 15.99, 1, 2),
('Pull-Up Bar', 'Door-mounted pull-up bar for upper body strength', 39.99, 1, 1),
('Kettlebell', '20lb kettlebell for strength and conditioning', 45.99, 1, 5),
('Climbing Harness', 'Comfortable climbing harness for safety', 79.99, 2, 3),
('Running Cap', 'Breathable cap for outdoor running', 19.99, 3, 4),
('Sports Watch', 'Smart sports watch with GPS and heart-rate monitor', 149.99, 4, 1),
('Water Bottle', 'Insulated water bottle for hydration', 24.99, 4, 2),
('Trail Shoes', 'Shoes designed for trail running and hiking', 110.99, 3, 4),
('Climbing Helmet', 'Protective helmet for rock climbing', 89.99, 2, 3),
('Treadmill', 'High-quality treadmill for indoor running', 599.99, 1, 5),
('Cycling Gloves', 'Gloves designed for cycling and comfort', 19.99, 4, 2),
('Foam Roller', 'Foam roller for muscle recovery and massage', 24.99, 1, 5),
('Climbing Rope', 'Durable rope for mountain climbing', 199.99, 2, 3),
('Compression Socks', 'Socks for better circulation during runs', 12.99, 3, 4);


-- Insert Orders
INSERT INTO Orders (User_ID, Total_amount, Order_status, Created_At) VALUES
(1, 129.95, 'P', NOW()),
(2, 59.99, 'S', NOW()),
(3, 199.99, 'D', NOW()),
(4, 89.99, 'C', NOW()),
(5, 14.99, 'P', NOW());

-- Insert Order Items (linking Orders to Products)
INSERT INTO Order_Item (Order_ID, Product_ID, Quantity, Item_price) VALUES
(1, 1, 2, 29.99),
(1, 5, 1, 14.99),
(2, 2, 1, 19.99),
(3, 3, 1, 99.99),
(4, 4, 1, 89.99),
(5, 5, 1, 14.99);

-- Insert Payments
INSERT INTO Payment (Order_ID, Payment_method, Payment_status, Payment_date) VALUES
(1, 'CC', 'P', NOW()),
(2, 'PP', 'F', NOW()),
(3, 'CC', 'P', NOW()),
(4, 'CC', 'P', NOW()),
(5, 'PP', 'F', NOW());

-- Insert Shipments
INSERT INTO Shipment (Order_ID, Shipment_method, Shipment_date, Tracking_number) VALUES
(1, 'C', NOW(), 'TRACK1234'),
(2, 'P', NOW(), 'TRACK5678'),
(3, 'ISP', NOW(), 'TRACK9876'),
(4, 'P', NOW(), 'TRACK5432'),
(5, 'C', NOW(), 'TRACK6789');