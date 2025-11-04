# Proyecto: Sistema de Gestión de Contenidos Streaming

## Descripción
Proyecto académico desarrollado para la asignatura **Bases de Datos I**, que simula una plataforma de streaming similar a **Netflix**.  
Permite gestionar **usuarios, suscripciones, pagos, géneros, series, películas y premios por fidelidad**, integrando todos los componentes de un sistema real de administración de contenido.

El sistema está diseñado bajo principios de **normalización hasta la Tercera Forma Normal (3FN)** y sigue buenas prácticas de **modelado relacional**, asegurando integridad referencial, consistencia de datos y escalabilidad.  
El objetivo principal es comprender el ciclo de vida del diseño de una base de datos relacional, desde el **modelo conceptual (ER)** hasta su **implementación en SQL**.

---

## Integrantes
- **Anderson Gamba**  
- **Marian Castaño**  
- **Federico Medina**

---

## Archivos Principales
| Archivo | Descripción |
|----------|-------------|
| `creacion_tablas.sql` | Contiene las sentencias `CREATE TABLE` que crean las entidades principales del sistema. |
| `creacion_tablas_relaciones.sql` | Define las **relaciones entre tablas** mediante claves foráneas y restricciones. |
| `inserciones.sql` | Inserta los **datos iniciales** del sistema (suscripciones, estados, métodos de pago, premios, etc.). |
| `otros.sql` | Incluye **consultas adicionales**, validaciones y scripts de limpieza o mantenimiento. |
| `consultas_avanzadas.sql` | Contiene ejemplos de consultas con `JOIN`, `GROUP BY`, `HAVING` y subconsultas para análisis de datos. |

---

## Base de Datos
- **Nombre del esquema:** `databasesi`  
- **Motor:** MySQL  
- **Versión recomendada:** 8.0 o superior  
- **Lenguaje SQL estándar:** ANSI SQL  

Este diseño está enfocado en mantener una estructura limpia y coherente, con un manejo adecuado de las dependencias funcionales entre entidades.  
Las relaciones entre entidades se modelaron para reflejar correctamente los escenarios del sistema de streaming, como usuarios con múltiples suscripciones o pagos asociados a diferentes métodos.

---

## Modelo Lógico y Conceptual
El sistema cuenta con las siguientes entidades principales:
- **Usuario:** información básica, correo, teléfono, contraseña y estado de cuenta.  
- **Suscripción:** tipos de plan (básico, estándar, premium), duración y costo.  
- **Pago:** registro de pagos con monto, fecha, método y relación con el usuario.  
- **Premio:** incentivos o bonificaciones por fidelidad.  
- **Género:** clasificación temática de los contenidos disponibles.  

Cada entidad fue normalizada para evitar redundancia y asegurar la integridad de los datos.  
Las relaciones están definidas mediante **claves foráneas** y **restricciones ON DELETE / ON UPDATE**, garantizando la consistencia referencial del modelo.

---

## Tecnologías Utilizadas
| Tecnología | Propósito |
|-------------|------------|
| **MySQL 8.0** | Motor de base de datos relacional. |
| **Workbench / DBeaver** | Herramientas para la administración visual del esquema. |
| **SQL ANSI** | Lenguaje de definición y manipulación de datos. |
| **Git / GitHub** | Control de versiones y documentación del proyecto. |

---

## Estructura del Proyecto
