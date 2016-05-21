"""
What is the 10,001st prime number?
"""

from euler.utils.primes import eratosthenes


def main():
    gen = eratosthenes(1000000)
    num = 1
    for prime in gen:
        if num == 10001:
            return prime
        num += 1


if __name__ == '__main__':
    main()
