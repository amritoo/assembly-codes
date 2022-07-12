.model small
.stack 100H

.data
num DB 05H
output DW "the 2's complement is: $"

; Calculation
; 0000 0101 = 05 (original number in hexadecimal)
; 1111 1010 = FA (1's complement)
;      +  1
; 1111 1011 = FB (2's complement)

.code

main PROC
    ; storing all variables in data segment
    MOV AX, @data
    MOV DS, AX

    ; calculating 2's complement
    MOV BL, num
    NOT BL
    ADD BL, 1

    ; outputting the result in ascii code
    MOV AH, 9
    LEA DX, output
    INT 21H
    MOV AH, 2
    MOV DL, BL
    INT 21H

    exit:
    MOV AH, 4CH
    INT 21H
    main ENDP
END main