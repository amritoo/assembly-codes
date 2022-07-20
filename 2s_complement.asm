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
    ; Storing all variables in data segment
    MOV AX, @data
    MOV DS, AX

    ; Calculating 2's complement
    MOV BL, num     ; Store the value of num in BL register
    NOT BL          ; Complement the value in BL register
    ADD BL, 1       ; Add 1 to the value in BL and store the result in BL register

    ; Short way
    MOV BL, num
    NEG BL

    ; Outputting the result in ascii code
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