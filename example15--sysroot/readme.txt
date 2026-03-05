1. Core Usage of the --sysroot=<directory> Option

The --sysroot=<directory> option is an important feature in compilers such as GCC and Clang. Its main purpose is to treat the specified <directory> as the system root directory when searching for header files and libraries, instead of using the default root directory /.

In other words, the compiler normally searches for headers and libraries in locations such as:

/usr/include

/lib

/usr/lib

After using this option, the compiler will instead search in:

<directory>/usr/include

<directory>/lib

<directory>/usr/lib

This option is most commonly used for cross-compilation (for example, compiling ARM programs on an x86 machine), but it can also be used to isolate build environments or avoid library version conflicts.

2. Understanding Default Search Paths

By default, the compiler searches for headers and libraries relative to the system root directory /.

Typical default locations include:

Header files

/usr/include

/usr/local/include

Library files

/lib

/usr/lib

/usr/local/lib

When using:

--sysroot=<dir>

all of these default paths are prefixed with <dir>. For example:

/usr/include → <dir>/usr/include
3. Basic Usage Syntax
gcc --sysroot=<root-directory> [other options] source-file -o output-file

Example for cross-compilation:

arm-linux-gnueabihf-gcc --sysroot=/opt/arm-rootfs main.c -o main
4. Typical Usage Scenarios
Scenario 1: Cross-Compilation (Most Common Use)

Suppose you want to compile an ARM program on an x86_64 host.
You first need an ARM root filesystem that contains ARM headers and libraries. Then specify it using --sysroot.

Example:

arm-linux-gnueabihf-gcc \
  --sysroot=/opt/arm-rootfs \
  -std=c11 \
  -o arm-app main.c

In this case the compiler will:

Search for headers in:

/opt/arm-rootfs/usr/include

instead of the host path:

/usr/include

Search for libraries in:

/opt/arm-rootfs/usr/lib

instead of:

/usr/lib
Scenario 2: Isolating the Build Environment

If the system contains multiple library versions (for example libc 2.27 and libc 2.35), you can isolate builds by creating separate root filesystems.

Example:

gcc --sysroot=/opt/libc-2.35-rootfs -o app main.c -lc

In this case the compiler will only use the libc 2.35 located in that root filesystem.

Scenario 3: Using with -I and -L

--sysroot replaces the global root directory, while -I and -L add additional search paths.

Example:

gcc --sysroot=/opt/arm-rootfs \
  -I/opt/arm-rootfs/my-include \
  -L/opt/arm-rootfs/my-lib \
  -o app main.c -lmylib

Explanation:

-I adds an additional header directory

-L adds an additional library directory

-lmylib links with libmylib.so

5. Verifying That sysroot Is Working

You can verify the actual header and library search paths with the following commands.

Check header search paths:

gcc --sysroot=/opt/arm-rootfs -v main.c

Check library search paths:

gcc --sysroot=/opt/arm-rootfs -print-search-dirs

You should see that the include and libraries paths are prefixed with:

/opt/arm-rootfs
6. Important Notes

--sysroot replaces the default root directory, rather than adding to it. The compiler will no longer search the host system paths such as /usr/include.

The root filesystem must follow a standard directory structure, typically including:

usr/include
usr/lib
lib

Otherwise the compiler may report missing headers or libraries.

During cross-compilation, --sysroot is usually used together with a cross compiler such as:

arm-linux-gnueabihf-gcc

The root filesystem must match the target architecture.

Some compilers also support partial alternatives such as:

-isysroot (for header files only)

library-specific options

However, --sysroot is generally the recommended global solution.