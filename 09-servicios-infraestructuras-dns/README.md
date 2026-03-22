# Implementación y Troubleshooting de Infraestructura DNS (Bind9)

Este repositorio documenta el despliegue técnico de un servidor de nombres de dominio autoritativo en entorno Ubuntu Server. La resolución de nombres se presenta como un servicio crítico de infraestructura para garantizar la conectividad eficiente y el control de tráfico en redes corporativas.

## Alcance Técnico
1. **Resolución Jerárquica**: Configuración de *Forwarders* para la gestión de consultas externas y optimización de recursividad.
2. **Autoridad de Zona**: Implementación de zonas maestras para dominios internos (`empresa.int`), asegurando la autonomía de la red local y el cumplimiento de estándares IETF.
3. **Optimización de Respuesta**: Configuración de parámetros de TTL y gestión de caché para la reducción de latencia en peticiones recurrentes.

## Metodología de Despliegue
1. **Aprovisionamiento del Servicio**: Instalación de la suite `bind9` y herramientas de diagnóstico de red.
2. **Arquitectura de Configuración**: Definición de directivas globales de seguridad y reenvío en `named.conf.options`.
3. **Validación de Integridad**: Ejecución de auditorías de sintaxis mediante `named-checkconf` y `named-checkzone` para asegurar el cumplimiento normativo antes del paso a producción.

## Resolución de Incidencias (Troubleshooting)
Durante el despliegue, se identificaron y mitigaron las siguientes condiciones de error:
* **Conflicto de mDNS**: Migración del sufijo `.local` a `.int` para evitar colisiones con el protocolo Multicast DNS (RFC 6762).
* **Fallo de Resolución (NXDOMAIN)**: Corrección de directivas `$ORIGIN` y validación de FQDN (puntos finales), garantizando la autoridad del servidor sobre la zona configurada.

## Artefactos de Configuración y Evidencia
* **named.conf.local**: Definición técnica de la zona maestra.
* **db.empresa.int**: Base de datos de registros de autoridad (A, NS, SOA).
* **resolucion_test.txt**: Log de respuesta exitosa con estado `NOERROR`.
* **audit_dns.txt**: Informe de validación sintáctica del servicio.
