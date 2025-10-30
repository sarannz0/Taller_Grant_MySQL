## Taller GRANT MYSQL2

1. Crear usuarios para el `Sistema de Ecommerce Zapatos`

   1. Usuario `Admin`

      1. **Responsabilidades:** gestión completa del sistema, administración de usuarios, configuración de replicación.

      2. #### Permisos otorgados:

         - `ALL PRIVILEGES` + `GRANT OPTION`
         - Replicación y operaciones críticas

   2. Usuario: `cajero`

      1. **Responsabilidades:** registrar pedidos y ventas desde el punto de venta.

      2. #### Permisos otorgados:

         - `SELECT`, `INSERT`, `UPDATE` en `pedido`, `detalle_pedido`, `factura`
         - `SELECT` en `cliente`, `producto`, `presentacion`, `combo`

   3. Usuario: `analista`

      1. **Responsabilidades:** generar reportes, consultar ventas, analizar productos más vendidos.

      2. #### Permisos otorgados:

         - `SELECT`, `SHOW VIEW`, `SHOW TABLES`
         - Permiso para ejecutar funciones de reporte (`EXECUTE`)

   4. Usuario: `Desarrollador `

      1. **Responsabilidades:** probar todas las funcionalidades del sistema.

      2. #### Permisos a otorgados:

         - `CREATE TEMPORARY TABLES`
         - `LOCK TABLES`
         - `ALTER` y `DROP`
         - `INDEX`

2. Limitar sus consultas a un `MAX_QUERIES_PER_HOUR` de 50 exceptuando al usuario `Desarrollador`.

3. Asignar persmisos al usuario en donde permita: Ver sus pedidos (usando procedimiento)

4. Asignar persmisos al usuario en donde permita: Calcular total mensual (usando funciones)