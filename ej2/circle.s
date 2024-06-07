.ifndef CIRCLE_S
CIRCLE_S:

.include "utils.s"

/*
    Calculates the circle equation to draw a circle.
 	(x-a)² + (y-b)² = r²
 	(a,b) = center
  	r = radius
 	It also computes a² + b² = r²
 
	x20  Buffer address
	x4   Center x coordinate (a)
	x5   Center y coordinate (b)
	x6   Square of the radius (r²)
	w18  Color to fill the circle
*/
paintCircle:
	sub sp, sp, #8
	str x0, [sp]   
	movz x25, 0
	movz x26, 0
	mov x0, x20 
	
	mov x22, SCREEN_HEIGHT // Y size
	
loop1_circle: 
	mov x21, SCREEN_WIDTH // X size 

loop2_circle:
	sub x25, x22, x5    // (y-b)
	sub x26, x21, x4    // (x-a)
	mul x25, x25, x25	  // b²
	mul x26, x26, x26    // a²
	add x25, x25, x26   // a² + b²
	cmp x25, x6	 // Compare (a²+b²) with r²
	b.hi skip_pixel    // If a² + b² >= r², skip this pixel	
		stur w18, [x0]   // Otherwise, color the pixel N
	
skip_pixel:
	add x0, x0, 4
	sub x21, x21, 1
	cbnz x21, loop2_circle
	sub x22, x22, 1
	cbnz x22, loop1_circle
	ldr x0, [sp]  
	add sp, sp, 8
	
	ret

.endif
