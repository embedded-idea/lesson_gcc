-no-canonical-prefixes   Do not canonicalize paths when building relative prefixes to other gcc components.

prerequisite: understand “path canonicalization.”
By default, GCC converts all paths into a canonical form (absolute paths with redundant separators removed). 
For example:
A relative path such as ../libexec/gcc/ may be canonicalized to /usr/libexec/gcc/x86_64-linux-gnu/11/.
A redundant path like usr//lib///gcc/ will be normalized to /usr/lib/gcc/.
The -no-canonical-prefixes option preserves the original relative path format instead of canonicalizing it. This can be particularly useful when debugging compilation paths or when working with cross-platform and cross-compilation environments.