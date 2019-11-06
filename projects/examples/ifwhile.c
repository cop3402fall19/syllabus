#include <stdio.h>

int main(int x, char **argv) {
  if (x > 5) {
    printf("%d\n", x);
  } else {
    while (x < 5) {
      x = x + 1;
    }
  }
  printf("%d\n", x);
  return 0;
}
