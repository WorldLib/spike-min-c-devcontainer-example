#!/bin/sh

"${WORKSPACE_HOME}/02.build/build_libs.sh" || exit $?

SRC_FILE="${WORKSPACE_HOME}/01.src/main.c"

if [ ! -f "${SRC_FILE}" ]; then
  echo "FATAL: Source code not found!"
fi


DST_FILE="${WORKSPACE_HOME}/02.build/target/main"

echo "I|Compiling main.c variant 1 ..."
# Compile the source code
gcc -O3 -fdata-sections -ffunction-sections  \
  -static -g \
  "${SRC_FILE}" \
  "-L${WORKSPACE_HOME}/02.build/target/static/" \
  "-lwl" \
  -o "${DST_FILE}.variant1" \
  -Wl,--gc-sections \
  || exit 1

strip --strip-all "${DST_FILE}.variant1" -o "${DST_FILE}.variant1.stripped" || exit 6

echo "I|Compiling main.c variant 1 ..."
gcc -fdiagnostics-color=always \
  -g -static \
  "${SRC_FILE}" \
  "-L${WORKSPACE_HOME}/02.build/target/static/" \
  "-lwl" \
  -o "${DST_FILE}.variant2" \
  || exit 2

echo "I|Stripping variant 1 ..."
strip --strip-all "${DST_FILE}.variant2" -o "${DST_FILE}.variant2.stripped" || exit 5

echo "I|Compiling main.c variant 1 ..."
gcc -Oz -fdata-sections -ffunction-sections \
  -o "${DST_FILE}.variant3" \
  -static \
  "${SRC_FILE}" \
  "-L${WORKSPACE_HOME}/02.build/target/static/" \
  "-lwl" \
  -Wl,--gc-sections \
  || exit 3

strip --strip-all "${DST_FILE}.variant3" -o "${DST_FILE}.variant3.stripped" || exit 4
