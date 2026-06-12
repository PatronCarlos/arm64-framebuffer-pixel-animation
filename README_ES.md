# Animación de Píxeles sobre Framebuffer en ARM64


🇬🇧 English version: [README.md](README.md)
mas info sobre el proyecto:📄 [leer mas](./ejercicio1/README.md)

## Descripción General

Este proyecto implementa un sistema de gráficos y animación basado en framebuffer completamente desarrollado en Assembly ARM64.

El programa renderiza y anima una escena medieval protagonizada por un caballero frente a un castillo. Todos los elementos gráficos son dibujados manualmente mediante escritura directa de píxeles en el framebuffer, sin utilizar bibliotecas gráficas externas.

El proyecto explora conceptos de programación gráfica de bajo nivel, gestión de memoria y arquitectura ARM64 mediante la manipulación directa de un framebuffer ARGB de 32 bits.

Desarrollado como parte de la materia Organización del Computador en la Facultad de Matemática, Astronomía, Física y Computación (FaMAF), Universidad Nacional de Córdoba (UNC).

---

## Vista Previa

![preview](https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExdzV2YTBlanE5OTRnb3Qxb3RydTFicXNvazFtNmJqMmZiMzI3NTkzeCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/BIQHmsMCwdzRYxbZGo/giphy.gif)

La animación representa a un caballero contemplando si debe ingresar a un peligroso castillo medieval. El segundo ejercicio incorpora movimiento y efectos visuales para representar el paso del tiempo y los peligros ocultos dentro del castillo.

---

## Características

* Programación en Assembly ARM64
* Manipulación directa del framebuffer
* Renderizado píxel por píxel
* Primitivas gráficas personalizadas
* Dibujo de líneas horizontales
* Renderizado de rectángulos
* Renderizado de triángulos
* Renderizado de círculos
* Generación de escenas animadas
* Programación gráfica a nivel de memoria
* Emulación de Raspberry Pi mediante QEMU

---

## Sistema Gráfico

El proyecto implementa un conjunto de primitivas gráficas reutilizables:

### Renderizado de Píxeles

Escritura directa de valores de color ARGB en la memoria del framebuffer.

### Líneas

Rutinas para el dibujo de líneas horizontales.

### Rectángulos

Renderizado de rectángulos rellenos.

### Triángulos

Rutinas de rasterización de triángulos.

### Círculos

Algoritmos para el dibujo de círculos.

### Animación

Actualización cuadro por cuadro mediante retardos y redibujado del framebuffer.

---

## Estructura del Proyecto

### app.s

Punto de entrada principal responsable de renderizar la escena final.

### background.s

Rutinas de dibujo del fondo.

### castle.s

Lógica de dibujo y animación del castillo.

### knight.s

Rutinas de dibujo del caballero.

### circle.s

Algoritmos para el dibujo de círculos.

### line.s

Funciones para el dibujo de líneas.

### rectangle.s

Funciones para el dibujo de rectángulos.

### triangle.s

Funciones para el dibujo de triángulos.

### graphics.s

Utilidades gráficas generales.

### utils.s

Funciones auxiliares para la manipulación de píxeles y framebuffer.

### macros.s

Macros de Assembly utilizadas en todo el proyecto.

### start.s

Inicialización del hardware y configuración del framebuffer.

### delay.s

Rutinas de temporización y retardos para la animación.

### eyes.s

Efectos animados para los ojos.

---

## Tecnologías

* Assembly ARM64
* Gráficos por Framebuffer
* Arquitectura Raspberry Pi
* QEMU
* Organización del Computador
* Sistemas Embebidos
* Programación de Bajo Nivel

---

## Ejecución del Proyecto

Compilar y ejecutar con:

```bash
make runQEMU
```

Este comando compila el proyecto y lanza el emulador ARM64.

---

## Configuración de Pantalla

* Resolución: 640x480
* Formato de color: ARGB de 32 bits
* Dirección base del framebuffer almacenada en el registro X0

---

## Contexto Académico

Facultad de Matemática, Astronomía, Física y Computación (FaMAF)

Universidad Nacional de Córdoba (UNC)

Materia Organización del Computador – 2024
