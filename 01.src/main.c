#include <stdio.h>
#include <string.h>

int main() {
  // Not allowing a char for \0. The linters should inform you...
  char name[2] = "AA";
  strncpy(name, "John", sizeof(name));
  printf("Hello, %s!\n", name);
  return 0;
}