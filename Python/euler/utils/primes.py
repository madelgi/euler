"""
Functions for generating prime numbers.
"""
from math import sqrt, floor


def is_prime(n):
    """
    Check if a given number is prime.
    """
    if n == 2:
        return True
    if n == 3:
        return True
    if n % 2 == 0:
        return False
    if n % 3 == 0:
        return False

    i = 5
    w = 2
    while i*i <= n:
        if n % i == 0:
            return False
        i += w
        w = 6 - w

    return True


def eratosthenes(n):
    bools = [False, False] + [True for x in range(n-2)]
    for i in xrange(n):        # int(floor(sqrt(n)))
        if bools[i]:
            yield i
            for j in xrange(i**2, n, i):
                bools[j] = False
