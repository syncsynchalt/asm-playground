; prints a pyramid of asterisks

        global    start
        section   .text

start:
    mov     rdx, output           ; rdx holds address of next byte to write
    mov     r8, 1                   ; initial line length
    mov     r9, 0                   ; number of stars written on line so far

start_line:
    mov     r10, maxlines           ; leading spaces counter, initialize to lines
    sub     r10, r8                 ; subtract lines already written
    shr     r10, 1                  ; divide by half
print_lead_space:
    cmp     r10, 0                  ; check spaces printed against limit
    jle     line                    ; done if we've printed all of them
    mov     byte [rdx], ' '         ; write a space
    inc     rdx                     ; advance one byte
    dec     r10                     ; count one space written
    jmp     print_lead_space        ; write next space
line:
    mov     byte [rdx], '*'         ; write single star
    inc     rdx                     ; advance pointer to next cell to write
    inc     r9                      ; "count" number so far on line
    cmp     r9, r8                  ; did we reach the number of stars for this line?
    jne     line                    ; not yet, keep writing on this line

lineDone:
    mov     byte [rdx], newline     ; write a newline char
    inc     rdx                     ; and move pointer to where next char goes
    inc     r8                      ; next line will be two chars longer
    inc     r8                      ; next line will be two chars longer
    mov     r9, 0                   ; reset count of stars written on this line
    cmp     r8, maxlines            ; wait, did we already finish the last line?
    jng     start_line              ; if not, begin writing this line

done:
    mov     rax, syswr              ; system call for write
    mov     rdi, 1                  ; file handle 1 is stdout
    mov     rsi, output             ; address of string to output
    mov     rbx, output
    sub     rdx, rbx                ; change rdx to the number of bytes to write (offset from 'output')
    syscall                         ; invoke operating system to do the write
    mov     rax, 0x02000001         ; system call for exit
    xor     rdi, rdi                ; exit code 0
    syscall                         ; invoke operating system to exit

        section   .bss

syswr       equ       0x02000004
newline     equ       10
maxlines    equ       16
dataSize    equ       128
output:     resb      dataSize
