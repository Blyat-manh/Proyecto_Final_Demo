-- Create the database
CREATE DATABASE tpv;

-- Use the database
USE tpv;

-- Create the users table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('encargado', 'camarero', 'cocina') NOT NULL
);

-- Create the employees table
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    role VARCHAR(50) NOT NULL
);

-- Create the inventory table
CREATE TABLE inventory (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    quantity INT NOT NULL
);

-- Create the orders table
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    table_number INT NOT NULL,
    items JSON NOT NULL,
    completed BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the cash table
CREATE TABLE cash (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE NOT NULL,
    orders JSON NOT NULL,
    total DECIMAL(10, 2) NOT NULL
);

INSERT INTO users (username, password, role) VALUES 
('encargado', '$2b$10$eW5p0I1Qq4uZ9O/RHd2YZee6SvM7uK1o7E6MxHKxK1tU1F7c7jq3e', 'encargado');

-- Camarero user
INSERT INTO users (username, password, role) VALUES 
('camarero', '$2b$10$eW5p0I1Qq4uZ9O/RHd2YZee6SvM7uK1o7E6MxHKxK1tU1F7c7jq3e', 'camarero');

-- Cocina user
INSERT INTO users (username, password, role) VALUES 
('cocina', '$2b$10$eW5p0I1Qq4uZ9O/RHd2YZee6SvM7uK1o7E6MxHKxK1tU1F7c7jq3e', 'cocina');