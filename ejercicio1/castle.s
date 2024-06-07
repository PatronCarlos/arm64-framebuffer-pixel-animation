.ifndef CASTLE_S
CASTLE_S:

.include "rectangle.s"
.include "circle.s"
.include "triangle.s"

paint_castle:
	setColor x18, 0X808080
	// Castle center
	mov x4, 215 // x position
	mov x5, 175 // y position
	mov x6, 217 // length
	mov x7, 132 // height
	bl paintRectangle
	
paint_tower_spike_left:
	mov x4, 171 // x position
	mov x5, 138 // y position
	mov x6, 44 // length
	mov x7, 169 // height
	bl paintRectangle

	mov x4, 171 // x position
	mov x5, 128 // y position
	mov x6, 8   // length
	mov x7, 10 // height
	
paint_tower_spike_left_loop:
	bl paintRectangle
	add x4, x4, 12
	cmp x4, 219
	bne paint_tower_spike_left_loop

paint_tower_spike_center:
	mov x4, 218 // Initial x position
	mov x5, 165 // y position
	mov x6, 8   // length
	mov x7, 10  // height

paint_tower_spike_center_loop:
	bl paintRectangle
	add x4, x4, 12
	cmp x4, 434
	bne paint_tower_spike_center_loop

paint_rigth_tower:
	setColor x18, 0X808080
    mov x4, 432 // x position
	mov x5, 82 // y position
	mov x6, 44 // length
	mov x7, 225 // height
	bl paintRectangle

paint_windows:
    setColor x18, 0X000000
    mov x4, 180 //x
    mov x5, 165 //y
    mov x6, 9   //length
    mov x7, 22  //height
    mov x9, 0   // window counter to repeat the loop
    mov x10, x4 // copy of x
    mov x11, 19 //horizontal displacement for the 2nd window 

paint_big_windows_upper_left_loop:
    bl paintRectangle
    add x4, x4, x11 //add to x the horizontal displacement for the 2nd window
    add x9, x9, 1  //1 is added to the counter for each window painted 
    cmp x9, 2      // once the counter reaches 2 (2 windows painted), exit the loop
    bne paint_big_windows_upper_left_loop
    
    mov x4, x10    //return to the original x
    add x5, x5, 40 //move down

paint_big_windows_lower_left_loop:
    bl paintRectangle
    add x4, x4, x11  //add to x the horizontal displacement for the 2nd window
    add x9, x9, 1  
    cmp x9, 4       //total number of windows painted. Once it reaches 4 the loop ends.
    bne paint_big_windows_lower_left_loop

circle_big_windows_upper_left:  //upper arch of the upper large windows
    mov x4, 455     //a
    mov x5, 314     //b
    mov x6, 20      //r²
    mov x12, 0      // arch counter of the windows 

circle_big_windows_upper_left_loop:
	bl paintCircle
	sub x4, x4, x11 //add to x the horizontal displacement for the 2nd window
	add x12, x12, 1
	cmp x12, 2       
	bne circle_big_windows_upper_left_loop

circle_big_windows_lower_left:
    mov x4, 455
    mov x5, 275
    mov x6, 20

circle_big_windows_lower_left_loop:
	bl paintCircle
	sub x4, x4, x11
	add x12, x12, 1
	cmp x12, 4
	bne circle_big_windows_lower_left_loop

paint_small_windows_left:
    mov x4, 182 //x
    mov x5, 235 //y
    mov x6, 6   //length
    mov x7, 12  //height

paint_small_windows_left_loop:
    bl paintRectangle
    add x4, x4, x11
    add x9, x9, 1
    cmp x9, 6
    bne paint_small_windows_left_loop

circle_small_windows_left:
    mov x4, 455 //a
    mov x5, 244 //b
    mov x6, 11  //r²

circle_small_windows_left_loop:
	bl paintCircle
	sub x4, x4, x11 //"add" to x the horizontal displacement for the 2nd window
	add x12, x12, 1
	cmp x12, 6       
	bne circle_small_windows_left_loop

