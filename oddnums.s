.intel_syntax noprefix
.text
.global _start
_start:

push 0x31 # pushes '1' to the stack.
# rsp is the stack pointer, now pointing to the address in ram where 0x31 is stored

# linux system call parameters
mov rax, 1 # system call: sys_write
mov rsi, rsp # data buffer: top of stack
mov rdx, 1 # data length: 1 byte
mov rdi, 1 # file descriptor: stdout

loop: # jump label
syscall # call sys_write
add byte ptr [rsp], 2 # adds 2 to the value rsp is pointing to (the ascii value of the character)
cmp byte ptr [rsp], 0x39 # compare the value pointed to by rsp to '9'
jle loop # jump back to "loop:" if the value is less than or equal to '9'

# print a newline
mov byte ptr [rsp], 0xA
syscall

# exit
mov rax, 60
mov rdi, 0
syscall
