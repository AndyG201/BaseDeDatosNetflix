\# Proyecto: Sistema de Gestión de Contenidos Streaming



\## Descripción

Proyecto académico para la asignatura \*\*Bases de Datos I\*\*, que simula una plataforma de streaming tipo Netflix.  

Permite gestionar usuarios, suscripciones, pagos, géneros y premios por fidelidad.



El sistema está diseñado bajo principios de \*\*normalización (hasta 3FN)\*\* y sigue buenas prácticas de modelado relacional.



\## Integrantes

\- Anderson Gamba  

\- Marian Castaño  

\- Federico Medina  



\## Archivos Principales

| Archivo | Descripción |

|----------|-------------|

| `creacion\_tablas.sql` | Crea las tablas principales del sistema. |

| `creacion\_tablas\_relaciones.sql` | Define las relaciones entre entidades. |

| `inserciones.sql` | Inserta los datos iniciales (suscripciones, estados, métodos de pago, premios). |

| `otros.sql` | Limpieza de registros incompletos y consultas del esquema. |



\## Base de Datos

\- \*\*Nombre del esquema:\*\* `databasesi`

\- \*\*Motor:\*\* MySQL

\- \*\*Versión recomendada:\*\* 8.0 o superior



El diseño busca garantizar la integridad referencial y la eficiencia en las consultas más comunes del sistema.



\## Instrucciones de uso

1\. Ejecuta los scripts en este orden:

&nbsp;  1. `creacion\_tablas.sql`

&nbsp;  2. `creacion\_tablas\_relaciones.sql`

&nbsp;  3. `inserciones.sql`

&nbsp;  4. `otros.sql` \*(opcional, para limpieza)\*



2\. Comprueba las tablas creadas:

&nbsp;  ```sql

&nbsp;  SHOW TABLES;

&nbsp;  ```



3\. Explora los datos insertados:

&nbsp;  ```sql

&nbsp;  SELECT \* FROM usuario;

&nbsp;  SELECT \* FROM suscripcion;

&nbsp;  SELECT \* FROM pago;

&nbsp;  ```



\## Consideraciones Técnicas

\- Las claves primarias y foráneas se implementan según las dependencias funcionales establecidas en el modelo lógico.  

\- Se aplicaron restricciones \*\*NOT NULL\*\*, \*\*UNIQUE\*\* y \*\*CHECK\*\* donde corresponde.  

\- Las relaciones están diseñadas bajo un enfoque \*\*uno a muchos\*\* y \*\*muchos a muchos\*\* cuando es necesario.  

\- Se recomienda ejecutar los scripts desde \*\*MySQL Workbench\*\* o \*\*DBeaver\*\* para una correcta visualización y gestión del esquema.



