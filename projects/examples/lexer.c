#include <stdio.h>
#include <assert.h>

int main() {
  char c;
  printf("recognizing regex\n");
  // ((ab)|D)*
  // abD
  // aDb
  // epsilon
  c = fgetc(stdin);
  while ('a' == c || 'D' == c) {
    ungetc(c, stdin);
    c = fgetc(stdin);
    if ('a' == c) {
      ungetc(c, stdin);
      c = fgetc(stdin);
      assert('a' == c);
      c = fgetc(stdin);
      assert('b' == c);
    } else if ('D' == c) {
      ungetc(c, stdin);
      c = fgetc(stdin);
      assert('D' == c);
    } else {
      assert(0);
    }
  }
  
  printf("recognized\n");
  return 0;
}
