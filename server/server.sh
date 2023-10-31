#!/bin/bash

# Definir el puerto
PORT=9000

# Comprobar si el puerto está en uso y liberarlo si es necesario
echo "Comprobando si el puerto $PORT está en uso..."
if [ "$(lsof -t -i :$PORT)" ]; then
  echo "El puerto $PORT está en uso. Deteniendo el proceso en ese puerto..."
  fuser -k -n tcp $PORT
fi

# Cambiar al directorio de construcción web
cd /app/build/web/

# Iniciar el servidor web en el puerto especificado
echo "Iniciando el servidor en el puerto $PORT..."
python3 -m http.server $PORT
