 #0)People often say “the GCC compiler,” but it is actually not just a single program. GCC is a collection of programs used to compile source code into an executable program.
Please look at the following command; it shows how many different programs GCC actually invokes during the compilation process.

/usr/lib/gcc/x86_64-linux-gnu/11/cc1            (compile your main.c to main.s)
as                                              (compile main.s to object file main.o,this tool actually is not from gcc ,it is from binutils)
/usr/lib/gcc/x86_64-linux-gnu/11/collect2       (link Wrapper will call /usr/bin/ld,it also from binutils)

 #1)run "gcc main.c -o main -v" would see the work flow clearly.
Using built-in specs.
COLLECT_GCC=gcc
COLLECT_LTO_WRAPPER=/usr/lib/gcc/x86_64-linux-gnu/11/lto-wrapper
OFFLOAD_TARGET_NAMES=nvptx-none:amdgcn-amdhsa
OFFLOAD_TARGET_DEFAULT=1
Target: x86_64-linux-gnu
Configured with: ../src/configure -v --with-pkgversion='Ubuntu 11.4.0-1ubuntu1~22.04.3' --with-bugurl=file:///usr/share/doc/gcc-11/README.Bugs --enable-languages=c,ada,c++,go,brig,d,fortran,objc,obj-c++,m2 --prefix=/usr --with-gcc-major-version-only --program-suffix=-11 --program-prefix=x86_64-linux-gnu- --enable-shared --enable-linker-build-id --libexecdir=/usr/lib --without-included-gettext --enable-threads=posix --libdir=/usr/lib --enable-nls --enable-bootstrap --enable-clocale=gnu --enable-libstdcxx-debug --enable-libstdcxx-time=yes --with-default-libstdcxx-abi=new --enable-gnu-unique-object --disable-vtable-verify --enable-plugin --enable-default-pie --with-system-zlib --enable-libphobos-checking=release --with-target-system-zlib=auto --enable-objc-gc=auto --enable-multiarch --disable-werror --enable-cet --with-arch-32=i686 --with-abi=m64 --with-multilib-list=m32,m64,mx32 --enable-multilib --with-tune=generic --enable-offload-targets=nvptx-none=/build/gcc-11-0odw26/gcc-11-11.4.0/debian/tmp-nvptx/usr,amdgcn-amdhsa=/build/gcc-11-0odw26/gcc-11-11.4.0/debian/tmp-gcn/usr --without-cuda-driver --enable-checking=release --build=x86_64-linux-gnu --host=x86_64-linux-gnu --target=x86_64-linux-gnu --with-build-config=bootstrap-lto-lean --enable-link-serialization=2
Thread model: posix
Supported LTO compression algorithms: zlib zstd
gcc version 11.4.0 (Ubuntu 11.4.0-1ubuntu1~22.04.3) 
COLLECT_GCC_OPTIONS='-o' 'main' '-v' '-mtune=generic' '-march=x86-64'
 /usr/lib/gcc/x86_64-linux-gnu/11/cc1 -quiet -v -imultiarch x86_64-linux-gnu main.c -quiet -dumpbase main.c -dumpbase-ext .c -mtune=generic -march=x86-64 -version -fasynchronous-unwind-tables -fstack-protector-strong -Wformat -Wformat-security -fstack-clash-protection -fcf-protection -o /tmp/cc0Ak0SA.s
GNU C17 (Ubuntu 11.4.0-1ubuntu1~22.04.3) version 11.4.0 (x86_64-linux-gnu)
        compiled by GNU C version 11.4.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.24-GMP

GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
ignoring nonexistent directory "/usr/local/include/x86_64-linux-gnu"
ignoring nonexistent directory "/usr/lib/gcc/x86_64-linux-gnu/11/include-fixed"
ignoring nonexistent directory "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../x86_64-linux-gnu/include"
#include "..." search starts here:
#include <...> search starts here:
 /usr/lib/gcc/x86_64-linux-gnu/11/include
 /usr/local/include
 /usr/include/x86_64-linux-gnu
 /usr/include
End of search list.
GNU C17 (Ubuntu 11.4.0-1ubuntu1~22.04.3) version 11.4.0 (x86_64-linux-gnu)
        compiled by GNU C version 11.4.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.24-GMP

GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
Compiler executable checksum: 46ebede1f5b795a957a1e85cb61af9d8
COLLECT_GCC_OPTIONS='-o' 'main' '-v' '-mtune=generic' '-march=x86-64'
 as -v --64 -o /tmp/ccDfoSdo.o /tmp/cc0Ak0SA.s
