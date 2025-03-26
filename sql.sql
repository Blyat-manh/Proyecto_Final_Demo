-- Crear la base de datos tpv
CREATE DATABASE tpv;

-- Usar la base de datos tpv
USE tpv;

-- Tabla para guardar los usuarios
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('encargado', 'camarero', 'cocina') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla para guardar el inventario
CREATE TABLE inventory (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

-- Tabla para guardar los pedidos
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    table_number INT NOT NULL,  -- El número de mesa
    items JSON NOT NULL,        -- Lista de los objetos pedidos en formato JSON
    total DECIMAL(10, 2) NOT NULL, -- Total del pedido
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla para guardar las mesas
CREATE TABLE tables (
    id INT AUTO_INCREMENT PRIMARY KEY,
    table_number INT NOT NULL,  -- Número de la mesa
    total DECIMAL(10, 2) DEFAULT 0,  -- Total de todos los pedidos de la mesa
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla para registrar las ganancias diarias
CREATE TABLE daily_revenue (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE NOT NULL,  -- Fecha del día
    total DECIMAL(10, 2) NOT NULL  -- Total ganado en ese día
);

-- Relación entre orders y tables
-- No se necesita una tabla de relación explícita, solo se hace referencia por el número de mesa
-- Relación entre orders y inventory (por los items en el JSON, se manejan a través de la lista de productos pedidos)

-- Inserción de datos de ejemplo (opcional)
-- Insertar algunos datos de ejemplo en la tabla users
INSERT INTO users (name, password, role) VALUES 
('Encargado', '$2b$10$eW5p0I1Qq4uZ9O/RHd2YZee6SvM7uK1o7E6MxHKxK1tU1F7c7jq3e', 'encargado'),
('Camarero', '$2b$10$eW5p0I1Qq4uZ9O/RHd2YZee6SvM7uK1o7E6MxHKxK1tU1F7c7jq3e', 'camarero'),
('Cocina', '$2b$10$eW5p0I1Qq4uZ9O/RHd2YZee6SvM7uK1o7E6MxHKxK1tU1F7c7jq3e', 'cocina');

-- Insertar algunos datos de ejemplo en la tabla inventory
INSERT INTO inventory (name, price) VALUES 
('Pizza', 8.50),
('Pasta', 6.00),
('Ensalada', 4.00),
('Bebida', 2.50);

-- Insertar algunos datos de ejemplo en la tabla tables
INSERT INTO tables (table_number, total) VALUES 
(1, 25.00),
(2, 18.50),
(3, 15.00);

-- Insertar algunos datos de ejemplo en la tabla daily_revenue
INSERT INTO daily_revenue (date, total) VALUES 
('2025-03-26', 58.50);
