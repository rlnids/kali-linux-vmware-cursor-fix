# 🖥️ Kali Linux + VMware: Solución al cursor invisible y pantalla negra

¿Tu máquina virtual de Kali Linux en VMware se quedó con pantalla negra después de intentar arreglar el cursor?  
¿Entras al escritorio pero el cursor no aparece?  

Este repositorio contiene la **solución paso a paso**, explicada como si tuvieras 10 años, para que nunca más sufras con este problema. 🚀

---


## 🧠 ¿Qué vas a encontrar aquí?

✅ Explicación de **por qué** ocurre el problema (cursor hardware vs software)  
✅ Cómo **rescatar** el sistema cuando solo ves pantalla negra (usando TTY)  
✅ El **comando correcto** para crear la configuración definitiva  
✅ Archivos `.sh` listos para ejecutar  
✅ Artículo completo para LinkedIn  
✅ Capturas de pantalla reales del proceso (cuando las suba)

---

## 🔧 Cómo usar este repositorio

### Opción 1: Rescate rápido desde TTY (si ya tienes pantalla negra)
```bash
# Accede a la terminal oculta con Ctrl + Alt + F2 (o Fn+F2 en portátiles)
# Inicia sesión y ejecuta:
sudo rm /etc/X11/xorg.conf.d/20-cursor.conf
sudo systemctl restart lightdm
# Vuelve con Ctrl + Alt + F1 (o Fn+F2)