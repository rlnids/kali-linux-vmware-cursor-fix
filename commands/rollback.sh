#!/bin/bash
# Elimina la configuración del cursor y restaura el estado anterior

echo "🗑️ Eliminando archivo de configuración..."
sudo rm -f /etc/X11/xorg.conf.d/20-cursor.conf

echo "🔄 Reiniciando lightdm..."
sudo systemctl restart lightdm

echo "✅ Configuración eliminada. El cursor volverá al estado anterior (puede que siga invisible)."