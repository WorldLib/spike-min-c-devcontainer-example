#include <stdio.h>
#include <string.h>

int main() {
  // Not allowing a char for \0. The linters should inform you...
  // @ts-ignore
  char name[3] = "AA\0"; /* Flawfinder: ignore */
  // strncpy is a safer way to copy strings
  strncpy(name, "John", sizeof(name)-1); /* Flawfinder: ignore. Assured manually*/
  printf("Hello, %s!\n", name);
  return 0;
}