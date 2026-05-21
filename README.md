# Práctica de SQL con Docker (SQL Server)

Practicá SQL de forma aislada usando SQL Server en Docker. Cada ejercicio tiene su propia base de datos y scripts.

## Requisitos

- Docker Desktop instalado y corriendo.
- PowerShell, Git Bash o CMD.
- (Opcional) VS Code con alguna de estas extensiones:
  - **MSSQL** / **SQL Server** (mssql) o **Azure Data Studio**.
  - **Database Client** (Weijan Chen): `cweijan.vscode-database-client`

## Estructura

```
.
├── docker-compose.yml
├── run.ps1 / run.sh / run.bat
└── ejercicios/<nombre>/
   ├── 01_database.sql
   ├── 02_tables.sql
   ├── 03_data.sql
   └── 04_queries.sql   # Archivo de consultas / respuestas (NO subir)
```

## Cómo usarlo

1. Levantar el contenedor (SQL Server):

   ```bash
   docker compose up -d
   ```

2. Ejecutar un ejercicio:

   ```powershell
   # PowerShell
   .\run.ps1 ejercicios\confiteria

   # Git Bash / WSL
   ./run.sh ejercicios/confiteria

   # CMD
   run.bat ejercicios\confiteria
   ```

3. Conectarte manualmente (ejemplos):
   - Desde un cliente en el host (SSMS, Azure Data Studio):
     - **Host:** `localhost`
     - **Port:** `1433`
     - **User:** `sa`
     - **Password:** `TuPassword123!`
     - **Database:** nombre del ejercicio (ej. `confiteria`)

   - Usando `docker exec` + `sqlcmd` dentro del contenedor:

     ```powershell
     # Obtener el nombre del contenedor (si no lo sabés)
     docker ps

     # Ejecutar un comando simple dentro del contenedor
     docker exec -it <container_name> /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "TuPassword123!" -Q "SELECT name FROM sys.databases;"
     ```

**Credenciales de ejemplo:** usuario `sa`, contraseña `TuPassword123!`.

## Conectar desde VS Code / clientes GUI

- SQL Server Management Studio (SSMS) o Azure Data Studio: crear conexión con las credenciales arriba.
- En la extensión **Database Client** de VS Code: elegir **SQL Server / MSSQL** o usar la extensión oficial `mssql`.

Consejo importante: los archivos `04_queries.sql` contienen las consultas/soluciones individuales. Estos archivos NO deben subirse al repositorio; en su lugar cada alumno debe ejecutar las consultas localmente y subir sólo los scripts de creación/tablas/datos si corresponde.

Opciones para ejecutar `04_queries.sql` localmente:

- Abrir `ejercicios/<nombre>/04_queries.sql` en SSMS o Azure Data Studio y ejecutar las sentencias contra la base de datos del ejercicio.
- Usar `sqlcmd` dentro del contenedor (copiando el archivo al contenedor o montando el volumen):
  ```powershell
  # Ejecutar un script dentro del contenedor (ejemplo)
  docker exec -i <container_name> /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "TuPassword123!" -d confiteria -i /ruta/en/el/contenedor/04_queries.sql
  ```

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
-- Este archivo contiene las consultas de la práctica. Ejecutalo localmente contra la BD del ejercicio.
SELECT * FROM MOZOS;
```
