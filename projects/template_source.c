#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <errno.h>

/*
clang -emit-llvm -S template.c
*/

void print_integer(int32_t i) {
  printf("%d\n", i);
}

int32_t read_integer() {
  int32_t i;
  int n;

  errno = 0;
  fprintf(stderr, "please enter an integer\n");
  n = scanf("%d", &i);
  if (n == 1) {
    return i;
  } else if (errno != 0) {
    perror("scanf");
    exit(1);
  } else {
    fprintf(stderr, "no matching characters\n");
    exit(1);
  }
}

int main() {
  print_integer(read_integer());
  print_integer(read_integer());
  print_integer(read_integer());
}
