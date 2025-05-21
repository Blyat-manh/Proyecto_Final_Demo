-- Crear la base de datos
CREATE DATABASE tpv;
USE tpv;

-- Tabla de usuarios
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('encargado', 'camarero', 'cocina') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de mesas
CREATE TABLE tables (
    id INT AUTO_INCREMENT PRIMARY KEY,
    table_number INT NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de inventario
CREATE TABLE inventory (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    type VARCHAR(100) NOT NULL
);

-- Tabla de pedidos
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    table_id INT NOT NULL,
    user_id INT, -- Quién hizo el pedido (opcional)
    total DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (table_id) REFERENCES tables(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL
);

-- Tabla de ítems de pedido
CREATE TABLE order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    inventory_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    FOREIGN KEY (inventory_id) REFERENCES inventory(id)
);

-- Tabla de pedidos cobrados
CREATE TABLE paid_orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    paid_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE
);

-- Tabla de descuentos
CREATE TABLE discount_rates (
    id INT AUTO_INCREMENT PRIMARY KEY,
    min_order_amount DECIMAL(10, 2) NOT NULL,
    discount_rate DECIMAL(5, 2) NOT NULL
);

-- Tabla de ingresos diarios
CREATE TABLE daily_revenue (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE NOT NULL UNIQUE,
    total DECIMAL(10,2) NOT NULL
);


INSERT INTO discount_rates (min_order_amount, discount_rate) VALUES
(50.00, 5.00),
(100.00, 10.00);

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
INSERT INTO inventory (name, price, type) VALUES 
('Pizza', 8.50, 'tapa'),
('Pasta', 6.00, 'tapa'),
('Ensalada', 4.00, 'tapa'),
('Bebida', 2.50, 'bebida');

-- Insertar algunos datos de ejemplo en la tabla tables
INSERT INTO tables (table_number) VALUES 
(1),
(2),
(3);

-- Insertar algunos datos de ejemplo en la tabla daily_revenue
INSERT INTO daily_revenue (date, total) VALUES 
('2025-03-26', 58.50);
