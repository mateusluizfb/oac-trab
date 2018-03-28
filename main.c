#include <stdio.h>
#include "./mips_instructions/load/load.h"

int main() {
    printf("%d\n", lw(123, 0));
    return 0;
}
