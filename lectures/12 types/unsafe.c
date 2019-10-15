#include <stdio.h>

int main() {
  printf("STARTED RUNNING\n");
  
  float x = 1.7;

  int normalcast = x;

  printf("%d\n", normalcast);

  float *p = &x;
  void *ip = (void *)p;
  
  printf("%d\n", *(int *)ip);
  
  return 0;
}
