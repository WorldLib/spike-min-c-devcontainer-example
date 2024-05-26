#include "local_console_logging.h"
#include <time.h>
#include <stdint.h>
#include <string.h>

static const char *level_strings[] = {
  "T", "D", "I", "W", "E", "F"
};

/// Convert seconds to nanoseconds
#define SEC_TO_NS(sec) ((sec)*1000000000)

/* If Longer strings are preferred*/
/*
static const char *level_strings[] = {
  "TRACE", "DEBUG", "INFO", "WARN", "ERROR", "FATAL"
};
*/

void log_console(const char *message, int level)
{
  if (level < WL_CONSOLE_LOG_TRACE || level > WL_CONSOLE_LOG_FATAL)
  {
    level = WL_CONSOLE_LOG_TRACE;
  }

  char buf[50]; /* Flawfinder: ignore */
  memset(buf, 0, sizeof(buf));

  struct timespec ts;
  uint64_t nanoseconds=0;
  int return_code = timespec_get(&ts, TIME_UTC);
  if ( 0 != return_code)
  {
    // `ts` now contains your timestamp in seconds and nanoseconds! To 
    // convert the whole struct to nanoseconds, do this:
    buf[strftime(buf, sizeof(buf), "%y-%m-%d|%H:%M:%S", gmtime(&(ts.tv_sec)))] = '\0';
    nanoseconds = (uint64_t)ts.tv_nsec;
  }

  printf("%s|%lu|%s|%s\n", buf, nanoseconds,  level_strings[level], message);
}