// recursion: gcc -O0 -S -c fact.c
// tail recursion to loop: gcc -O3 -S -c fact.c

int factorial(int x) {
  if (x <= 0) return 1;
  return x * factorial(x - 1);
}
