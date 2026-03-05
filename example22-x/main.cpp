
#include<stdio.h>

#ifdef __cplusplus
extern "C" {
#endif

// C 函数声明
int funca();

#ifdef __cplusplus
}
#endif

int main() {
    printf("HelloWorld funca return %d\n",funca());
    return 0;
}