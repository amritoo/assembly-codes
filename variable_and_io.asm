.model small
.stack 100H

.data   ; declaring variables
num DB 31H
char DB 'A'
input_char DB ?
input_num DB ?
output DW "Hello, World!!$"

.code

main PROC
    ; Storing all variables in data segment
    MOV AX, @data
    MOV DS, AX
    
    ; input a character from user
    MOV AH, 1
    INT 21h
    MOV input_char, AL
    
    ; input a number from user
    MOV AH, 1
    INT 21h
    SUB AL, '0'
    MOV input_num, AL
    
    ; Output new-line
    MOV AH, 2
    MOV DL, 10
    INT 21h
    MOV DL, 13
    INT 21h

    ; Output a string
    MOV AH, 9
    LEA DX, output
    INT 21H
    
    ; Output new-line
    MOV AH, 2
    MOV DL, 10
    INT 21h
    MOV DL, 13
    INT 21h
    
    ; Output a number
    MOV AH, 2
    MOV DL, num
    INT 21H
    
    ; Output new-line
    MOV AH, 2
    MOV DL, 10
    INT 21h
    MOV DL, 13
    INT 21h
    
    ; Output a character
    MOV AH, 2
    MOV DL, char
    INT 21H
    
    ; Output new-line
    MOV AH, 2
    MOV DL, 10
    INT 21h
    MOV DL, 13
    INT 21h
    
    ; Output a character taken from user
    MOV AH, 2
    MOV DL, input_char
    INT 21H
    
    ; Output new-line
    MOV AH, 2
    MOV DL, 10
    INT 21h
    MOV DL, 13
    INT 21h
    
    ; Output a number taken from user
    MOV AH, 2
    MOV DL, input_num
    INT 21H

    exit:
    MOV AH, 4CH
    INT 21H
    main ENDP
END main