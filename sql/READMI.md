Proyecto: Sistema de Gestión de Contenidos Streaming

Descripción
Este proyecto académico fue desarrollado para la asignatura Bases de Datos I.
Simula una plataforma de streaming similar a Netflix, permitiendo gestionar usuarios, suscripciones, pagos, géneros y premios por fidelidad.

El sistema está diseñado bajo principios de normalización (hasta 3FN) y sigue buenas prácticas de modelado relacional.

Integrantes
- Anderson Gamba
- Marian Castaño
- Federico Medina

Estructura del Proyecto
Archivo | Descripción
----------------------------------------------
creacion_tablas.sql             | Contiene las sentencias CREATE TABLE para generar las tablas principales del sistema.
creacion_tablas_relaciones.sql  | Define las relaciones entre las entidades mediante claves foráneas.
inserciones.sql                 | Incluye los datos iniciales del sistema (suscripciones, estados, métodos de pago, premios, etc.).
otros.sql                       | Contiene consultas adicionales y scripts de mantenimiento o limpieza de datos.

Información de la Base de Datos
- Nombre del esquema: databasesi
- Motor de base de datos: MySQL
- Versión recomendada: 8.0 o superior

El diseño busca garantizar la integridad referencial y la eficiencia en las consultas más comunes del sistema.

Instrucciones de Uso
1. Crea el esquema:
   CREATE DATABASE databasesi;
   USE databasesi;

2. Ejecuta los scripts en el siguiente orden:
   1. creacion_tablas.sql
   2. creacion_tablas_relaciones.sql
   3. inserciones.sql
   4. otros.sql (opcional, para tareas de limpieza o validación)

3. Verifica la creación de las tablas:
   SHOW TABLES;

4. Explora los datos insertados:
   SELECT * FROM usuario;
   SELECT * FROM suscripcion;
   SELECT * FROM pago;

Consideraciones Técnicas
- Las claves primarias y foráneas se implementan según las dependencias funcionales establecidas en el modelo lógico.
- Se aplicaron restricciones NOT NULL, UNIQUE y CHECK donde corresponde.
- Las relaciones están diseñadas bajo un enfoque uno a muchos y muchos a muchos cuando es necesario.
- Se recomienda ejecutar los scripts desde MySQL Workbench o DBeaver para una correcta visualización.
