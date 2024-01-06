#include <stdio.h>
#include <math.h>
#include "cordic-32bit.h"
#include "cordic-16bit.h"
#include "cordic-8bit.h"

// Print out sin(x) vs fp CORDIC sin(x)
void compareCordicResults(double angle) {
    int s32, c32, s16, c16, s8, c8;

    // 32-bit CORDIC
    cordic_32bit((angle * MUL_32BIT), &s32, &c32, 32);
    // 16-bit CORDIC
    cordic_16bit((angle * MUL_16BIT), &s16, &c16, 16);
    // 8-bit CORDIC
    cordic_8bit((angle * MUL_8BIT), &s8, &c8, 8);

    // Display results
    printf("Angle: %f\n", angle);
    printf("32-bit CORDIC: %f\t sin(): %f\n", s32 / MUL_32BIT, sin(angle));
    printf("16-bit CORDIC: %f\t sin(): %f\n", s16 / MUL_16BIT, sin(angle));
    printf("8-bit CORDIC: %f\t sin(): %f\n", s8 / MUL_8BIT, sin(angle));
    printf("\n");
}

int main() {
    double angle;
    int i;

    for (i = 0; i < 50; i++) {
        angle = (i / 50.0) * M_PI / 2;
        compareCordicResults(angle);
    }

    return 0;
}