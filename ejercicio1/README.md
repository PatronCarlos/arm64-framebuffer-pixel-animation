# Laboratorio 2 de Organización del Computador - 2024 - FAMAF

Tanto el ejercicio 1 como el ejercicio 2 representan a un caballero que reflexiona antes de entrar a un castillo medieval lleno de peligros.  

El tiempo que pasa y los peligros en el interior se perciben en el ejercicio 2.  

![preview](https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExdzV2YTBlanE5OTRnb3Qxb3RydTFicXNvazFtNmJqMmZiMzI3NTkzeCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/BIQHmsMCwdzRYxbZGo/giphy.gif)

### Integrantes

* Beretta, José María  
* Patrón, Carlos Antonio   
* Yorbandi, Selien Xavier   

### Descripción general sobre el funcionamiento

El programa utiliza varias funciones para manipular el framebuffer, permitiendo dibujar píxeles individuales, líneas horizontales, rectángulos, triángulos y círculos.  

Cada función maneja adecuadamente la pila para asegurar la integridad de los datos y el flujo del programa. Las coordenadas y dimensiones especificadas se traducen en direcciones de memoria donde se almacenan los colores, logrando así el dibujo de las formas en la pantalla.  

Este enfoque modular permite flexibilidad y reutilización del código para diversas tareas de dibujo, optimizando el proceso gráfico en sistemas embebidos o cualquier aplicación que requiera manipulación directa de píxeles en ARM64.  

Cabe destacar que, aunque existe un mecanismo para seleccionar entre el buffer principal y un prebuffer, la implementación actual no utiliza el prebuffer, limitándose a trabajar exclusivamente con el buffer principal. Esto simplifica el código pero deja espacio para futuras optimizaciones y extensiones donde el prebuffer podría ser útil para operaciones gráficas más complejas o para la implementación de doble buffering para mejorar la eficiencia y la capacidad de respuesta de las operaciones de dibujo.

### Aclaración

La velocidad de la animación depende de la capacidad de la computadora . 
No se ve igual en los procesadores de los tres integrantes.  
  
Si notan muy lenta la animación, pueden eliminar un delay en la línea 270-274, castle.s

## Estructura  

* **[app.s](app.s)**: Este archivo contiene la aplicación principal que utiliza las funciones gráficas definidas en otros archivos para renderizar gráficos en pantalla. Todo el hardware ya está inicializado anteriormente.
* **[background.s](background.s)**: Contiene los datos y la lógica para dibujar el fondo de la pantalla.
* **[castle.s](castle.s)**: Contiene los datos y la lógica para dibujar un castillo, así como la animación asociada.
* **[circle.s](circle.s)**: Implementa la lógica para dibujar círculos en el buffer gráfico.
* **[graphics.s](graphics.s)**: Contiene funciones gráficas generales y utilidades para la manipulación del buffer gráfico.
* **[knight.s](knight.s)**: Contiene los datos y la lógica para dibujar un caballero.
* **[line.s](line.s)**: Implementa la lógica para dibujar líneas horizontales en el buffer gráfico.
* **[macros.s](macros.s)**: Define macros utilizadas en los archivos de ensamblador para simplificar el código y mejorar la legibilidad.
* **[rectangle.s](rectangle.s)**: Implementa la lógica para dibujar rectángulos en el buffer gráfico.
* **[start.s](start.s)**: Este archivo realiza la inicialización del hardware.
* **[triangle.s](triangle.s)**: Implementa la lógica para dibujar triángulos en el buffer gráfico.
* **[utils.s](utils.s)**: Contiene funciones utilitarias esenciales para el dibujado de píxeles y el cálculo de sus direcciones de memoria.
* **[Makefile](Makefile)**: Archivo que describe cómo construir el software (qué ensamblador utilizar, qué salida generar, etc).
* **[memmap](memmap)**: Este archivo contiene la descripción de la distribución de la memoria del programa y dónde colocar cada sección.


### Uso

* Configuración de pantalla: `640x480` pixels, formato `ARGB` 32 bits.
* El registro `X0` contiene la dirección base del FrameBuffer (Pixel 1).
* El código de cada consigna debe ser escrito en el archivo _app.s_.
* El archivo _start.s_ contiene la inicialización del FrameBuffer **(NO EDITAR)**, al finalizar llama a _app.s_.
* El código de ejemplo pinta toda la pantalla un solo color.

El archivo _Makefile_ contiene lo necesario para construir el proyecto.
Se pueden utilizar otros archivos **.s** si les resulta práctico para emprolijar el código y el Makefile los ensamblará.

**Para correr el proyecto ejecutar**

```bash
$ make runQEMU
```
Esto construirá el código y ejecutará qemu para su emulación.

Si qemu se queja con un error parecido a `qemu-system-aarch64: unsupported machine type`, prueben cambiar `raspi3` por `raspi3b` en la receta `runQEMU` del **Makefile** (línea 23 si no lo cambiaron).

## Como correr qemu y gcc usando Docker containers

Los containers son maquinas virtuales livianas que permiten correr procesos individuales como el qemu y gcc.

Para seguir esta guia primero tienen que instala docker y asegurarse que el usuario que vayan a usar tenga permiso para correr docker (ie dockergrp) o ser root

### Linux
 * Para construir el container hacer
```bash
docker build -t famaf/rpi-qemu .
```
 * Para arrancarlo
```bash
xhost +
cd rpi-asm-framebuffer
docker run -dt --name rpi-qemu --rm -v $(pwd):/local --privileged -e "DISPLAY=${DISPLAY:-:0.0}" -v /tmp/.X11-unix:/tmp/.X11-unix -v "$HOME/.Xauthority:/root/.Xauthority:rw" famaf/rpi-qemu
```
 * Para correr el emulador y el simulador de I/O
```bash
docker exec -d rpi-qemu make runQEMU
docker exec -it rpi-qemu make runGPIOM
```
 * Para terminar el container
```bash
docker kill rpi-qemu
```

### MacOS
En MacOS primero tienen que [instalar un X server](https://medium.com/@mreichelt/how-to-show-x11-windows-within-docker-on-mac-50759f4b65cb) (i.e. XQuartz)
 * Para construir el container hacer
```bash
docker build -t famaf/rpi-qemu .
```
 * Para arrancarlo
```bash
xhost +
cd rpi-asm-framebuffer
docker run -dt --name rpi-qemu --rm -v $(pwd):/local --privileged -e "DISPLAY=host.docker.internal:0" -v /tmp/.X11-unix:/tmp/.X11-unix -v "$HOME/.Xauthority:/root/.Xauthority:rw" famaf/rpi-qemu
```
 * Para correr el emulador y el simulador de I/O
```bash
docker exec -d rpi-qemu make runQEMU
docker exec -it rpi-qemu make runGPIOM
```
 * Para terminar el container
```bash
docker kill rpi-qemu
```
----------------------------------
### Otros comandos utiles
```bash
# Correr el container en modo interactivo
docker run -it --rm -v $(pwd):/local --privileged -e "DISPLAY=${DISPLAY:-:0.0}" -v /tmp/.X11-unix:/tmp/.X11-unix -v "$HOME/.Xauthority:/root/.Xauthority:rw" famaf/rpi-qemu
# Correr un shell en el container
docker exec -it rpi-qemu /bin/bash
```

### README

Este proyecto contiene varios archivos ensamblador ARM64 que permiten la manipulación directa de un buffer gráfico para dibujar formas básicas. A continuación, se proporciona un resumen de lo que contiene cada archivo:


