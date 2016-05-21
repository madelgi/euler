from itertools import product


LIMIT = 20161


def abundant_numbers(limit):
    """Get a list of abundant numbers from 1 to limit."""
    return [x for x in xrange(1,limit+1) if (sum(factors(x)) - x) > x]


def factors(n):
    """Get the factors of a number."""
    return set(reduce(list.__add__,
                ([i, n//i] for i in range(1, int(n**0.5) + 1) if n % i == 0)))


def main():
    x = abundant_numbers(LIMIT)
    abundant_sums = [sum([y1, y2]) for y1, y2 in product(x,x) if
                     sum([y1, y2]) < LIMIT]
    print sum(set(range(1, LIMIT+1))-set(abundant_sums))


if __name__ == '__main__':
    main()
