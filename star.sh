#!/bin/bash

# Actualizar paquetes e instalar wget y zip
yes|pkg update && yes|pkg upgrade
pkg install -y wget zip

# Verificar si la carpeta 'storage' existe en el directorio actual
if [ ! -d "$HOME/storage" ]; then
    echo "La carpeta 'storage' no existe. Solicitando permisos de almacenamiento..."
    termux-setup-storage
    echo "Por favor, acepta los permisos de almacenamiento y vuelve a ejecutar el script."
    exit 1
fi

# Descargar el archivo y realizar las operaciones solicitadas
echo "Descargando el archivo owokitty.png..."
wget https://cdn.discordapp.com/attachments/1123013395818500159/1263908780358504448/owokitty.png

if [ $? -ne 0 ]; then
    echo "Error al descargar el archivo. Verifica la URL e intenta nuevamente."
    exit 1
fi

echo "Descomprimiendo el archivo owokitty.png..."
unzip owokitty.png

if [ $? -ne 0 ]; then
    echo "Error al descomprimir el archivo. Asegúrate de que el archivo descargado sea un archivo comprimido válido."
    exit 1
fi

echo "Moviendo el archivo star-Road.apk a /sdcard/..."
mv star-Road.apk /sdcard/star-Road.apk

if [ $? -ne 0 ]; then
    echo "Error al mover el archivo. Verifica que el archivo exista y los permisos sean correctos."
    exit 1
fi

echo "Proceso completado exitosamente."
echo "Puedes instalar el APK."
