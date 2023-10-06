# Script de Respaldo y Compresión utilizando 7-Zip

Este script de Windows Batch (archivo .bat) está diseñado para realizar una tarea de respaldo y compresión utilizando la herramienta 7-Zip. El objetivo principal de este script es respaldar archivos con extensión ".bak" desde una carpeta de origen a una carpeta de destino, comprimirlos en archivos ZIP y registrar el proceso.

## Requisitos

Asegúrate de cumplir con los siguientes requisitos antes de ejecutar este script:

1. Tener instalado 7-Zip en la ruta correcta. Debes ajustar la variable `zipPath` en el script según la ubicación de tu instalación de 7-Zip.

2. Tener configuradas las rutas de las carpetas de origen (`sourceFolder`) y destino (`destinationFolder`) según tus necesidades.

3. El script está diseñado para respaldar archivos con extensión ".bak". Asegúrate de que existan archivos con esta extensión en la carpeta de origen.

## Uso

1. Ejecuta el archivo .bat para iniciar el proceso de respaldo y compresión.

2. El script verificará si 7-Zip está instalado correctamente y si existen archivos en la carpeta de origen antes de continuar.

3. Para cada archivo .bak encontrado en la carpeta de origen, el script realizará las siguientes acciones:
   - Comprimirá el archivo en un archivo ZIP con el mismo nombre.
   - Moverá el archivo ZIP a la carpeta de destino.
   - Registrará las acciones realizadas en un archivo de registro.

4. El archivo de registro contendrá información sobre el proceso, incluyendo la fecha y hora de cada acción.

## Archivos de Registro

El script genera varios archivos de registro:
- `Error_YYYY-MM-DD.txt`: Registra errores relacionados con la instalación de 7-Zip o la falta de archivos en la carpeta de origen.
- `BackupSEG_YYYY-MM-DD.txt`: Registra las acciones realizadas durante el proceso de respaldo y compresión.

## Notas Importantes

- Asegúrate de realizar pruebas y adaptar el script según tus necesidades antes de utilizarlo en un entorno de producción.

- Ten en cuenta que el script incluye líneas de código comentadas (`REM`) para eliminar los archivos originales después de la compresión. Si deseas mantener los archivos originales, elimina o comenta estas líneas.

## Licencia

Este script se proporciona tal cual, sin garantías de ningún tipo. Siéntete libre de utilizarlo y modificarlo según tus necesidades.
