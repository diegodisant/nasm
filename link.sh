#!/bin/sh

if [ $# -eq 0 ]; then
  echo 'Usage: ./link.sh program'

  exit 1
fi

nasm -f elf src/$1.asm

ld -m elf_i386 src/$1.o -o src/$1

./src/$1

exit 0
