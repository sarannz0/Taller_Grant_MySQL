-- TALLER


-- 1. Usuario `Admin`
CREATE USER 'admin'@'%' IDENTIFIED BY 'contr4s3n4';
-- Permisos otorgados
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION;


-- 2. Usuario: `cajero`
CREATE USER 'cajero'@'%' IDENTIFIED BY 'contr4s3n4';
GRANT SELECT, INSERT, UPDATE ON ecommerce_zapatos.pedido TO 'cajero'@'%';
GRANT SELECT, INSERT, UPDATE ON ecommerce_zapatos.detalle_pedido TO 'cajero'@'%';
GRANT SELECT, INSERT, UPDATE ON ecommerce_zapatos.factura TO 'cajero'@'%';
GRANT SELECT ON ecommerce_zapatos.cliente TO 'cajero'@'%';
GRANT SELECT ON ecommerce_zapatos.producto TO 'cajero'@'%';
GRANT SELECT ON ecommerce_zapatos.combo TO 'cajero'@'%';


-- 3. Usuario: `analista`
CREATE USER 'analista'@'%' IDENTIFIED BY 'contr4s3n4';
GRANT SELECT, SHOW VIEW, SHOW TABLES ON ecommerce_zapatos.* TO 'analista'@'%';
GRANT EXECUTE ON FUNCTION ecommerce_zapatos.* TO 'analista'@'%';

-- 4. Usuario: `Desarrollador `

CREATE USER 'desarrollador'@'%' IDENTIFIED BY 'contr4s3n4';
GRANT CREATE TEMPORARY TABLES, LOCK TABLES, ALTER, DROP, INDEX ON ecommerce_zapatos.* TO 'desarrollador'@'%';



-- ... Limitar sus consultas a un `MAX_QUERIES_PER_HOUR` de 50 exceptuando al usuario `Desarrollador`.

ALTER USER 'admin'@'%' WITH MAX_QUERIES_PER_HOUR 50;
ALTER USER 'cajero'@'%' WITH MAX_QUERIES_PER_HOUR 50;
ALTER USER 'analista'@'%' WITH MAX_QUERIES_PER_HOUR 50;
ALTER USER 'desarrollador'@'%' WITH MAX_QUERIES_PER_HOUR 0;




-- ... Asignar persmisos al usuario en donde permita: Ver sus pedidos (usando procedimiento)
DELIMITER $$
CREATE PROCEDURE VerMisPedidos(IN p_id_cliente INT)
BEGIN
  SELECT * FROM pedido WHERE id_cliente = p_id_cliente;
END $$
DELIMITER ;
GRANT EXECUTE ON PROCEDURE ecommerce_zapatos.VerMisPedidos TO 'cajero'@'%', 'analista'@'%';



-- ... Asignar persmisos al usuario en donde permita: Calcular total mensual (usando funciones)
DELIMITER $$
CREATE FUNCTION CalcularTotalMensual(p_mes INT, p_anio INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
  DECLARE total_mes DECIMAL(10,2);
  SELECT SUM(total) INTO total_mes
  FROM factura
  WHERE MONTH(fecha) = p_mes AND YEAR(fecha) = p_anio;
  RETURN IFNULL(total_mes, 0);
END $$
DELIMITER ;

GRANT EXECUTE ON FUNCTION ecommerce_zapatos.CalcularTotalMensual TO 'analista'@'%', 'cajero'@'%';
FLUSH PRIVILEGES;