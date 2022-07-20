.model small
.stack 100H

.code

main PROC

    ; FOR loop example
    MOV BL, '0'

    init_for:
    ; initialize loop variables
    MOV CL, 0

    for:
    ; condition
    CMP CL, 5
    JGE outside_for

    ; body
    INC BL

    ; increment/decrement and next iteration
    INC CL
    JMP for

    outside_for:
    ; other codes


    ; WHILE loop example
    MOV CL, 0
    MOV BL, '0'

    while:
    ; condition
    CMP CL, 5
    JGE outside_while

    ; body
    INC BL
    INC CL

    ; next iteration
    JMP while

    outside_while:
    ; other codes


    ; DO-WHILE loop example
    MOV CL, 0
    MOV BL, '0'

    do_while:
    ; body
    INC BL
    INC CL

    ; condition
    CMP CL, 5
    JL do_while

    ; other codes


    ; LOOP syntax example
    MOV BL, '0'

    ; initialize counter
    MOV CX, 5

    loop1:
    INC BL
    LOOP loop1

    exit:
    MOV AH, 4CH
    INT 21H
    main ENDP
END main