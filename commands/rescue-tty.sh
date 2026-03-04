#!/bin/bash
# Script de rescate para cuando la pantalla está negra (ejecutar desde TTY)

echo "⚠️  Eliminando configuración problemática..."
sudo rm -f /etc/X11/xorg.conf.d/20-cursor.conf

echo "🔄 Reiniciando lightdm..."
sudo systemctl restart lightdm

echo "✅ Vuelve a la pantalla gráfica con Ctrl+Alt+F1"