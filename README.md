# Práctica de SQL con Docker (SQL Server)

Practicá SQL de forma aislada usando SQL Server en Docker.

## Requisitos obligatorios

- Docker Desktop instalado y corriendo.
- VS Code con **ambas** extensiones:
  1. **MSSQL** / **SQL Server** (mssql) — para ver el esquema y diagramas de la base de datos.
  2. **Database Client** (Weijan Chen): `cweijan.vscode-database-client` — para ejecutar consultas desde el editor.

## Estructura

```
.
├── docker-compose.yml
├── run.ps1
└── ejercicios/<nombre>/
   ├── 01_database.sql     # Creación de la base de datos
   ├── 02_tables.sql       # Creación de tablas
   ├── 03_data.sql         # Inserción de datos
   └── 04_queries.sql      # Consultas / respuestas (NO subir)
```

## Cómo empezar (lo más simple)

1. **Levantar SQL Server, crear BD, tablas y cargar datos** (todo en un solo comando):
   ```powershell
   .\run.ps1 ejercicios\confiteria
   ```
   El script hace `docker compose up -d`, ejecuta `01_database.sql` → `02_tables.sql` → `03_data.sql` (saltea `04_queries.sql`) y deja el contenedor corriendo.

2. **Conectarte desde VS Code** con ambas extensiones:
   - **Host:** `127.0.0.1`
   - **Port:** `1433`
   - **User:** `sa`
   - **Password:** `TuPassword123!`
   - **Database:** `confiteria` (o el nombre del ejercicio)

3. **Abrí `ejercicios/<nombre>/04_queries.sql`** y ejecutá las consultas desde el editor usando **Database Client** (Weijan Chen). Para ver el diagrama / esquema de la base de datos usá la extensión **MSSQL / SQL Server** (mssql).

### Configuración de las extensiones en VS Code

| Extensión MSSQL / SQL Server | Extensión Database Client (Weijan Chen) |
|---|---|
| ![Conexión MSSQL](./conexion_extension_sql_server.png) | ![Conexión Database Client](./conexion.png) |

> **Importante:** los archivos `04_queries.sql` contienen las soluciones y **no deben subirse al repositorio**. Cada alumno ejecuta sus consultas localmente.

## Ejemplo

`01_database.sql`
```sql
CREATE DATABASE confiteria;
```

`02_tables.sql`
```sql
\c confiteria;
CREATE TABLE MOZOS (
    id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);
```

`03_data.sql`
```sql
\c confiteria;
INSERT INTO MOZOS (id, nombre) VALUES (1, 'Juan Perez');
```

`04_queries.sql`
```sql
-- Ejecutá esto desde VS Code con Database Client
SELECT * FROM MOZOS;
```
