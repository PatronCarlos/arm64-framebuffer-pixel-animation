
# ARM64 Framebuffer Pixel Animation

Spanish version: [README_ES.md](README_ES.md)

## Overview

This project implements a framebuffer-based graphics and animation system entirely in ARM64 Assembly.

The program renders and animates a medieval scene featuring a knight standing before a castle. All graphical elements are drawn manually by writing pixels directly into the framebuffer without relying on external graphics libraries.

The project explores low-level graphics programming, memory management, and ARM64 architecture concepts through direct manipulation of a 32-bit ARGB framebuffer.

Developed as part of the Computer Organization course at FaMAF (Faculty of Mathematics, Astronomy, Physics and Computing), National University of Córdoba (UNC).

---

## Preview

![preview](https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExdzV2YTBlanE5OTRnb3Qxb3RydTFicXNvazFtNmJqMmZiMzI3NTkzeCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/BIQHmsMCwdzRYxbZGo/giphy.gif)

The animation depicts a knight contemplating whether to enter a dangerous medieval castle. The second exercise introduces movement and visual effects to represent the passage of time and the dangers hidden inside the castle.


---

## Features

- ARM64 Assembly programming
- Direct framebuffer manipulation
- Pixel-by-pixel rendering
- Custom graphics primitives
- Horizontal line drawing
- Rectangle rendering
- Triangle rendering
- Circle rendering
- Animated scene generation
- Memory-level graphics programming
- Raspberry Pi emulation with QEMU

---

## Graphics System

The project implements a set of reusable graphical primitives:

### Pixel Rendering

Direct writing of ARGB color values into framebuffer memory.

### Lines

Horizontal line drawing routines.

### Rectangles

Filled rectangle rendering.

### Triangles

Triangle rasterization routines.

### Circles

Circle drawing algorithms.

### Animation

Frame-by-frame updates using delays and framebuffer redraws.

---

## Project Structure

### app.s

Main application entry point responsible for rendering the final scene.

### background.s

Background rendering routines.

### castle.s

Castle drawing and animation logic.

### knight.s

Knight rendering routines.

### circle.s

Circle drawing algorithms.

### line.s

Line drawing functions.

### rectangle.s

Rectangle drawing functions.

### triangle.s

Triangle drawing functions.

### graphics.s

General graphics utilities.

### utils.s

Framebuffer and pixel manipulation helpers.

### macros.s

Assembly macros used across the project.

### start.s

Hardware initialization and framebuffer setup.

### delay.s

Timing and animation delay routines.

### eyes.s

Animated eye effects.

---

## Technologies

- ARM64 Assembly
- Framebuffer Graphics
- Raspberry Pi Architecture
- QEMU
- Computer Organization
- Embedded Systems
- Low-Level Programming

---

## Running the Project

Build and run with:

```bash
make runQEMU
```

This command compiles the project and launches the ARM64 emulator.

---

## Display Configuration

- Resolution: 640x480
- Color format: ARGB 32-bit
- Framebuffer base address stored in register X0

---

## Academic Context

Faculty of Mathematics, Astronomy, Physics and Computing (FaMAF)

National University of Córdoba (UNC)

Computer Organization Course – 2024