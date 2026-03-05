-B <directory>           Add <directory> to the compiler's search paths.

1. Core Usage of the -B <directory> Option

The -B <directory> option is a fundamental option in GCC. Its primary purpose is to add the specified <directory> to the compiler’s toolchain search path.

It is important to distinguish it from other related options:

-I adds additional header file search paths.

-L adds additional library search paths.

--sysroot replaces the global system root directory (all default paths are prefixed with the specified directory).

-B globally adds a directory to the toolchain search path, which may include:

compiler frontends (cc1, cc1plus)

assembler (as)

linker (ld)

startup object files (.o)

libraries (.so, .a)

specs files

In simple terms:

-B tells the compiler to look in the specified directory first when searching for toolchain components.

Unlike -I and -L, which only affect headers and libraries, and --sysroot, which changes the root directory, -B influences the entire toolchain lookup process.

2. Basic Usage Syntax
gcc -B <directory> [other options] source-file -o output-file

Example:

gcc -B /opt/my-toolchain/bin/ main.c -o main

Note:

It is recommended that the directory specified after -B ends with a trailing slash (/), such as /opt/toolchain/, to avoid potential path parsing issues.

3. Toolchain Components Affected by -B

When using -B <dir>, GCC will search for the following components under <dir> before using the default system locations.

Component Type	Example Path (-B /opt/arm-toolchain/)	Purpose
Compiler frontend	/opt/arm-toolchain/cc1	C compilation frontend
Assembler	/opt/arm-toolchain/as	Processes assembly code
Linker	/opt/arm-toolchain/ld	Links object files
Libraries	/opt/arm-toolchain/lib/libc.so	System or custom libraries
Startup objects	/opt/arm-toolchain/crt0.o	Program startup files
4. Typical Usage Scenarios
Scenario 1: Cross-Compilation (Most Common)

During cross-compilation, the toolchain components (such as as and ld) associated with a cross compiler like arm-linux-gnueabihf-gcc are usually located in a dedicated directory.

Using -B ensures the compiler uses these tools instead of the host system's defaults.

Example:

gcc -B /opt/arm-linux-gnueabihf/bin/ \
  --sysroot=/opt/arm-rootfs \
  -std=c11 \
  -o arm-app main.c

In this case:

The compiler will use /opt/arm-linux-gnueabihf/bin/ld (ARM linker)

Instead of the host linker /usr/bin/ld (x86 linker)

Scenario 2: Using Custom Compiler Tools

If you have built a custom version of the assembler (as) and installed it in /opt/custom-as/, you can instruct GCC to prefer this version.

Example:

gcc -B /opt/custom-as/ main.c -o main

This causes GCC to use:

/opt/custom-as/as

instead of the system default assembler.

Scenario 3: Combining with -L and --sysroot

-B adds toolchain search paths, --sysroot replaces the root filesystem, and -L adds additional library paths. These options are often used together.

Example:

arm-linux-gnueabihf-gcc \
  -B /opt/arm-toolchain/bin/ \
  --sysroot=/opt/arm-rootfs/ \
  -L/opt/arm-rootfs/my-lib/ \
  -I/opt/arm-rootfs/my-include/ \
  -o arm-app main.c -lmylib

Explanation:

-B /opt/arm-toolchain/bin/ specifies the cross toolchain location

--sysroot /opt/arm-rootfs/ defines the ARM root filesystem

-L adds additional library directories

-I adds additional header directories

-lmylib links against the custom library libmylib