#!/bin/bash
# compile_check.sh
echo ""
echo "TEST->Display compiler version information."
gcc --version       
echo ""
echo "TEST->Display all of the built in spec strings."
gcc -dumpspecs      
echo ""
echo "TEST->Display the version of the compiler."
gcc -dumpversion    
echo ""
echo "TEST->Display the compiler's target processor."
gcc -dumpmachine   

echo ""
echo "TEST->Display the directories in the compiler's search path."
gcc -print-search-dirs       

echo ""
echo "TEST->Display the name of the compiler's companion library."
gcc -print-libgcc-file-name

echo""
echo "TEST->Display the full path to library <lib>."
gcc -print-file-name=libgcc.a

echo""
echo "TEST->Display the full path to compiler component <prog>."
gcc -print-prog-name=cc1

echo""
echo "Display the target's normalized GNU triplet, used as a component in the library path."
gcc -print-multiarch

echo""
echo "Display the root directory for versions of libgcc."
gcc -print-multi-directory


echo""
echo "Display the mapping between command line options and multiple library search directories."
gcc -print-multi-lib 

echo""
echo "Display the relative path to OS libraries."
gcc -print-multi-os-directory 

echo""
echo "Display the target libraries directory."
gcc -print-sysroot           

echo""
echo "Display the sysroot suffix used to find headers."
gcc -print-sysroot-headers-suffix

