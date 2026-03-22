# Despliegue de Agente de Transporte de Correo (MTA Postfix)

Este repositorio documenta la implementación y securización de un servidor de correo basado en Postfix en entorno Linux. El objetivo es establecer un nodo de mensajería interno capaz de integrarse con la infraestructura DNS previamente configurada.

## Alcance Técnico
1. **Provisionamiento del MTA**: Instalación de Postfix en modo `Internet Site`.
2. **Integración con Infraestructura DNS**: Configuración de registros MX y validación de resolución de nombres.
3. **Flujo de Mensajería SMTP**: Verificación de envío de correo local y gestión de colas.

## Metodología de Implementación
1. **Preparación de Zona DNS**: Adición de registros de autoridad MX y registros de host (A) para el direccionamiento del tráfico de correo.
2. **Configuración de Postfix**: Definición del dominio de correo (`empresa.int`) y restricciones de seguridad iniciales.
3. **Diagnóstico de Servicios**: Auditoría de logs en `/var/log/mail.log` y validación de puertos activos (TCP 25).

## Artefactos de Verificación
* **`mx_resolution.txt`**: Evidencia de la resolución correcta del registro MX.
* **`mail_delivery.txt`**: Log de auditoría que confirma la entrega exitosa de un mensaje de prueba.
* **`main.cf`**: Archivo de configuración principal de Postfix.
