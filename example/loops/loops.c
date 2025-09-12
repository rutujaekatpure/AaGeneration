#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#ifndef SW
void __loop_pipelining_on__(uint32_t val, uint32_t buf, uint32_t extreme_flag);
void __aa_barrier__();
#endif

int main() {
    int i, sum = 0;

    // Example 1: for loop
    // printf("Example 1: for loop\n");
    for (i = 1; i <= 5; i++) {
        __loop_pipelining_on__(63,2,1);
        sum = sum + i;
    }
    __aa_barrier__();
    // Example 2: while loop
    // printf("\nExample 2: while loop\n");
    i = 1;
    
    while (i <= 5) {
        __loop_pipelining_on__(63,2,1);
        sum = sum + i;
        i++;
    }

    i = 1;
    
    while (1) {
        __loop_pipelining_on__(63,2,1);
        sum = sum + i;
        i++;
        if (i > 5)
            break;
    }

    // Example 3: do-while loop
    // printf("\nExample 3: do-while loop\n");
    i = 1;
    do {
        __loop_pipelining_on__(63,2,1);
        sum = sum + i;
        i++;
    } while (i <= 5);

    return 0;
}