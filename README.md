Un script en Bash para parsear y limpiar la salida de archivos de puertos, mostrando únicamente los puertos abiertos y sus servicios asociados de forma clara y colorida en la terminal, es ideal para analizar rápidamente resultados de escaneos de puertos y obtener solo la información relevante.

# Características:
- Extrae automáticamente los puertos abiertos de un archivo especificado.

- Muestra el puerto y el servicio correspondiente de manera legible.

- Colores en la terminal para una visualización rápida.

- Manejo de interrupciones con Ctrl+C.

- Cuenta con un panel de ayuda:
<img width="1372" height="367" alt="image" src="https://github.com/user-attachments/assets/80499c4b-75c0-4432-817b-5d707aafdb1f" />

# Instalación

Clonar el repositorio:

    git clone https://github.com/avivyap/portsClean.sh.git

Dar permisos de ejecucion

    cd portsClean.sh
    chmod +100 portsClean.sh

Ejecutar el script

    ./portsClean.sh -f tu_archivo_de_puertos

#Output

Asi es como se representan los datos una vez son tratados por esta herramienta

<img width="1217" height="790" alt="image" src="https://github.com/user-attachments/assets/df18707f-8152-4cb8-80f9-4041f345a4d9" />





