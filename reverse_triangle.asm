.model small
.stack 100H

.data
x DB ?
block db '#'
input_promt DW "Please enter the number of lines (1-9): $"
output_message DW "The reverse triangle:", 10, 13, "$"
invalid_message DW "Invalid input! Cannot create a triangle.$"

.code

main PROC
    MOV AX, @data
    MOV DS, AX

    ; Taking user input
    MOV AH, 9
    LEA DX, input_promt
    INT 21H
    MOV AH, 1
    INT 21h
    SUB AL, '0'
    MOV x, AL

    ; Printing new-line
    MOV AH, 2
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H

    ; Checking for invalid input
    CMP x, 1
    JL invalid
    CMP x, 9
    JG invalid
    JMP create_triangle

    invalid:
    MOV AH, 9
    LEA DX, invalid_message
    INT 21H
    JMP exit

    create_triangle:
    ; Printing output message
    MOV AH, 9
    LEA DX, output_message
    INT 21H

    ; Initialize outer loop counter
    MOV BL, 0

    outer_loop: ; using while loop
    CMP BL, x
    JE exit

    ; Printing new-line
    MOV AH, 2
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H

    ; Initialize inner loop counter
    MOV CH, 0
    MOV CL, x
    SUB CL, BL

    inner_loop:

    ; Print a single character
    MOV AH, 2
    MOV DL, block
    INT 21H

    LOOP inner_loop

    ; Increment outer loop counter
    INC BL
    JMP outer_loop

    exit:
    MOV AH, 4CH
    INT 21H
    main ENDP
END main