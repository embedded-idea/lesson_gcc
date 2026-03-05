#!/bin/bash
# compile_check.sh
gcc -pass-exit-codes main.c -o main 2>/dev/null  # Redirect the error output and check only the exit code.
exit_code=$?

if [ $exit_code -ne 0 ]; then
    echo "we got -pass-exit-codes, code is $? error： from cc1/as/ld etc"
fi

	



