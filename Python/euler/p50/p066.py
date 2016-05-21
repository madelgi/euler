"""
x^2 = 1 + Dy^2
x   = sqrt(1 + Dy^2)
:
"""

from math import sqrt


def min_x(d):
    if sqrt(d) == int(sqrt(d)):
        return None
    x = 1
    y = 1
    solution = -1
    while solution is not 1:
        for y in xrange(1, 1000000):
            solution = x**2 - d*y**2
            if solution <= 1:
                break
            print "x: {0}, y: {1}".format(x, y)
        if solution == 1:
            break
        # heuristic?
        if x > 5000:
            return None
        x += 1
    return (x, d, y)


def main():
    min_x(7)

if __name__ == '__main__':
    main()
