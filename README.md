![MATLAB](https://img.shields.io/badge/MATLAB-R2025a-orange)
![License](https://img.shields.io/badge/license-MIT-blue)

# prime-hunter
MATLAB tool for determining primality of single values or locating all primes in a range of values.

# Overview

This function provides multiple tools for working with prime numbers:

* Determining whether an individual number is prime

* Returning all primes less than or equal to a specified integer value

* Returning all primes within a user-defined interval

* Validating inputs and returning descriptive error messages

* Displaying total calculation time

This project was originally developed out of an interest in discovering new prime numbers, however, this is not possible due to the limitations of how MATLAB stores large numbers, which is explained below.

# Function Syntax

prime = primeHunter(num, sequential)

Inputs:

* num: a positive integer

* sequential: an integer greater than or equal to zero which determines the behavior of the function

If sequential = 0, determines if num is prime by outputing logical true for prime or logical false for nonprime

If sequential = 1, returns all primes less than or equal to num and places them in a structure array

If sequential > 1, returns all primes in the interval [sequential, num] and places them in a structure array

Outputs:

prime: logical true/false if sequential = 0; 1xn structure array if sequential > 0

Note that num must always be a positive integer and sequential must always be less than num, otherwise the function will return a text description of the issue.

# Example and Demo

Below are some examples of inputs and what they would return. I have uploaded a demo script in the main repository to further demonstrate the function's capabilities.

prime = primeHunter(29,0) &rarr; returns logical true

prime = primeHunter(100,1) &rarr; returns all primes from 100 to 1 in a structure array

prime = primeHunter(100, 50) &rarr; returns all primes from 100 to 50 in a structure array

## Quick Start

1. Download or clone the repository

2. Add the folder to your MATLAB path

3. Run the function with your chosen input parameters

# Notes About Method and Limitations 

In order to determine if an input value is prime, I first considered the definition of a prime number, which is a positive integer greater than 1 whose factors are only 1 and itself. This immediately excludes all even integers, save for 2, from being prime, and as such, the function will immediately designate any even number greater than 2 as nonprime.

For odd integers, I turned to the mod function, which gives the remainder after dividing the input by a given value. By placing the mod function in a loop, I can test if any integer less than the input value is a factor of the input value, which excludes it from being prime. I utilize this observation frequently in the code to determine primality.

Additionally, I take an approach of initially assuming that all inputs in an interval of interest are prime, using modular arithmetic to identify which values are actually nonprime, then masking out the remaining prime numbers. This was done in order to leverage preallocation, which significantly reduces calculation time.

However, due to floating point representation, values that require more than 53 bits of information to store are rounded for efficiency, often to an even number in my experience, meaning that the function is not accurate for inputs greater than $$2^{53}$$. For example, an obviously uneven number such as $$2^{87} + 1$$ will be treated as even and automatically designated as nonprime by the function, even if this number is actually prime.

Unfortunately, this is a fundamental problem with MATLAB and there aren't any practical or efficient solutions. Symbolic math could work in theory by forcing MATLAB to store the exact value of the input, but this would cause the computation time to increase exponentially. As such, I can't use this function for discovering new prime as I had hoped, since the largest known sequences of primes far exceed $$2^{53}$$. Additionally, modular arithmetic is very slow, especially for large numbers, so it is not practical for working with large values or intervals.

Nonetheless, building this function taught me a lot about both prime numbers and the limits of computing. I encourage the user to experiment with different input values and intervals to see what kind of primes result.
