#!/bin/sh

SRC_FILE="${WORKSPACE_HOME}/01.src/main.c"

if [ ! -f "${SRC_FILE}" ]; then
  echo "FATAL: Source code not found!"
fi

DST_FILE="${WORKSPACE_HOME}/02.build/target/main"

# Compile the source code
gcc -O3 -fdata-sections -ffunction-sections \
  -o "${DST_FILE}.variant1" \
  -static \
  "${SRC_FILE}" \
  -Wl,--gc-sections \
  || exit 1

strip --strip-all "${DST_FILE}.variant1" -o "${DST_FILE}.variant1.stripped" || exit 6

gcc -o "${DST_FILE}.variant2" \
  -static \
  "${SRC_FILE}" \
  || exit 2

strip --strip-all "${DST_FILE}.variant2" -o "${DST_FILE}.variant2.stripped" || exit 5

gcc -Oz -fdata-sections -ffunction-sections \
  -o "${DST_FILE}.variant3" \
  -static \
  "${SRC_FILE}" \
  -Wl,--gc-sections \
  || exit 3

strip --strip-all "${DST_FILE}.variant3" -o "${DST_FILE}.variant3.stripped" || exit 4