"""
How many different ways can one hundred be written as a sum of at least two
positive integers
"""


def partition(n):
    """
    Determine how many ways you can write a number n as a sum of integers.
    """
    coeffs = [0]*(n+1)
    coeffs[0] = 1
    for k in xrange(1, n+1):
        for i in xrange(0, n-k):
            coeffs[i+k] += coeffs[i]
    return coeffs


def main():
    return partition(100)
