// no constant folding:
// gcc -O0 -o constant.noopt.s -S constant.c

// with constant folding:
// gcc -O3 -o constant.opt.s -S constant.c

int main() {
  int x = 343;
  printf("%d\n", x * 78510);
  return 0;
}
