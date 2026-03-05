-std=<standard>          Assume that the input sources are for <standard>.
1. Understanding the Default Language Standard
Different versions of GCC use different default language standards.
C language
GCC 5 and later: default is gnu11 (C11 standard + GCC extensions)
GCC 4.x: default is gnu89
C++ language
GCC 11 and later: default is gnu++17
GCC 9–10: default is gnu++14
The gnu prefix means:
Standard language specification + GCC-specific extensions
If the prefix gnu is removed (for example c11 or c++17), the compiler follows the pure standard without GCC extensions.

2. Common <standard> Parameter Values
Language	Standard Option	Description
C	c89 / ansi	Original C89 / ANSI C standard
C	c99 / iso9899:1999	C99 standard (supports variable-length arrays, etc.)
C	c11 / iso9899:2011	C11 standard (adds atomic operations, etc.)
C	c17 / c18	Minor revisions of C11
C	gnu89 / gnu99 / gnu11	Corresponding standards + GCC extensions
C++	c++98 / c++03	C++98 / C++03 standard
C++	c++11 / c++0x	C++11 standard (0x was the pre-release identifier)
C++	c++14 / c++1y	C++14 standard
C++	c++17 / c++1z	C++17 standard
C++	c++20 / c++2a	C++20 standard
C++	gnu++11 / gnu++17	Corresponding C++ standards + GCC extensions