.intel_syntax noprefix

.text
.global _start
_start:

# print "Hello World!\n"
mov rax, 1 # syscall: sys_write
lea rsi, [rip + msg] # ptr to data
mov rdx, endmsg - msg # data length: should be 13
mov rdi, 1 # file descriptor: stdout
syscall

# exit
mov rax, 60 # sys_exit
mov rdi, 0 # error_code
syscall

.data
msg: .ascii "Hello world!\n"
endmsg:
