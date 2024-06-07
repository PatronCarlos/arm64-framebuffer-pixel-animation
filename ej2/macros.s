.ifndef MACROS_H
MACROS_H:

.equ SCREEN_BYTES, 4*640*480
.equ SCREEN_PIXELS, 400*200

.equ SCREEN_WIDTH, 640
.equ SCREEN_HEIGHT, 480
.equ BITS_PER_PIXEL, 32

.equ FRAMEBUFFER_WIDTH, 300
.equ FRAMEBUFFER_HEIGHT, 400
.equ BITS_PER_PIXEL, 32

.equ TOTAL_PIXELS, 640*480

.macro setColor reg, color
    movz \reg, #(\color >> 16) & 0xFFFF, lsl #16
    movk \reg, #\color & 0xFFFF, lsl #0
.endm

.endif
