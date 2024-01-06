#include <stdio.h>
#include <math.h>

double square_root(double x, double epsilon) {
    double guess = x / 2.0; // Initial guess
    while (fabs(guess * guess - x) > epsilon) {
        guess = (guess + x / guess) / 2.0; // Newton-Raphson method
    }
    return guess;
}

int main() {
    double number = 25.0;
    double epsilon = 1e-6; // Precision

    double result = square_root(number, epsilon);

    printf("Square root of %.2f is %.6f\n", number, result);

    return 0;
}