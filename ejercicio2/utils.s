.ifndef UTILS_S
UTILS_S:

.include "macros.s"

/*
    Paints a pixel at the given coordinates with the given color.
    
    x18  Color of the pixel
    x1   x coordinate of the pixel
    x2   y coordinate of the pixel
    x3   Buffer switch (0 for buffer, otherwise prebuffer)
*/

paintPixel:
    sub sp, sp, #16
    str x8, [sp, 8]	
    str x30, [sp, 0]
    bl setPixel                    // Call setPixel, result in x0
    cbz x3, paintBuffer            // If x3 == 0, paint in the buffer
    b paintPrebuffer               // Else, paint in the prebuffer

paintBuffer:
    mov x8, x0                     // Draw original value x0
    b paintPixelEnd

paintPrebuffer:                    // Then draw in x28
    add x8, x0, x28                // Translate buffer to prebuffer
    sub x8, x8, x20                // x8 = x0 + (x28 - x20)

paintPixelEnd:
    stur x18, [x8]                 // Store color (32 bits) in x8
    ldur x30, [sp, #0]
    ldr x8, [sp, 8]
    add sp, sp, #16
    ret

/*
    Calculates the memory address of the pixel to paint.

    x2  y coordinate of the pixel
    x1  x coordinate of the pixel
*/

setPixel:
    mov x8, SCREEN_WIDTH
    mul x0, x2, x8                 // y * WIDTH
    add x0, x0, x1                 // + x
    lsl x0, x0, 2                  // * 4 (pixel size)
    add x0, x20, x0                // Pixel address to paint
    ret

endUpdate:
    ldr lr, [sp]
    ldr x10, [sp, 8]
    ldr x9, [sp, 16]
    ldr x7, [sp, 24]
    ldr x8, [sp, 32]
    add sp, sp, 40
    ret

.endif
