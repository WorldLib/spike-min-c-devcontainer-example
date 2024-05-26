#include <stdio.h>
#include <string.h>
#include "../01.src/audit/local_console_logging.h"

int main() {
  log_console("Begin execution", WL_CONSOLE_LOG_TRACE);
  // Not allowing a char for \0. The linters should inform you...
  // @ts-ignore
  char name[3] = "AA\0"; /* Flawfinder: ignore */
  // strncpy is a safer way to copy strings
  strncpy(name, "John", sizeof(name)-1); /* Flawfinder: ignore. Assured manually*/
  printf("Hello, %s!\n", name);
  log_console("Finished", WL_CONSOLE_LOG_TRACE);
  return 0;
}