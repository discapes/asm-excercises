	.intel_syntax noprefix
.text
.global _start
_start:

    mov rdi, 432789
    call printnum
    call newline
    call exit
ret

exit:
    mov rax, 60
    mov rdi, 0
    syscall
ret

printnum: # rdi = num
    push rbp
    mov rbp, rsp

    lea rsi, [rip + str_end] # rsi = data
    mov rax, rdi # rax = buffer that the last digit will be removed from per each loop
    mov rdi, 10 # constant

    .Lloop:
    cmp rax, 9
    jle .Lonedigitleft

    mov rdx, 0
    div rdi # first digits(quotient) into rax, last digit(remainder) into rdx

    # push rdx to the string
    sub rsi, 1
    mov [rsi], dl
    add byte ptr [rsi], 0x30

    jmp .Lloop

    .Lonedigitleft: # push the one single digit in rax to the string
    sub rsi, 1
    mov [rsi], al
    add byte ptr [rsi], 0x30

    mov rax, 1 # sys_write
    mov rdi, 1 # stdout
    lea rdx, [rip+str_end]
    sub rdx, rsi # calc string length
    syscall

    leave
ret

newline:
    push rbp
    mov rbp, rsp

    push 0xA
    mov rax, 1
    mov rdi, 1
    mov rsi, rsp
    mov rdx, 1
    syscall

    leave
ret

.section .bss
.skip 1280
str_end:
