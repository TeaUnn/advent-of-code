### first part
def find_calibration(input):
    cal = []
    for line in input:
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

file_name = "/Users/tea/Library/Mobile Documents/com~apple~CloudDocs/coding/advent-of-code/2023/input/01-input.txt"
file_content = open(file_name).readlines()

print(find_calibration(file_content))

### second part
def find_cal_letters(input):
    for i, line in enumerate(input):
        input[i] = line.replace("zero", "zero0zero")
        input[i] = input[i].replace("one", "one1one")
        input[i] = input[i].replace("two", "two2two")
        input[i] = input[i].replace("three", "three3three")
        input[i] = input[i].replace("four", "four4four")
        input[i] = input[i].replace("five", "five5five")
        input[i] = input[i].replace("six", "six6six")
        input[i] = input[i].replace("seven", "seven7seven")
        input[i] = input[i].replace("eight", "eight8eight")
        input[i] = input[i].replace("nine", "nine9nine")
    return find_calibration(input)

print(find_cal_letters(file_content))