.ifndef DELAY_s
DELAY_S:

/*
    This function creates a delay by looping a large number of times
*/

delay:
    sub sp, sp, 16
    str x8, [sp, 8]
    str x9, [sp]

    add x8, xzr, xzr            
    add x8, x8, #0xFFF            
    lsl x8, x8, #10               

delayloop:
    cbz x8, delayEnd
    ldur x9, [sp, #0]
    stur x9, [sp, #0]
    sub x8, x8, #1              
    b delayloop

delayEnd:
    ldur x9, [sp]
    ldur x8, [sp, 8]
    add sp, sp, 16
    ret

.endif

