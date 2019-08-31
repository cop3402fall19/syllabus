#include <stdio.h>

/*
clang -emit-llvm -S helloworld.c
clang -o helloworld helloworld.ll
./helloworld
*/

int main() {
  printf("hello, world!\n");
  return 0;
}
