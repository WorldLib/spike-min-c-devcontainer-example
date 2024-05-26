//# include <assert.h>
# include "../01.src/audit/local_console_logging.h"

int main()
{
  log_console("This is and TRACE message", WL_CONSOLE_LOG_TRACE);
  log_console("This is and DEBUG message", WL_CONSOLE_LOG_DEBUG);
  log_console("This is and INFO  message", WL_CONSOLE_LOG_INFO);
  log_console("This is and WARN  message", WL_CONSOLE_LOG_WARN);
  log_console("This is and ERROR message", WL_CONSOLE_LOG_ERROR);
  log_console("This is and FATAL message", WL_CONSOLE_LOG_FATAL);
}