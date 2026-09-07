SECTION .data
msg db  'Hello, brave new world!', 0Ah

SECTION .text
global _start

_start:
  mov ebx, msg
  mov eax, ebx  ; mov the address from ebx to eax (both point to the same segment in memory)

next_char:
  cmp byte [eax], 0   ; compare the byte pointed by eax against zero (zero is 0Ah)
  jz  terminate       ; jump (if the zero flagged has been set)
  inc eax             ; next character in pointer
  jmp next_char

terminate:
  sub eax, ebx        ; substract the address from ebx to eax
  mov edx, eax        ; eax nows equals the number of bytes in
  mov ecx, msg
  mov ebx, 1
  mov eax, 4
  int 80h

  mov ebx, 0
  mov eax, 1
  int 80h
