# Hardening y Auditoría de Acceso SSH

## Descripción del Escenario
Como administrador de sistemas, el objetivo es asegurar el vector de ataque más común: el acceso remoto. Se restringe el acceso SSH para que solo sea posible desde una dirección IP de gestión específica y se desplaza el servicio a un puerto no estándar.

## Conceptos Aplicados
- **Seguridad por Oscuridad:** Cambio del puerto por defecto (22) para mitigar ataques de fuerza bruta automatizados.
- **Control de Acceso (ACL):** Restricción a nivel de aplicación para permitir solo una IP de origen.
- **Firewalling:** Configuración de reglas de filtrado de paquetes para proteger el perímetro del servidor.

## Tareas Realizadas
1. **Configuración de SSH con Vim:** Edición del archivo de configuración del demonio `sshd`.
2. **Hardening de Red:** Implementación de reglas específicas en UFW (Uncomplicated Firewall).
3. **Validación de Conectividad:** Pruebas de acceso desde origen autorizado y denegación desde otros puntos.

## Comandos Clave
- `sudo vim /etc/ssh/sshd_config`: Edición de la configuración del servicio.
- `sudo ufw allow 2022/tcp`: Apertura del nuevo puerto de escucha.
- `sudo ss -tulpn | grep ssh`: Verificación de puertos en escucha.

## Conclusión Técnica
La implementación de estas medidas de seguridad transforma un servidor con configuración por defecto en un entorno endurecido (**hardened**). Los hitos técnicos alcanzados son:

1.  **Reducción de Superficie de Ataque:** Al desplazar el servicio SSH al puerto 2022, se mitigan la mayoría de ataques automatizados que escanean puertos estándar.
2.  **Validación de Identidad por Origen:** Mediante la directiva `AllowUsers`, se establece una restricción donde solo el usuario autorizado desde una IP de gestión específica puede establecer conexión.
3.  **Filtrado Perimetral:** La configuración de UFW asegura que no existan **overlaps** (solapamientos) de reglas, manteniendo una política de "denegar todo por defecto" excepto el tráfico legítimo.
4.  **Trazabilidad:** La automatización mediante el script de auditoría permite monitorizar intentos fallidos, garantizando la visibilidad sobre eventos de seguridad en el sistema.
