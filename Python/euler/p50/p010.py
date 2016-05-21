"""
Find the sum of all primes below two million.
"""

from euler.utils.primes import eratosthenes


def main():
    gen = eratosthenes(1999999)
    total = 0
    for x in gen:
        total += x
    return total


if __name__ == '__main__':
    main()
