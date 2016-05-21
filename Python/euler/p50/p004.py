"""
A palindromic number reads the same both ways. The largest palindrome made from
the product of two 2-digit numbers is 9009 = 91 * 99.

Find the largest palindrome made from the product of two 3-digit numbers.
"""


def is_palindrome(n):
    """
    Predicate for checking whether a given n is a palindromic number.
    """
    word = str(n)
    mid = len(word)/2
    return (word[:mid] == word[mid:])


def main():
    biggest = 0
    for i in xrange(100, 1000):
        for j in xrange(i, 1000):
            prod = i*j
            if is_palindrome(prod) and prod > biggest:
                biggest = prod

    return prod


if __name__ == '__main__':
    main()
