-- Crear un trigger que después de insertar un producto en detalle_ventas, dejando precio_unitario y total_x_producto con un valor de 0, actualice el precio_unitario del producto insertado trayendolo directmente de la tabla productos.

CREATE TRIGGER actualizar_precio_unitario
    AFTER INSERT ON detalle_ventas

BEGIN
    UPDATE detalle_ventas
    SET precio_unitario = (SELECT precio_unitario FROM productos WHERE detalle_ventas.id_producto = productos.id_producto)
    WHERE id_producto = new.id_producto;
END;

SELECT * FROM detalle_ventas;

INSERT INTO detalle_ventas(id_venta,id_producto,cantidad_producto,precio_unitario,total_x_producto)
VALUES(1,1,2,0,0);

SELECT * FROM detalle_ventas;