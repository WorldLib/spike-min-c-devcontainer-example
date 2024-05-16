#!/bin/sh

LINTER_ERRORS=0

if [ ! -f "$WORKSPACE_HOME/01.src/main.c" ]; then
    echo "ERROR: main.c not found"
    exit 1
fi

#flawfinder --error-level=1 --neverignore "$WORKSPACE_HOME/01.src/main.c"
flawfinder --error-level=1 "$WORKSPACE_HOME/01.src/main.c"
flawfinderResult=$?
if [ $flawfinderResult -ne 0 ]; then
    LINTER_ERRORS=$((LINTER_ERRORS + 1))
    echo "ERROR: flawfinder returned $flawfinderResult"
fi

#cppcheck --enable=all --inconclusive --std=c99 --language=c --force "$WORKSPACE_HOME/01.src/main.c"
cppcheck --enable=all --language=c --force --suppress=missingIncludeSystem "$WORKSPACE_HOME/01.src/main.c"
if [ $LINTER_ERRORS -ne 0 ]; then
    echo "FATAL: Linting failed with $LINTER_ERRORS errors"
    exit 2
fi