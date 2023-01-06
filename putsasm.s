.intel_syntax noprefix
.text
.global main
main:

sub rsp, 8
lea rdi, [rip + msg]
call puts

mov rax, 60
mov rdi, 0
syscall

.data
msg: .asciz "Hello World!"
endmsg:
