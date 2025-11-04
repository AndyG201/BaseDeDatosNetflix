# Proyecto: BASEFLIX91

## Descripción
Proyecto académico para la asignatura **Bases de Datos I**, que simula una plataforma de streaming tipo Netflix.  
Permite gestionar usuarios, suscripciones, pagos, géneros y premios por fidelidad.

## Integrantes
- Anderson Gamba  
- Marian Castaño  
- Federico Medina  

## Archivos Principales
| Archivo | Descripción |
|----------|-------------|
| `creacion_tablas.sql` | Crea las tablas principales del sistema. |
| `creacion_tablas_relaciones.sql` | Define las relaciones entre entidades. |
| `inserciones.sql` | Inserta los datos iniciales (suscripciones, estados, métodos de pago, premios). |
| `otros.sql` | Limpieza de registros incompletos y consultas del esquema. |

## Base de Datos
- **Nombre del esquema:** `databasesi`
- **Motor:** MySQL
- **Versión recomendada:** 8.0 o superior

## Instrucciones de uso
1. Ejecuta los scripts en este orden:
   1. `creacion_tablas.sql`
   2. `creacion_tablas_relaciones.sql`
   3. `inserciones.sql`
   4. `otros.sql` *(opcional, para limpieza)*

2. Comprueba las tablas creadas:
   ```sql
   SHOW TABLES;