paint_center_windows: // will paint the 6 center windows
    mov x4, 232 //x
    mov x5, 201 //y
    mov x6, 14  //length
    mov x7, 11   //height
    
paint_center_windows_loop1: //paint 3 center windows in the left area
    bl paintRectangle
    add x4, x4, x11
    add x9, x9, 1
    cmp x9, 9    //window counter
    bne paint_center_windows_loop1
    add x4, x4, 87

paint_center_windows_loop2: //paint 3 center windows in the right area
    bl paintRectangle
    add x4, x4, x11
    add x9, x9, 1
    cmp x9, 12    //window counter
    bne paint_center_windows_loop2

circle_center_windows:
    mov x4, 401 //a
    mov x5, 279 //b
    mov x6, 40 //r²
    
circle_center_windows_loop1:
    bl paintCircle
    sub x4, x4, x11 //add the displacement to the next window
    add x12, x12, 1
    cmp x12, 9      //circle counter
    bne circle_center_windows_loop1
    sub x4, x4, 87 //displacement to the next window: 107
  
circle_center_windows_loop2:
    bl paintCircle
    sub x4, x4, x11
    add x12, x12, 1
    cmp x12, 12    //circle counter
    bne circle_center_windows_loop2

paint_big_windows_right:
    mov x4, 435 //x
    mov x5, 96  //y
    mov x6, 9   //length
    mov x7, 25  //height

paint_big_windows_right_loop: //paint 3 center windows in the right area
    bl paintRectangle
    add x4, x4, x11
    add x9, x9, 1
    cmp x9, 14    //window counter
    bne paint_big_windows_right_loop

paint_small_window_right:
    sub x4, x4, 3
    mov x6, 4
    mov x7,10
    bl paintRectangle

circle_big_windows_right:
    mov x4, 200
    mov x5, 384
    mov x6, 20
circle_big_windows_right_loop:
    bl paintCircle
    sub x4, x4, x11
    add x12, x12, 1
    cmp x12, 14
    bne circle_big_windows_right_loop
circle_small_window_right:
    add x4, x4, 6
    sub x6, x6, 14
    bl paintCircle

paint_door:
    setColor x18, 0X000000
	mov x4, 310 // x position
	mov x5, 266 // y position
	mov x6, 43 // length
	mov x7, 48 // height
	bl paintRectangle

    // Door top arch
    mov x4, 309 // a
    mov x5, 210 // b
    mov x6, 460 // r
    bl paintCircle

paint_bridge:
	setColor x18, 0X9C5A3C
	mov x4, 308 // x position
	mov x5, 306 // y position
	mov x6, 46 // length
	mov x7, 77 // height
	bl paintRectangle

paint_bridge_details:
    mov x28, 11 //counter
    setColor x18, 0X000000
	mov x4, 308 // x position
	mov x5, 312 // y position
	mov x6, 46 // length
	mov x7, 2 // height
	bl paintRectangle

paint_bridge_details_loop:
    sub x28, x28, 1
    add x5, x5, 6
    bl paintRectangle

    cbnz x28, paint_bridge_details_loop

paint_dome_right_tower:
    setColor x18, 0X990030
	mov x4, 432 //x4: initial x position
	mov x5, 82  //x5: initial y position
	mov x6, 44  //x6: base pixels 
	mov x7, 2  //x7: height of each step of the triangle
	bl paint_equilateral_triangle

paint_moon:
    sub sp, sp, 24
    stur x4, [sp]
    stur x5, [sp, 8]
    stur x14, [sp, 16] // coord x to move
    mov x14, 1

    setColor x18, 0XFFF9BD
    mov x4, 130    // a
    mov x5, 480     // b
    mov x6, 1200    // r^2
    bl paintCircle

endCastle:
	ldur x1, [sp]
	ldur lr, [sp, 8]         
	ldur x7, [sp, 16]
	ldur x6, [sp, 24]
	ldur x5, [sp, 32]
	ldur x4, [sp, 40]
	ldr x3, [sp, 48]
	add sp, sp, 56   

    ret

.endif
