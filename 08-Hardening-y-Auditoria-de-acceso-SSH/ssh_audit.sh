#!/bin/bash
# Script para extraer intentos fallidos de SSH
LOG_FILE="/var/log/auth.log"
OUTPUT="unauthorized_access.log"

echo "--- Reporte de accesos fallidos ($(date)) ---" > $OUTPUT
grep "Failed password" $LOG_FILE >> $OUTPUT
echo "Reporte generado en $OUTPUT"
