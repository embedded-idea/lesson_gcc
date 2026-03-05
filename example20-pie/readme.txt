-o <file>                Place the output into <file>.
-pie                     Create a dynamically linked position independent executable.
FIRST OF ALL , of course -o option everyone knows,just output the program with the name






FOR PIE
1. Understanding the -pie Option and Examples

The -pie (Position Independent Executable) option is an important linker option in GCC. 
Its purpose is to generate a dynamically linked position-independent executable (PIE).

In simple terms:
#Normal executables (without -pie)
Load at a fixed memory address when executed, which can make them more vulnerable to attacks such as buffer overflows.

#PIE executables (with -pie)
Support Address Space Layout Randomization (ASLR), meaning the program is loaded at a different memory address each time it runs, significantly improving security.

Note:
-pie relies on dynamic linking (enabled by default) and should be used together with -fPIE, which generates position-independent code during compilation.

#GCC 5.0 and later: -pie automatically implies -fPIE

#Older GCC versions: -fPIE must be specified manually

2. Basic Example: Normal Executable vs PIE Executable
Step 1: Test Program (main.c)
Step 2: Compile a Normal Executable (without -pie)
gcc main.c -no-pie -o myapp64

Run it multiple times:
./myapp64
./myapp64
./myapp64

Example output (address remains constant):
Hello PIE! My main function address: 0x401136
Hello PIE! My main function address: 0x401136
Hello PIE! My main function address: 0x401136

Step 3: Compile a PIE Executable (with -pie)
gcc -fPIE -pie main.c -o myapp64withpie

Run it multiple times:
./myapp64withpie
./myapp64withpie
./myapp64withpie

Example output (address changes each time):
Hello PIE! My main function address: 0x56d6a3d7e149
Hello PIE! My main function address: 0x5a6106a8c149
Hello PIE! My main function address: 0x5908d1aaa149

This demonstrates that PIE executables support address randomization.

3. Advanced Example: Using -pie in Cross-Compilation

In embedded cross-compilation environments, PIE can also be used to improve firmware security.

Example:

arm-linux-gnueabihf-gcc \
  -B /opt/arm-toolchain/bin/ \
  --sysroot=/opt/arm-rootfs/ \
  -std=c11 \
  -fPIE -pie \
  -o arm_pie_test test.c

Explanation:

-B specifies the cross toolchain directory

--sysroot specifies the ARM root filesystem

-std=c11 sets the C language standard

-fPIE -pie generates a PIE executable

Output is an ARM executable file

4. How to Verify a PIE Executable

You can verify whether a binary is a PIE executable using file or readelf.

Method 1: Using file
file test_normal
file test_pie

Example output:

Normal executable:

test_normal: ELF 64-bit LSB executable, x86-64, dynamically linked

PIE executable:

test_pie: ELF 64-bit LSB pie executable, x86-64, dynamically linked
Method 2: Using readelf
readelf -h test_pie | grep "Type"

Output:

Type: DYN (Shared object file)

PIE executables are marked as DYN, while normal executables are EXEC.

5. Important Notes

-pie is a linker option, so the compilation stage must generate position-independent code.

GCC ≥ 5.0: -pie automatically implies -fPIE

GCC < 5.0: you must explicitly use -fPIE -pie

PIE executables rely on the dynamic linker, such as:

/lib64/ld-linux-x86-64.so.2

PIE cannot be used with -static, because static linking disables address randomization.

Embedded systems must have kernel support for ASLR; otherwise PIE programs will still run at fixed addresses.

Performance impact:
PIE introduces a very small runtime relocation overhead, which is usually negligible compared to the security benefits.

6. Summary

The -pie option generates dynamically linked position-independent executables. When combined with -fPIE, it enables address space layout randomization (ASLR) to improve program security.

Normal executables use fixed memory addresses

PIE executables load at randomized addresses

The result can be verified using file or readelf

PIE is widely used in production applications and embedded firmware. When using it, remember:

Older GCC versions require -fPIE

It cannot be combined with -static




There are couple options we need to understand it 
-fPIC is a compilation option used to generate position-independent code for shared libraries (.so).
-fPIE is a subset of -fPIC, specifically optimized for position-independent executables (PIE).
The two options should not be mixed: -fPIE is used for executables, while -fPIC is used for shared libraries.



For liba.so with -fPIC
$ gcc -fPIE liba.c -shared -o liba.so
/usr/bin/ld: /tmp/ccHShUfU.o: warning: relocation against `funca' in read-only section `.text'
/usr/bin/ld: /tmp/ccHShUfU.o: relocation R_X86_64_PC32 against symbol `funca' can not be used when making a shared object; recompile with -fPIC
/usr/bin/ld: final link failed: bad value
collect2: error: ld returned 1 exit status
$ gcc -fPIC liba.c -shared -o liba.so

or you could do
gcc -fPIC liba.c -c
gcc -shared liba.o -o liba.so


For myapp64 with -fPIE
gcc -fPIE main.c -c
gcc main.o -o myapp64

For ELF file you could just use command file 
file myapp64, it will tell you it is a PIE file or not

For so file

For o file
??????????? need to figure it out ?????
