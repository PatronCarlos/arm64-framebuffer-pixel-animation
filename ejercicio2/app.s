.globl main
.include "graphics.s"
.include "macros.s"

main:
    // x0 contains the base address of the framebuffer
    mov x20, x0 // Save the base address of the framebuffer in x20
    bl paint_main_layer

InfLoop:
    b InfLoop
