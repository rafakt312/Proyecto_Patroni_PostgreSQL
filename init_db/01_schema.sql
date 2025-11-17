-- Este script se conectará a la base de datos 'proyecto_ha'
-- definida en el docker-compose (POSTGRESQL_DB)
-- y será ejecutado por el usuario 'demo_user' (POSTGRESQL_USER).

CREATE TABLE IF NOT EXISTS clientes (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    registro TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS productos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2)
);

CREATE TABLE IF NOT EXISTS pedidos (
    id SERIAL PRIMARY KEY,
    cliente_id INT REFERENCES clientes(id),
    producto_id INT REFERENCES productos(id),
    cantidad INT,
    fecha TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

-- Insertar datos de ejemplo
INSERT INTO clientes (nombre, email) VALUES ('Ana Gomez', 'ana.gomez@email.com');
INSERT INTO productos (nombre, precio) VALUES ('Teclado', 80.00);
INSERT INTO pedidos (cliente_id, producto_id, cantidad) VALUES (1, 1, 2);