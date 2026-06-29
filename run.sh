#!/usr/bin/env bash

# Verifica que se pase el archivo de datos como argumento
if [ -z "${1:-}" ]; then
    echo "Usage: $0 <data_file>"
    exit 1
fi

# 1. Extrae y muestra la primera línea (el encabezado) que genera tu script de la Task 6
awk -f task6.awk "$1" | head -n 1

# 2. Toma el resto de las líneas (de la 2 en adelante), las ordena alfabéticamente y las muestra
awk -f task6.awk "$1" | tail -n +2 | LC_ALL=C sort