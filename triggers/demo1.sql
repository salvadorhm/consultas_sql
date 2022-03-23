.headers on
.mode column

DROP TABLE productos;
DROP TABLE detalle_ventas;

CREATE TABLE productos(
    id_producto integer PRIMARY KEY,
    nombre text,
    existencias integer
);

INSERT INTO productos(nombre,existencias)
VALUES
('Producto 1',10),
('Producto 2',10);

CREATE TABLE detalle_ventas (
    id_detalle_ventas integer PRIMARY KEY,
    fecha date,
    id_producto integer,
    cantidad integer
);

CREATE TRIGGER actualizar_existencias
    AFTER INSERT ON detalle_ventas
BEGIN
    UPDATE productos
    SET existencias = existencias - new.cantidad
    WHERE id_producto = new.id_producto;
END;


SELECT * FROM productos;

INSERT INTO detalle_ventas (fecha,id_producto,cantidad)
VALUES
('2021/01/01',1,8),
('2021/01/01',1,2),
('2021/02/02',2,16);

SELECT * FROM detalle_ventas;
SELECT * FROM productos;

