"""
By considering the terms in the Fibonacci sequence whose values do not exceed
four million, find the sum of the even-valued terms.
"""
from euler.utils.arithmetic import fib_list_limit_gen


def main():
    fibs = fib_list_limit_gen(4000000)
    total = 0
    for x in fibs:
        if x % 2 == 0:
            total += x
    return total


if __name__ == '__main__':
    main()
