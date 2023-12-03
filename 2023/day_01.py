import aoc_helper

raw = aoc_helper.fetch(1, 2023)


def parse_raw(raw: str):
    return raw.splitlines()


data = parse_raw(raw)


# providing this default is somewhat of a hack - there isn't any other way to
# force type inference to happen, AFAIK - but this won't work with standard
# collections (list, set, dict, tuple)
def part_one(data=data):
    cal = []
    for line in data:
        first = None
        last = None
        for digit in line:
            if digit.isnumeric():
                first = int(digit)
                break
        for digit in reversed(line):
            if digit.isnumeric():
                last = int(digit)
                break
        cal.append(first * 10 + last)
    return sum(cal)


aoc_helper.lazy_test(day=1, year=2023, parse=parse_raw, solution=part_one)


# providing this default is somewhat of a hack - there isn't any other way to
# force type inference to happen, AFAIK - but this won't work with standard
# collections (list, set, dict, tuple)
def part_two(data=data):
    pass


aoc_helper.lazy_test(day=1, year=2023, parse=parse_raw, solution=part_two)

aoc_helper.lazy_submit(day=1, year=2023, solution=part_one, data=data)
aoc_helper.lazy_submit(day=1, year=2023, solution=part_two, data=data)
