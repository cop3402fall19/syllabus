#include "template.h"

#include <stdio.h>

int main() {
  printf(PROLOGUE);
  printf("    %%t1 = call i32 @read_integer()\n");
  printf("    call void @print_integer(i32 %%t1)\n");
  printf(EPILOGUE);
  return 0;
}
