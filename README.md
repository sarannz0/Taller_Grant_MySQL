## 🧠 Descripción de la Actividad – Taller GRANT

En esta actividad se implementará un esquema de control de acceso para el **Sistema de Ecommerce Zapatos**, aplicando los principios de seguridad y administración de usuarios en MySQL.

El objetivo es **crear diferentes usuarios**, asignarles **permisos específicos según sus roles** dentro del sistema y **controlar sus privilegios de ejecución** sobre procedimientos y funciones.

---

### 🔹 Funcionamiento General

1. **Creación de Usuarios**
   - Se crearán cuatro usuarios (`admin`, `cajero`, `analista`, `desarrollador`) con contraseñas seguras.

2. **Asignación de Privilegios**
   - A cada usuario se le otorgarán permisos específicos sobre las tablas y objetos de la base de datos `EcommerceZapatos`, según sus responsabilidades:
     - **Admin:** control total del sistema (`ALL PRIVILEGES` + `GRANT OPTION`).
     - **Cajero:** permisos para registrar y consultar ventas.
     - **Analista:** permisos de lectura y ejecución de funciones de análisis.
     - **Desarrollador:** permisos de mantenimiento y prueba de estructuras.

3. **Límites de Uso**
   - Se establecerá una **restricción de consultas por hora (`MAX_QUERIES_PER_HOUR = 50`)** para todos los usuarios, excepto para el desarrollador.
   - Esto permite simular una política de control de carga y uso responsable del sistema.

4. **Ejecución de Procedimientos y Funciones**
   - Los usuarios podrán ejecutar funciones o procedimientos específicos que se les otorguen:
     - **Procedimiento `VerMisPedidos`**: permite al usuario ver únicamente sus pedidos.
     - **Función `CalcularTotalMensual`**: calcula el total de ventas por mes y año.
   - Mediante el comando `GRANT EXECUTE`, se autoriza su ejecución a roles determinados (por ejemplo, cajero y analista).

5. **Aplicación de Cambios**
   - Finalmente, se usará `FLUSH PRIVILEGES` para actualizar los privilegios y aplicar todos los cambios realizados.


Al finalizar la actividad, el sistema de base de datos contará con:
- Roles definidos según responsabilidades.
- Permisos ajustados a cada usuario.
- Límites de consultas configurados.
- Ejecución controlada de funciones y procedimientos del sistema.
