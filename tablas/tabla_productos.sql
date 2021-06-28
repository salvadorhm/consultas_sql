CREATE TABLE productos(
    id_producto integer PRIMARY KEY AUTOINCREMENT,
    producto varchar(50),
    precio_unitario float
);

INSERT INTO productos(producto,precio_unitario)
VALUES
('Lápiz',5),
('Libreta',20);

SELECT * FROM productos;