GNU assembler version 2.38 (x86_64-linux-gnu) using BFD version (GNU Binutils for Ubuntu) 2.38
COMPILER_PATH=/usr/lib/gcc/x86_64-linux-gnu/11/:/usr/lib/gcc/x86_64-linux-gnu/11/:/usr/lib/gcc/x86_64-linux-gnu/:/usr/lib/gcc/x86_64-linux-gnu/11/:/usr/lib/gcc/x86_64-linux-gnu/
LIBRARY_PATH=/usr/lib/gcc/x86_64-linux-gnu/11/:/usr/lib/gcc/x86_64-linux-gnu/11/../../../x86_64-linux-gnu/:/usr/lib/gcc/x86_64-linux-gnu/11/../../../../lib/:/lib/x86_64-linux-gnu/:/lib/../lib/:/usr/lib/x86_64-linux-gnu/:/usr/lib/../lib/:/usr/lib/gcc/x86_64-linux-gnu/11/../../../:/lib/:/usr/lib/
COLLECT_GCC_OPTIONS='-o' 'main' '-v' '-mtune=generic' '-march=x86-64' '-dumpdir' 'main.'
 /usr/lib/gcc/x86_64-linux-gnu/11/collect2 -plugin /usr/lib/gcc/x86_64-linux-gnu/11/liblto_plugin.so -plugin-opt=/usr/lib/gcc/x86_64-linux-gnu/11/lto-wrapper -plugin-opt=-fresolution=/tmp/ccsLRkpu.res -plugin-opt=-pass-through=-lgcc -plugin-opt=-pass-through=-lgcc_s -plugin-opt=-pass-through=-lc -plugin-opt=-pass-through=-lgcc -plugin-opt=-pass-through=-lgcc_s --build-id --eh-frame-hdr -m elf_x86_64 --hash-style=gnu --as-needed -dynamic-linker /lib64/ld-linux-x86-64.so.2 -pie -z now -z relro -o main /usr/lib/gcc/x86_64-linux-gnu/11/../../../x86_64-linux-gnu/Scrt1.o /usr/lib/gcc/x86_64-linux-gnu/11/../../../x86_64-linux-gnu/crti.o /usr/lib/gcc/x86_64-linux-gnu/11/crtbeginS.o -L/usr/lib/gcc/x86_64-linux-gnu/11 -L/usr/lib/gcc/x86_64-linux-gnu/11/../../../x86_64-linux-gnu -L/usr/lib/gcc/x86_64-linux-gnu/11/../../../../lib -L/lib/x86_64-linux-gnu -L/lib/../lib -L/usr/lib/x86_64-linux-gnu -L/usr/lib/../lib -L/usr/lib/gcc/x86_64-linux-gnu/11/../../.. /tmp/ccDfoSdo.o -lgcc --push-state --as-needed -lgcc_s --pop-state -lc -lgcc --push-state --as-needed -lgcc_s --pop-state /usr/lib/gcc/x86_64-linux-gnu/11/crtendS.o /usr/lib/gcc/x86_64-linux-gnu/11/../../../x86_64-linux-gnu/crtn.o
COLLECT_GCC_OPTIONS='-o' 'main' '-v' '-mtune=generic' '-march=x86-64' '-dumpdir' 'main.

#2) How to find the real gcc on your computer 
$ which gcc
/usr/bin/gcc
$ ls /usr/bin/gcc -l
lrwxrwxrwx 1 root root 6 Aug  5  2021 /usr/bin/gcc -> gcc-11
$ ls /usr/bin/gcc-11 -l
lrwxrwxrwx 1 root root 23 Dec 17 23:31 /usr/bin/gcc-11 -> x86_64-linux-gnu-gcc-11
$ ls /usr/bin/x86_64-linux-gnu-gcc-11 -l
-rwxr-xr-x 1 root root 928584 Dec 17 23:31 /usr/bin/x86_64-linux-gnu-gcc-11

#3)How to find the real as
$ ls /usr/bin/as -l
lrwxrwxrwx 1 root root 19 Dec  3 07:08 /usr/bin/as -> x86_64-linux-gnu-as
$ ls /usr/bin/x86_64-linux-gnu-as -l
-rwxr-xr-x 1 root root 467352 Dec  3 07:08 /usr/bin/x86_64-linux-gnu-as

#4)How to find the real ld
$ which ld
/usr/bin/ld
$ ls /usr/bin/ld -l
lrwxrwxrwx 1 root root 19 Dec  3 07:08 /usr/bin/ld -> x86_64-linux-gnu-ld
$ ls /usr/bin/x86_64-linux-gnu-ld -l
lrwxrwxrwx 1 root root 23 Dec  3 07:08 /usr/bin/x86_64-linux-gnu-ld -> x86_64-linux-gnu-ld.bfd
$ ls /usr/bin/x86_64-linux-gnu-ld.bfd
/usr/bin/x86_64-linux-gnu-ld.bfd
$ ls /usr/bin/x86_64-linux-gnu-ld.bfd -l
-rwxr-xr-x 1 root root 1736184 Dec  3 07:08 /usr/bin/x86_64-linux-gnu-ld.bfd


#5) please read the makefile and hands on it to see what happen by type
do not worry about /usr/lib/gcc/x86_64-linux-gnu/11/cc1 param for now ,i just got it from #1)
make            (build it and run)
make clean      (clean it )
