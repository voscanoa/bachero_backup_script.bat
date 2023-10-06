@echo off
setlocal enabledelayedexpansion

REM Establece la ruta de 7-Zip (ajusta la ruta según tu instalación)
set "zipPath=C:\Program Files\7-Zip\7z.exe"

REM Establece la carpeta donde se encuentran los archivos
set "sourceFolder=D:\SYGNUS BACKUP\SEG"

REM Establece la carpeta donde se moveran los archivos
set "destinationFolder=\\ELPTSERVER\Sygnus\SEG"

REM Obtiene la fecha actual en el formato YYYY-MM-DD
for /f "tokens=1-3 delims=/" %%a in ('date /t') do (
    set "currentDate=%%c_%%a_%%b"
)

REM Obtiene la fecha actual en el formato YYYY-MM-DD
for /f "tokens=1-3 delims=/" %%a in ('date /t') do (
    set "currentDate=%%c-%%a-%%b"
)

REM Crea la carpeta de registro (log) si no existe
if not exist "%sourceFolder%\log" (
    mkdir "%sourceFolder%\log"
)
REM Cambia el directorio actual al directorio de origen
cd %sourceFolder%

REM Verificar que 7-Zip esta instalado
if not exist "%zipPath%" (
    echo %date% %time% - Error: 7-Zip no está instalado correctamente. >> "%sourceFolder%\log\Error_%currentDate%.txt"
    exit /b 1
)

REM Verifica si existen archivos en la carpeta antes de continuar
if not exist "%sourceFolder%\*.xlsx" (
    echo [%date% %time%] No se encontraron archivos de respaldo en la carpeta "%sourceFolder%". >> "%sourceFolder%\Error_%currentDate%.txt"
    exit /b 1
) else (
    echo [%date% %time%] Se encontraron archivos de respaldo en la carpeta "%sourceFolder%". >> "%sourceFolder%\log\BackupSEG_%currentDate%.txt"
)


REM Comprime, mueve, elimina y registra cada archivo
for %%i in ("%sourceFolder%\*.xlsx") do (
    "%zipPath%" a -tzip "%%~ni.zip" "%%i"
	echo [%date% %time%] Archivo "%%~ni" se comprimió correctamente. >> "%sourceFolder%\log\BackupSEG_%currentDate%.txt"
	
    move "%%~ni.zip" "%destinationFolder%"
	echo [%date% %time%] Archivo "%%~ni" se movió exitosamente a la carpeta "%destinationFolder%". >> "%sourceFolder%\log\BackupSEG_%currentDate%.txt"
        
    REM del "%%i"
    REM echo [%date% %time%] Archivo "%%~ni" fue eliminado de la carpeta "%sourceFolder%". >> "%sourceFolder%\log\BackupSEG_%currentDate%.txt"
) 
echo [%date% %time%] El respaldo fue finalizado exitosamente. >> >> "%sourceFolder%\log\BackupSEG_%currentDate%.txt"

endlocal