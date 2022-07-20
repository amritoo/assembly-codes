.model small
.stack 100H

.code

main PROC
    ; setting a test value
    MOV AL, 5

    ; Compare
    CMP AL, 5
    JG greater  ; if greater
    JE equal    ; else if equal
    JMP less    ; else

    greater:
    MOV BL, 'G'
    JMP after

    equal:
    MOV BL, 'E'
    JMP after

    less:
    MOV BL, 'L'

    after:
    MOV AH, 2
    MOV DL, BL
    INT 21H

    exit:
    MOV AH, 4CH
    INT 21H
    main ENDP
END main