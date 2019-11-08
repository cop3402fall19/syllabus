// clang -S -emit-llvm functions.c

int factorial_recursive(int x) {
  int result = 1;
  if (x <= 0) result = 1;
  result = x * factorial_recursive(x - 1);
  return result;
}

int mult(int left, int right) {
  return left * right;
}

int factorial_iterative(int x) {
  int result;
  result = 1;
  while (x > 0) {
    result = mult(result, x);
    x = x - 1;
  }
  return result;
}

int main() {
  /* print factorial_recursive(4); */
  /* print factorial_iterative(4); */
  printf("%d\n", factorial_recursive(4));
  printf("%d\n", factorial_iterative(4));
  return 0;
}
