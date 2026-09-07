SECTION .data
msg db 'Hello World!', 0Ah

SECTION .text
global _start

_start:
  mov   edx, 13    ; number of bytes in msg plus string terminator
  mov   ecx, msg
  mov   ebx, 1     ; write to stdout
  mov   eax, 4     ; write into sys_write (kernel opcode 4)
  int   80h        ; libc interruption

  mov   ebx, 0     ; return 0 status on exit - No Errors
  mov   eax, 1     ; invoke SYS_EXIT (kernel opcode 1)
  int   80h
