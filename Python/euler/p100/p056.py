def raise_to(a, b):
    max_sum = 0
    for base in range(1, a+1):
        for exp in range(1, b+1):
            digit_sum = sum(map(int, list(str(base**exp))))
            if digit_sum > max_sum:
                max_sum = digit_sum

    return max_sum


def main():
    return raise_to(100, 100)

if __name__ == '__main__':
    print main()
