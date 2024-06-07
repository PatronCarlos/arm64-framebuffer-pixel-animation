.ifndef EYES_S
EYES_S:

.include "utils.s"
.include "delay.s"
.include "triangle.s"

draw_eyes_red:
    sub sp, sp, #40           // Reserve memory
	str x4, [sp, 32]
	str x5, [sp, 24]
	str x6, [sp, 16]
	str x7, [sp, 8]         // Save x1 in memory (8 memory addresses = 1 64-bit register)
	str lr, [sp]
    setColor x18, 0xCf6010
    mov x4, 317 // x
    mov x5, 267 // y
    mov x6, 10 // eye width
    mov x7, 1 // pixels of each "step"
    bl paint_downward_RA_triangle_right
    add x4, x4, 20
    bl paint_downward_RA_triangle_left
    bl endeyes

draw_eyes_black:
    sub sp, sp, #40           // Reserve memory
	str x4, [sp, 32]
	str x5, [sp, 24]
	str x6, [sp, 16]
	str x7, [sp, 8]         // Save x1 in memory (8 memory addresses = 1 64-bit register)
	str lr, [sp]
    setColor x18, 0x000000
    mov x4, 317 // x
    mov x5, 267 // y
    mov x6, 10 // eye width
    mov x7, 1 // pixels of each "step"
    bl paint_downward_RA_triangle_right
    add x4, x4, 20
    bl paint_downward_RA_triangle_left
    mov x28, 0
    bl endeyes

endeyes:
    ldr x4, [sp, 32]
	ldr x5, [sp, 24]
	ldr x6, [sp, 16]
	ldr x7, [sp, 8]
	ldr lr, [sp]          // Load the return pointer from memory (8 memory addresses = 1 64-bit register)
	add sp, sp, 40     
    ret

.endif
