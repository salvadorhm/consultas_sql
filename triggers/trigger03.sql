-- Crear un trigger que después de actualizar el detalle_ventas, actualice la total_x_producto con la operación total_x_producto = cantidad_producto * precio_unitario:


CREATE TRIGGER actualizar_total_producto
    AFTER UPDATE ON detalle_ventas

BEGIN
    UPDATE detalle_ventas
    SET total_x_producto = cantidad_producto * precio_unitario
    WHERE id_detalle_venta = new.id_detalle_venta;
END;

SELECT * FROM detalle_ventas;

INSERT INTO detalle_ventas(id_venta,id_producto,cantidad_producto,precio_unitario,total_x_producto)
VALUES(1,2,10,0,0);

SELECT * FROM detalle_ventas;