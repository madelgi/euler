from fractions import gcd


def generate_reduced_fracs(d):
    reduced = []
    for n in range(1, d):
        if gcd(n, d) is 1:
            reduced.append((n, d))
    return reduced
