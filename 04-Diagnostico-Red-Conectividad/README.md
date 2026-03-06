# Diagnóstico de Red y Conectividad - Servidor Linux

Este módulo documenta las tareas de verificación de red y resolución de incidencias (troubleshooting) realizadas para asegurar la comunicación del servidor en un entorno de red local e internet.

## Descripción del Escenario
Como administrador de sistemas, se requiere validar la configuración de red del servidor tras una actualización de infraestructura, asegurando que el direccionamiento IP sea correcto y que exista conectividad con el Gateway y servicios externos.

## Objetivos Técnicos Implementados
1. **Análisis de Interfaces**: Identificación de direccionamiento lógico (IP) y físico (MAC) de los adaptadores activos.
2. **Prueba de Enrutamiento**: Verificación de los saltos de red (**Hops**) para detectar posibles cuellos de botella o cortes.
3. **Validación de Conectividad**: Comprobación de latencia y estado de los servicios esenciales de red.

## Procedimiento Técnico

### 1. Auditoría de Interfaces
Se ejecutó el comando para obtener el estado detallado de las tarjetas de red y confirmar la asignación por DHCP:
* **Comando**: `ip addr show > red_info.txt`

### 2. Verificación de Saltos de Red
Para analizar la ruta que siguen los paquetes hacia el exterior y confirmar el funcionamiento del Gateway:
* **Comando**: `tracepath 8.8.8.8 > ruta_red.txt`

### 3. Test de Conectividad y Latencia
Validación de respuesta del DNS externo con un límite de paquetes para el reporte:
* **Comando**: `ping -c 4 8.8.8.8 >> verificacion_red.txt`

## Estructura de Archivos
* `red_info.txt`: Informe detallado de direcciones IP y MAC.
* `ruta_red.txt`: Registro de los saltos de red detectados.
* `verificacion_red.txt`: Resultado de las pruebas de conectividad (ping).
* `PRUEBAS.md`: Log de comandos ejecutados y resultados obtenidos.
