#!/bin/sh
# shellcheck disable=SC3043

compile_file(){
  local LIB_REL_FOLDER="${1}"
  local LIB_NAME="${2}"
  local LIB_SRC_FILE="${WORKSPACE_HOME}/01.src/${LIB_REL_FOLDER}/${LIB_NAME}.c"
  local LIB_DST_FILE="${WORKSPACE_HOME}/02.build/target/compiled/${LIB_NAME}.o"

  if [ ! -f "${LIB_SRC_FILE}" ]; then
    echo "FATAL: Library source code not found! [ ${LIB_REL_FOLDER}/${LIB_NAME}.c ]"
    return 1
  fi

  gcc -c "${LIB_SRC_FILE}" -o "${LIB_DST_FILE}"
}

echo "I|Compiling local_console_logging..."
compile_file audit local_console_logging || exit $?

echo "I|Building library libwl.a..."
ar rcs "${WORKSPACE_HOME}/02.build/target/static/libwl.a" "${WORKSPACE_HOME}/02.build/target/compiled/"*.o
