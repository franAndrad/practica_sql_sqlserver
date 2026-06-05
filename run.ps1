param(
    [Parameter(Mandatory=$true, Position=0)]
    [string]$ExerciseDir
)

$containerName = "sqlserver_practica"
$saPassword = "TuPassword123!"
$user = "sa"
$toolImage = "mcr.microsoft.com/mssql-tools"

# Verificar que la carpeta existe
if (-not (Test-Path $ExerciseDir)) {
    Write-Host "Error: No existe la carpeta '$ExerciseDir'" -ForegroundColor Red
    exit 1
}

# Verificar que Docker está corriendo
try {
    $null = docker info 2>$null
} catch {
    Write-Host "Error: Docker no está corriendo. Abrí Docker Desktop primero." -ForegroundColor Red
    exit 1
}

$existingContainer = docker ps -a --filter "name=$containerName" --format "{{.Names}}" 2>$null
if ($existingContainer) {
    Write-Host ">>> Eliminando contenedor existente '$containerName'..." -ForegroundColor Yellow
    docker rm -f $containerName > $null 2>&1
}

Write-Host ">>> Levantando contenedor SQL Server..." -ForegroundColor Cyan
docker compose up -d

$networkName = docker inspect -f '{{range $k,$v := .NetworkSettings.Networks}}{{$k}}{{end}}' $containerName 2>$null
if (-not $networkName) {
    Write-Host "Error: no se pudo determinar la red de Docker para el contenedor." -ForegroundColor Red
    exit 1
}

Write-Host ">>> Esperando a que SQL Server esté listo..." -ForegroundColor Cyan
$ready = $false
$attempts = 0
while (-not $ready -and $attempts -lt 30) {
    docker run --rm --network $networkName $toolImage /opt/mssql-tools/bin/sqlcmd -S $containerName -U $user -P $saPassword -Q "SELECT 1" -b > $null 2>&1
    if ($LASTEXITCODE -eq 0) {
        $ready = $true
    } else {
        Start-Sleep -Seconds 2
        $attempts++
        Write-Host "    ... esperando ($attempts/30)" -ForegroundColor Yellow
    }
}

if (-not $ready) {
    Write-Host "Error: SQL Server no se pudo iniciar a tiempo." -ForegroundColor Red
    exit 1
}

Write-Host ">>> SQL Server listo." -ForegroundColor Green

# Buscar archivos .sql, ordenarlos y excluir el 04_queries.sql
$sqlFiles = Get-ChildItem -Path $ExerciseDir -Filter "*.sql" | Sort-Object Name | Where-Object { $_.Name -notlike "04_*" }

if ($sqlFiles.Count -eq 0) {
    Write-Host "No se encontraron archivos .sql en '$ExerciseDir'" -ForegroundColor Red
    exit 1
}

# Extraer nombre de la base de datos del primer script
$databaseName = $null
$firstSqlFile = $sqlFiles | Select-Object -First 1
if ($firstSqlFile) {
    $content = Get-Content $firstSqlFile.FullName -Raw
    if ($content -match "CREATE\s+DATABASE\s+\[?(\w+)\]?") {
        $databaseName = $Matches[1]
    }
}

# Borrar la base de datos si existe para empezar de cero
if ($databaseName) {
    Write-Host ">>> Borrando base de datos '$databaseName' si existe..." -ForegroundColor Yellow
    $dropSql = @"
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'$databaseName')
BEGIN
    ALTER DATABASE [$databaseName] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$databaseName];
END
"@
    $dropSql | docker run --rm --network $networkName -i $toolImage /opt/mssql-tools/bin/sqlcmd -S $containerName -U $user -P $saPassword -d master -i /dev/stdin -b
    Write-Host ">>> Eliminando archivos físicos viejos (si existen)..." -ForegroundColor Yellow
    docker run --rm --network $networkName $toolImage sh -c "rm -f /var/opt/mssql/data/$databaseName.*"
    Write-Host ">>> Base de datos lista para crear." -ForegroundColor Green
}

Write-Host ">>> Ejecutando scripts encontrados en ${ExerciseDir}:" -ForegroundColor Cyan
foreach ($file in $sqlFiles) {
    Write-Host "    - $($file.Name)"
}

foreach ($file in $sqlFiles) {
    Write-Host ">>> Ejecutando: $($file.Name)" -ForegroundColor Cyan
    $content = Get-Content $file.FullName -Raw
    $content = $content -replace '(?m)^\\c.*(?:\r?\n)?', '' -replace 'CURRENT_DATE', 'CONVERT(date, GETDATE())'

    $targetDb = if ($file -eq $firstSqlFile -and $databaseName) { 'master' } else { $databaseName }
    $cmdArgs = @('/opt/mssql-tools/bin/sqlcmd', '-S', $containerName, '-U', $user, '-P', $saPassword)
    if ($targetDb) {
        $cmdArgs += '-d'
        $cmdArgs += $targetDb
    }
    $cmdArgs += @('-i', '/dev/stdin', '-b')

    $content | docker run --rm --network $networkName -i $toolImage $cmdArgs
    if ($LASTEXITCODE -ne 0) {
        Write-Host ">>> Error ejecutando $($file.Name), pero continuando..." -ForegroundColor Yellow
    }
}

Write-Host ""
Write-Host ">>> Listo. Contenedor '$containerName' está corriendo." -ForegroundColor Green

if ($databaseName) {
    Write-Host ">>> Se crearon los objetos en la base de datos '$databaseName'." -ForegroundColor Green
    Write-Host ">>> Para conectarte manualmente usa:" -ForegroundColor Cyan
    Write-Host "    docker run --rm -it --network $networkName $toolImage /opt/mssql-tools/bin/sqlcmd -S $containerName -U $user -P $saPassword -d $databaseName" -ForegroundColor Yellow
} else {
    Write-Host ">>> Para conectarte usa:" -ForegroundColor Cyan
    Write-Host "    docker run --rm -it --network $networkName $toolImage /opt/mssql-tools/bin/sqlcmd -S $containerName -U $user -P $saPassword -d <base_de_datos>" -ForegroundColor Yellow
}
