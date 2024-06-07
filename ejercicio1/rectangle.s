.ifndef RECTANGLE_S
RECTANGLE_S:

.include "utils.s"
.include "line.s"

/*
	Draws a rectangle with given height and width starting 
	from coordinates (x2, y2)
 
 	x4   x2 value indicating the start of drawing
 	x5   y2 value indicating the start of drawing
 	x6  Width in pixels (w)
 	x7  Height in pixels (h)
*/

paintRectangle:
	sub sp, sp, #40           // Reserve memory
	str x4, [sp, 32]
	str x5, [sp, 24]
	str x6, [sp, 16]
	str x7, [sp, 8]         // Save x1 in memory (8 memory addresses = 1 64-bit register)
	str lr, [sp]          // Save the return pointer in memory (8 memory addresses = 1 64-bit register)
	mov x1, x5                // x1 initial row

rectangleLoop:                // Responsible for changing the row
	sub x8, x5, x1            // Number of rows drawn so far
	cmp x8, x7               // Compare the number of drawn lines with h
	b.eq endRectangle         // If they are equal, everything is drawn
	bl paintHorizontalLine    // Otherwise, draw the line
	add x5, x5, #1            // Move to the pixel in the row below, y++
	b rectangleLoop

endRectangle:
	ldr x4, [sp, 32]
	ldr x5, [sp, 24]
	ldr x6, [sp, 16]
	ldr x7, [sp, 8]
	ldr lr, [sp]          // Load the return pointer from memory (8 memory addresses = 1 64-bit register)
	add sp, sp, 40           // Reserve 2 memory registers
	
	ret

.endif
