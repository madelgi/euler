"""
A library of number-theoretic functions.
"""


def fibs(n):
    """
    Return the nth fibonacci number.
    """
    def fibs(n, a, b):
        if n == 0:
            return a
        else:
            return fibs(n-1, b, a+b)

    return fibs(n, 0, 1)


def fib_list(n):
    """
    Generate the first n fibonacci numbers, return the full list.
    """
    fib_list = []
    n1 = 0
    n2 = 1
    while n > 0:
        fib_list.append(n1)
        n1, n2 = n2, n1+n2
        n = n-1
    return fib_list


def fib_list_gen(n):
    """
    Generate the first n fibonacci numbers.
    """
    n1 = 0
    n2 = 1
    while n > 0:
        yield n1
        n1, n2 = n2, n1+n2
        n = n-1


def fib_list_limit(n):
    """
    Generate all fibonacci numbers less than n, return the full list.
    """
    fib_list = []
    n1 = 0
    n2 = 1
    while n1 < n:
        fib_list.append(n1)
        n1, n2 = n2, n1+n2
    return fib_list


def fib_list_limit_gen(n):
    """
    Generate the first n fibonacci numbers.
    """
    n1 = 0
    n2 = 1
    while n1 < n:
        yield n1
        n1, n2 = n2, n1+n2
