"""
Find the difference between the sum of the squares of the first one hundred
natural numbers and the square of the sum.
"""


def main():
    sum_of_sqs = sum([x**2 for x in range(101)])
    sq_of_sum = sum(range(101))**2
    return sq_of_sum - sum_of_sqs


if __name__ == '__main__':
    main()
