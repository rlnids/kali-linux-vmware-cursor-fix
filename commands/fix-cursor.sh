#!/bin/bash
# Script para aplicar la configuración correcta del cursor en Kali Linux (VMware)

set -e  # Detener si hay error

echo "🛠️ Creando directorio de configuración..."
sudo mkdir -p /etc/X11/xorg.conf.d

echo "📝 Escribiendo archivo de configuración..."
sudo tee /etc/X11/xorg.conf.d/20-cursor.conf > /dev/null << 'EOF'
Section "Device"
    Identifier "Card0"
    Driver "modesetting"
    Option "SWCursor" "true"
EndSection
EOF

echo "🔄 Reiniciando lightdm..."
sudo systemctl restart lightdm

echo "✅ Listo. Si todo fue bien, el cursor debería aparecer."