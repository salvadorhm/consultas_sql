.headers on
.mode column
PRAGMA foreign_keys = ON;

-- DROP TABLE detalle_ventas;
-- DROP TRIGGER actualizar_total_x_producto;

-- CREATE TABLE detalle_ventas(
--     id_detalle_venta integer PRIMARY KEY AUTOINCREMENT,
--     id_venta integer,
--     id_producto integer,
--     cantidad_producto integer,
--     precio_unitario float,
--     total_x_producto float
-- );

CREATE TRIGGER actualizar_total_x_producto
    AFTER INSERT ON detalle_ventas
BEGIN
    UPDATE detalle_ventas
    SET total_x_producto = NEW.cantidad_producto *  NEW.precio_unitario
    WHERE id_detalle_venta = NEW.id_detalle_venta;
END;

INSERT INTO detalle_ventas(id_venta,id_producto,cantidad_producto,precio_unitario,total_x_producto)
VALUES(1,1,5,10,0);
INSERT INTO detalle_ventas(id_venta,id_producto,cantidad_producto,precio_unitario,total_x_producto)
VALUES(1,1,15,10,0);
INSERT INTO detalle_ventas(id_venta,id_producto,cantidad_producto,precio_unitario,total_x_producto)
VALUES(1,1,20,10,0);
INSERT INTO detalle_ventas(id_venta,id_producto,cantidad_producto,precio_unitario,total_x_producto)
VALUES(1,1,18,10,0);

SELECT * FROM detalle_ventas;