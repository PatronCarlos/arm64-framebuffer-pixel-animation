.ifndef KNIGHT_S
KNIGHT_S:

.include "rectangle.s"
.include "macros.s"

paint_knight:
    sub sp, sp, 8
    stur lr, [sp]

paint_helmet:
    setColor x18, 0xCCCCCC
    mov x4, 384
    mov x5, 384
    mov x6, 5
    mov x7, 3
    bl paintRectangle

    mov x4, 383
    mov x5, 387
    mov x6, 8
    mov x7, 2
    bl paintRectangle

    mov x4, 382
    mov x5, 389
    mov x6, 10
    mov x7, 2
    bl paintRectangle

    // Helmet visor
    setColor x18, 0x666666
    mov x4, 383
    mov x5, 386
    mov x6, 8
    mov x7, 1
    bl paintRectangle

paint_chest:
    setColor x18, 0x999999
    mov x4, 381
    mov x5, 391
    mov x6, 12
    mov x7, 2
    bl paintRectangle

    mov x4, 380
    mov x5, 393
    mov x6, 14
    mov x7, 2
    bl paintRectangle

    // Lower part of the torso
    setColor x18, 0x777777
    mov x4, 383
    mov x5, 395
    mov x6, 8
    mov x7, 2
    bl paintRectangle

paint_arms:
    setColor x18, 0x999999
    mov x4, 379
    mov x5, 391
    mov x6, 3
    mov x7, 6
    bl paintRectangle

    mov x4, 391
    mov x5, 391
    mov x6, 3
    mov x7, 6
    bl paintRectangle

    // Gloves
    setColor x18, 0x444444
    mov x4, 379
    mov x5, 397
    mov x6, 3
    mov x7, 2
    bl paintRectangle

    mov x4, 391
    mov x5, 397
    mov x6, 3
    mov x7, 2
    bl paintRectangle

paint_sword:
    setColor x18, 0xEEEEEE
    mov x4, 393        
    mov x5, 396        
    mov x6, 2
    mov x7, 1
    mov x21, 5         

loop_sword:
    bl paintRectangle

    add x4, x4, 1 
    add x5, x5, 1 

    sub x21, x21, 1 
    cbnz x21, loop_sword 

paint_belt:
    setColor x18, 0x333333
    mov x4, 382
    mov x5, 396
    mov x6, 10
    mov x7, 2
    bl paintRectangle

paint_legs:
    setColor x18, 0x666666
    mov x4, 384
    mov x5, 398
    mov x6, 6
    mov x7, 4
    bl paintRectangle

    setColor x18, 0x999999
    mov x4, 382
    mov x5, 402
    mov x6, 3
    mov x7, 4
    bl paintRectangle

    mov x4, 389
    mov x5, 402
    mov x6, 3
    mov x7, 4
    bl paintRectangle

paint_boots:
    setColor x18, 0x444444
    mov x4, 382
    mov x5, 406
    mov x6, 3
    mov x7, 2
    bl paintRectangle

    mov x4, 389
    mov x5, 406
    mov x6, 3
    mov x7, 2
    bl paintRectangle

finish:
    ldur lr, [sp]
    add sp, sp, 8
    ret

.endif
