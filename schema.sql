-- Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50),
    signup_date DATE
);

-- Restaurants Table
CREATE TABLE restaurants (
    hotel_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100),
    city VARCHAR(50),
    reg_date DATE
);

-- Menu Items Table
CREATE TABLE menu_items (
    item_id INT PRIMARY KEY,
    hotel_id INT,
    item_name VARCHAR(100),
    price DECIMAL(10,2),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);

-- Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    hotel_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);

-- Order Details Table
CREATE TABLE order_details (
    ord_det_id INT PRIMARY KEY,
    order_id INT,
    item_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (item_id) REFERENCES menu_items(item_id)
);
