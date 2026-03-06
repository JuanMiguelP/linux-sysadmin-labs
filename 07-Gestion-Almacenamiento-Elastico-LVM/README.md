# Gestión de Almacenamiento Lógico y Escalabilidad (LVM)

## Descripción del Proyecto

Este módulo implementa una solución de almacenamiento elástico sobre Ubuntu Server (KVM) para gestionar recursos de disco de forma dinámica. El objetivo principal es garantizar que el servidor pueda ampliar su capacidad de almacenamiento sin interrupción de servicios ni pérdida de datos ante el crecimiento de información.

## Objetivos Técnicos Implementados

1. **Abstracción de Hardware**: Configuración de volúmenes físicos (PV) y grupos de volúmenes (VG) para desvincular el sistema de archivos del particionado rígido tradicional.
2. **Segmentación Flexible**: Creación de volúmenes lógicos (LV) con asignación de espacio bajo demanda.
3. **Expansión en Caliente (Online Resize)**: Implementación de la lógica de ampliación del sistema de archivos sin necesidad de desmontar unidades o reiniciar el sistema.

## Procedimiento Técnico

### 1. Inicialización de Almacenamiento
Se preparó el nuevo dispositivo de bloques para integrarlo en la estructura de gestión lógica:

* **Comando**: `sudo pvcreate /dev/sdb && sudo vgcreate vg_servidor /dev/vdb`

### 2. Creación de Volumen Lógico
Se asignó espacio dedicado para datos críticos del servidor:

* **Comando**: `sudo lvcreate -L 5G -n lv_datos vg_servidor`

### 3. Verificación de Escalabilidad
Validación de la capacidad de expansión del volumen para entornos de alta disponibilidad:

* **Comando**: `sudo lvextend -L +2G /dev/vg_servidor/lv_datos && sudo resize2fs /dev/vg_servidor/lv_datos`
## Estructura de Archivos

* `LÉAME.md` : Documentación técnica del proyecto.
* `verificacion.txt` : Registro de la jerarquía LVM (pvs, vgs, lvs).
