🖥️🆘 Mi odisea con Kali Linux en VMware: cuando el cursor desapareció y la pantalla se volvió NEGRA (y cómo lo resolví después de mil intentos) 😱💻
MELVIN NAVAS SANTOS
MELVIN NAVAS SANTOS
Analista de datos | SQL | SQLite | MYSQL WORKBENCH | PYTHON | IA


2 de marzo de 2026
Hace unos días me lancé a mi primera máquina virtual con Kali Linux en VMware. Todo era felicidad 🎉... hasta que, de repente, el cursor desapareció 👻. Ahí empezó mi pesadilla... y mi mayor aprendizaje. 🚀

🧪 El experimento que salió mal.
Como buen novato 👶, busqué en Google una solución rápida y encontré un "parche mágico" que consistía en pegar este código en la terminal:

bash

echo -e 'Section "Device"\n   Identifier "Card0"\n   Driver "modesetting"\n   Option "SWCursor" "True"\nEndSection' | sudo tee /etc/X11/xorg.conf.d/20-cursor.conf
📝 Pero... ¿QUÉ SIGNIFICA TODO ESO? Vamos a diseccionarlo como en clase de biología 🔬:
Parte 1: El mensaje secreto

echo → Es como si le dijeras al ordenador: "Oye, repite esto que te voy a decir". Como cuando le dictas algo a alguien. 🗣️
-e → Un modificador que le permite entender caracteres especiales como los saltos de línea (\n). 📏
'Section "Device"...' → Esto es el mensaje en sí. Es un texto en un lenguaje especial que el sistema entiende para configurar la pantalla. 📜

Parte 2: El contenido del mensaje (la configuración)

Section "Device" → "Atención, voy a configurar un dispositivo" (en este caso, la tarjeta gráfica). 🎮
Identifier "Card0" → "Voy a llamar 'Card0' a este dispositivo", como si le pusieras nombre a un contacto en el móvil. 📱
Driver "modesetting" → "Usa el controlador genérico llamado 'modesetting' para manejar la pantalla". Es como elegir "controlador estándar" en vez del específico de VMware. 🖼️
Option "SWCursor" "True" → "Activa el cursor por software". O sea: "No uses el cursor de la tarjeta gráfica, que dibuje el cursor el sistema con programas". ✏️
EndSection → "Aquí termina la configuración de este dispositivo". 🔚

Parte 3: El envío del mensaje

| → Este símbolo (tubería) es como una tubería de agua 💧: coge todo lo que hay a la izquierda y lo envía a la derecha.
sudo → "Haz esto como superusuario (administrador)", porque tocar configuraciones del sistema requiere permisos especiales. 👑
tee → Es como un "altavoz" 📢 que guarda lo que recibe en un archivo Y también lo muestra en pantalla.
/etc/X11/xorg.conf.d/20-cursor.conf → La dirección exacta donde se guarda el archivo. Es como si dijeras: "Guarda esto en la carpeta Configuración > Pantalla > archivo cursor.conf". 📂

¿El resultado? 💥 Al reiniciar... PANTALLA NEGRA. ❌😵💫 El escritorio había muerto. Solo veía una terminal en negro. ¡CERO GRÁFICOS! 🚫🖥️

🆘 El momento del pánico... y el descubrimiento
Lo peor era que cada vez que reiniciaba, seguía la pantalla negra. Borré la máquina virtual, la instalé de nuevo... y otra vez el mismo error. 🔁😫

Hasta que descubrí algo que CAMBIÓ TODO: las terminales ocultas. 🕵️♂️✨

Aunque la pantalla esté negra, Linux sigue vivo por dentro. Solo hay que saber llamarlo:

🚪 Cómo acceder al modo rescate:
Presiona Ctrl + Alt + F2 (en portátiles: Ctrl + Alt + Fn + F2 porque las teclas F hacen cosas de brillo y volumen) ☀️🔇
¡Sorpresa! Aparece una terminal en blanco y negro pidiendo usuario y contraseña 📟
Inicias sesión y... ¡tienes el control total del sistema! 💪

Desde ahí, ejecuté:

bash

sudo rm /etc/X11/xorg.conf.d/20-cursor.conf
🔍 ¿Qué hace este comando de rescate?
sudo → "Hola, soy el administrador, hazme caso". 👑
rm → "Remove", es decir, borra el archivo que le diga a continuación. 🗑️
/etc/X11/xorg.conf.d/20-cursor.conf → La dirección exacta del archivo maldito que creé antes y que está causando el apagón gráfico. 📁❌

Después:

bash

