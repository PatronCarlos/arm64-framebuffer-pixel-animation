.ifndef TRIANGLE_S
TRIANGLE_S:

.include "line.s"
.include "rectangle.s"

/*
	Draw a triangle with given height and width starting 
	from coordinates (x2, y2)

    x4: initial x position
	x5: initial y position
	x6: length of the first step or rectangle
    x7: height of each step of the triangle
*/

paint_equilateral_triangle:
	sub sp, sp, 40
	str x4, [sp, 32]
	str x5, [sp, 24]
	str x6, [sp, 16]
	str x7, [sp, 8]
	str lr, [sp]

paint_equilateral_triangle_loop:
    add x4, x4, 1
	sub x5, x5, x7
	sub x6, x6, 2
	bl paintRectangle
	cbnz x6, paint_equilateral_triangle_loop
	bl end_triangle

paint_downward_RA_triangle_left:
    sub sp, sp, 40
	str x4, [sp, 32]
	str x5, [sp, 24]
	str x6, [sp, 16]
	str x7, [sp, 8]
	str lr, [sp]
paint_downward_RA_triangle_left_loop:
	add x5, x5, x7
	sub x6, x6, 2
	bl paintRectangle
	cbnz x6, paint_downward_RA_triangle_left_loop
	bl end_triangle
paint_downward_RA_triangle_right:
    sub sp, sp, 40
	str x4, [sp, 32]
	str x5, [sp, 24]
	str x6, [sp, 16]
	str x7, [sp, 8]
	str lr, [sp]
paint_downward_RA_triangle_right_loop:
    add x4, x4, 2
	add x5, x5, x7
	sub x6, x6, 2
	bl paintRectangle
	cbnz x6, paint_downward_RA_triangle_right_loop
    
end_triangle:
	ldr x4, [sp, 32]
	ldr x5, [sp, 24]
	ldr x6, [sp, 16]
	ldr x7, [sp, 8]
	ldr lr, [sp]
	add sp, sp, 40

    ret

.endif
