.ifndef BACKGROUND_S
BACKGROUND_S:

.include "rectangle.s"
.include "circle.s"
.include "macros.s"
.include "triangle.s"

paint_background:
    sub sp, sp, #64
    stp x29, x30, [sp, #48]
    stp x27, x28, [sp, #32]
    stp x25, x26, [sp, #16]
    stp x23, x24, [sp, #0]
    
paint_sky:
    setColor x18, 0X2F3699
    mov x4, 0       // x position
    mov x5, 0       // y position
    mov x6, 640     // length
    mov x7, 480     // height
    bl paintRectangle

    // Lower sky fade
    setColor x18, 0X3C4296
    mov x4, 0       // x position
    mov x5, 235     // y position
    mov x6, 640     // length
    mov x7, 20      // height
    bl paintRectangle

    // Lower sky(1) fade
    setColor x18, 0X575CA1
    mov x4, 0       // x position
    mov x5, 245     // y position
    mov x6, 640     // length
    mov x7, 20      // height
    bl paintRectangle

paint_water_surrounding:
    setColor x18, 0X3057F2
    mov x4, 1       // x position
    mov x5, 261     // y position
    mov x6, 640     // length
    mov x7, 219     // height
    bl paintRectangle
    
    setColor x18, 0X103CEB
    mov x4, 1       // x position
    mov x5, 261     // y position
    mov x6, 75    // length
    mov x7, 219     // height
    bl paintRectangle

    mov x4, 75       // x position
    mov x5, 261     // y position
    mov x6, 50    // length
    mov x7, 79   // height
    bl paintRectangle

paint_beach_water:
    setColor x18, 0X4D6DF3
    mov x4, 155     // x position
    mov x5, 262     // y position
    mov x6, 344     // length
    mov x7, 64      // height
    bl paintRectangle


    mov x4, 509     // x position
    mov x5, 261     // y position
    mov x6, 131     // length
    mov x7, 219      // height
    bl paintRectangle

    setColor x18, 0X4D6DF3
    mov x4, 116     // x position
    mov x5, 360     // y position
    mov x6, 524     // length
    mov x7, 120     // height
    bl paintRectangle


paint_castle_soil:
    // Castle sand below
    setColor x18, 0XF5E49C
    mov x4, 120     // x position
    mov x5, 364     // y position
    mov x6, 520     // length
    mov x7, 116     // height
    bl paintRectangle
    // castle sand right
    mov x4, 512     // x position
    mov x5, 261     // y position
    mov x6, 128     // length
    mov x7, 219     // height
    bl paintRectangle

paint_castle_grass:
    setColor x18, 0XA8E61D
    mov x4, 124     // x position
    mov x5, 369     // y position
    mov x6, 516     // length
    mov x7, 111     // height
    bl paintRectangle

    mov x4, 164     // x position
    mov x5, 261     // y position
    mov x6, 320     // length
    mov x7, 54      // height
    bl paintRectangle

    mov x4, 516     // x position
    mov x5, 261     // y position
    mov x6, 124     // length
    mov x7, 219     // height
    bl paintRectangle

    paint_castle_sand:
    setColor x18, 0XF5E49C
    mov x4, 160     // x position
    mov x5, 261     // y position
    mov x6, 328     // length
    mov x7, 57      // height
    bl paintRectangle

    paint_castle_field_crop:
    setColor x18, 0XBA7E65
    mov x4, 545      // x position
    mov x5, 275     // y position
    mov x6, 70     // length
    mov x7, 165      // height
    bl paintRectangle

    paint_castle_field:
    setColor x18, 0XEBE01A
    mov x4, 550      // x position
    mov x5, 275     // y position
    mov x6, 60     // length
    mov x7, 150      // height
    bl paintRectangle
    
    paint_crop_wheat:
        setColor x18, 0XC7BB1C
        mov x4, 555      // x position
        mov x5, 275    // y position
        mov x6, 5     // length
        mov x7, 150      // height
        bl paintRectangle
        mov x17, 4
    paint_crop_wheat_loop:
        sub x17, x17, 1
        add x4, x4, 10
        bl paintRectangle
        cbnz x17, paint_crop_wheat_loop

    paint_castle_field_crop2:
    setColor x18, 0XBA7E65
    mov x4, 140      // x position
    mov x5, 400     // y position
    mov x6, 100     // length
    mov x7, 60      // height
    bl paintRectangle

    paint_castle_field2:
    setColor x18, 0XEBE01A
    mov x4, 145      // x position
    mov x5, 400     // y position
    mov x6, 90     // length
    mov x7, 50      //height
    bl paintRectangle
    
    paint_crop_wheat2:
        setColor x18, 0XC7BB1C
        mov x4, 150      // x position
        mov x5, 400    // y position
        mov x6, 5     // length
        mov x7, 50      // height
        bl paintRectangle
        mov x17, 7
    paint_crop_wheat_loop2:
        sub x17, x17, 1
        add x4, x4, 10
        bl paintRectangle
        cbnz x17, paint_crop_wheat_loop2

    paint_cocodrile_iz:
        setColor x18, 0X129936
        mov x4, 250      // x position
        mov x5, 340    // y position
        mov x6, 20     // length
        mov x7, 7    // height
        bl paintRectangle

    paint_cocodrile_iz1:
        setColor x18, 0X129936
        mov x4, 256      // x position
        mov x5, 337    // y position
        mov x6, 4    // length
        mov x7, 4      // height
        bl paintRectangle

    paint_cocodrile_iz_eye:
        setColor x18, 0Xd7dae0
        mov x4, 256      // x position
        mov x5, 338    // y position
        mov x6, 1    // length
        mov x7, 1      // height
        bl paintRectangle

        paint_cocodrile_der_0:
        setColor x18, 0X129936
        mov x4, 400      // x position
        mov x5, 344    // y position
        mov x6, 20     // length
        mov x7, 7    // height
        bl paintRectangle

    paint_cocodrile_der_1:
        setColor x18, 0X129936
        mov x4, 413      // x position
        mov x5, 341    // y position
        mov x6, 4    // length
        mov x7, 4      // height
        bl paintRectangle

    paint_cocodrile_der_eye:
        setColor x18, 0Xd7dae0
        mov x4, 413      // x position
        mov x5, 341    // y position
        mov x6, 1    // length
        mov x7, 1      // height
        bl paintRectangle

    paint_bush_left:
    setColor x18, 0X0a571a
    mov x4, 285     // x position
    mov x5, 390     // y position
    mov x6, 20      // length
    mov x7, 10      // height
    bl paintRectangle
    
    mov x17, 4
    paint_bush_loop:
        sub x17, x17, 1
        add x5, x5, 30
        bl paintRectangle
        cbnz x17, paint_bush_loop

    paint_bush_down:
    setColor x18, 0X0a571a
    mov x4, 330     // x position
    mov x5, 460     // y position
    mov x6, 40     // length
    mov x7, 10     // height
    bl paintRectangle

    paint_bush_right_top:
    setColor x18, 0X0a571a
    mov x4, 410     // x position
    mov x5, 385     // y position
    mov x6, 50     // length
    mov x7, 10     // height
    bl paintRectangle

    aint_bush_right_down:
    setColor x18, 0X0a571a
    mov x4, 440     // x position
    mov x5, 410     // y position
    mov x6, 20      // length
    mov x7, 10      // height
    bl paintRectangle
    
    mov x17, 4
    paint_bush_loop2:
        sub x17, x17, 1
        add x5, x5, 25
        bl paintRectangle
        cbnz x17, paint_bush_loop2

paint_road:
    setColor x18, 0XE0BBAB
    mov x4, 308     // x position
    mov x5, 382     // y position
    mov x6, 46      // length
    mov x7, 68      // height
    bl paintRectangle

    mov x4, 347     // x position
    mov x5, 415     // y position
    mov x6, 72      // length
    mov x7, 36      // height
    bl paintRectangle

    // Road 3
    mov x4, 381     // x position
    mov x5, 450     // y position
    mov x6, 38      // length
    mov x7, 36      // height
    bl paintRectangle
    
paint_mountain:
    setColor x18, 0X98C61D
    mov x4, 510
    mov x5, 260
    mov x6, 120
    mov x7, 1
    bl paint_equilateral_triangle

    paint_mountain_top:
    setColor x18, 0XFAEDF4
    mov x4, 555
    mov x5, 218
    mov x6, 30
    mov x7, 1
    bl paint_equilateral_triangle


    
end_background:
    ldp x23, x24, [sp, #0]
    ldp x25, x26, [sp, #16]
    ldp x27, x28, [sp, #32]
    ldp x29, x30, [sp, #48]
    add sp, sp, #64

    ret

.endif
