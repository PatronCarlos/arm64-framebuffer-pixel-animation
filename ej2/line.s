.ifndef LINE_S
LINE_S:

.include "utils.s"

/*
 	Draws horizontal lines starting from coordinates (xo, yo) 
	with w number of pixels extending to the right

 	x4   Origin x value (xo)
 	x5   Origin y value (yo)
 	x6  Number of pixels (w)
*/

paintHorizontalLine:
	sub sp, sp, 48
	str x2, [sp, 40]
	str x1, [sp, 32]
	str x6, [sp, 24]
	str x5, [sp, 16]
	str x4, [sp, 8]
	str x30, [sp]         // Save the return pointer in memory
	mov x1, x4               // x = xo

horizontalLineLoop:
	sub x8, x1, x4           // How many pixels have been drawn so far
	cmp x6, x8              // Compare w with the number of pixels drawn
	b.eq endHorizontalLine   // If they are equal, the drawing is complete
	mov x2, x5
	bl paintPixel            // Otherwise, draw
	add x1, x1, 1           // Move to the next pixel, x++
	b horizontalLineLoop

endHorizontalLine:
	ldr x30, [sp]         // Save the return pointer in memory
	ldr x4, [sp, 8]
	ldr x5, [sp, 16]
	ldr x6, [sp, 24]
	ldr x1, [sp, 32]
	ldr x2, [sp, 40]
	add sp, sp, 48           // Free memory space
	ret

.endif