sudo systemctl restart lightdm
🔍 ¿Y esto qué hace?
systemctl → Es el "mayordomo" del sistema que controla los servicios que se ejecutan en segundo plano. 🧑🍳
restart lightdm → Le ordeno que reinicie lightdm, que es el servicio encargado de mostrarnos la pantalla de inicio de sesión (el "portero" que nos deja entrar al escritorio gráfico). 🚪✨ Al reiniciarlo, intenta cargar de nuevo la pantalla.

Luego, con Ctrl + Alt + F1 (o Fn+F2) volví al escritorio... ¡y TODO FUNCIONABA! (excepto el cursor, que seguía invisible). 😅

✅ La solución DEFINITIVA 
Después de mucho probar 💪, encontramos la configuración que SÍ funcionó. Presta atención a los DETALLES:

Paso 1: Abrir una terminal (en mi escritorio sin cursor usé Ctrl + Alt + T). ⌨️

Paso 2: Crear la carpeta donde guardaremos nuestra configuración:

bash

sudo mkdir -p /etc/X11/xorg.conf.d
mkdir → "Make directory", crear carpeta. 📂
-p → Un modificador que dice: "si la carpeta ya existe, no des error; y si faltan carpetas intermedias, créalas también". 🛣️
/etc/X11/xorg.conf.d → La ruta donde Linux guarda las configuraciones extra de la pantalla. Es como la carpeta "Mis Documentos" pero para temas gráficos. 🖼️

Paso 3: Abrir el editor de texto para crear el archivo:

bash

sudo nano /etc/X11/xorg.conf.d/20-cursor.conf
nano → Es un editor de texto sencillo que funciona dentro de la terminal. 📝
/etc/X11/xorg.conf.d/20-cursor.conf → El nombre y la ruta del archivo que vamos a crear. El 20- al principio es para que el sistema lo lea antes que otros archivos (por orden alfabético). 🔤

Paso 4: Escribir el contenido CORRECTO (copiar y pegar o escribir exactamente esto):

text

Section "Device"
    Identifier "Card0"
    Driver "modesetting"
    Option "SWCursor" "true"
EndSection
🔬 Analicemos este código bueno línea por línea:
Section "Device" → Igual que antes: "Empiezo a configurar un dispositivo". 🎮
Identifier "Card0" → "Le pongo nombre 'Card0' a este dispositivo". 🏷️
Driver "modesetting" → "Usa el controlador genérico 'modesetting'". Mismo driver que antes. 🖼️
Option "SWCursor" "true" → ¡ATENCIÓN AQUÍ! Antes ponía "True" con T mayúscula. Ahora ponemos "true" con minúscula. Linux es MUY exigente con las mayúsculas y minúsculas. Esto marca la diferencia. ✅
EndSection → "Termino la configuración". 🔚

Paso 5: Guardar y salir del editor:

Ctrl + O → Para guardar (O de "Output"). Te preguntará el nombre, pulsa Enter. 💾
Ctrl + X → Para salir del editor. 🚪

Paso 6: Reiniciar SOLO el gestor gráfico (sin apagar toda la máquina):

bash

sudo systemctl restart lightdm
restart → Le decimos al servicio que se apague y vuelva a encender. 🔄
lightdm → El nombre del servicio gráfico.

La pantalla parpadea, se pone negra un segundo... y al volver, ¡EL CURSOR ESTABA AHÍ! 🥳✨🎉

📖 Lecciones que me llevo (y que tú también deberías saber)
🧯 Las terminales virtuales (Ctrl+Alt+F2) son tu SEGURO DE VIDA. Si la pantalla gráfica falla, ahí puedes rescatar el sistema.
📝 Los logs no muerden: journalctl -u lightdm y /var/log/Xorg.0.log te cuentan EXACTAMENTE qué falló (son como las cajas negaras de los aviones). 🛩️
🐢 Linux es sensible: una mayúscula, una coma de más, y todo puede romperse. Pero cuando entiendes por qué, te sientes como un hacker de verdad. 😎
🔄 No necesitas reiniciar siempre: muchos servicios se pueden reiniciar individualmente, ahorrando tiempo.
🧠 Cada error es una clase gratis: hoy entiendo mejor cómo funciona Xorg, lightdm y los drivers gráficos. Mañana seré yo quien ayude a otros.

🙌 Ahora te toca a ti
Si alguna vez te pasa lo mismo (pantalla negra, cursor invisible, Kali que no arranca), no borres la máquina. Respira hondo, acuérdate de Ctrl+Alt+F2 y aplica estos pasos. 💪

Y si te sirvió, comparte este artículo para que más gente deje de sufrir con el cursor fantasma. 👻❌

#KaliLinuxTips 🐉 #VMware 💻 #ResolverProblemas 🛠️