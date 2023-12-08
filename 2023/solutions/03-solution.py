import re, math

file_name = "/Users/tea/Library/Mobile Documents/com~apple~CloudDocs/coding/advent-of-code/2023/input/03-input.txt"
with open(file_name, 'r') as file:
    file_content = [line.rstrip('\n') for line in file.readlines()]

test = ["467..114..",
        "...*......",
        "..35..633.",
        "......#...",
        "617*......",
        ".....+.58.",
        "..592.....",
        "......755.",
        "...$.*....",
        ".664.598.."]

### first part
rows = len(file_content)
cols = len(file_content[0])

chars = {}
for r in range(rows):
    for c in range(cols):
        if file_content[r][c] not in '0123456789.':
            chars[(r, c)] = []

for r, row in enumerate(file_content):
    for number in re.finditer(r'\d+', row):
        pos = {(r, c) for r in (r-1, r, r+1)
                       for c in range(number.start()-1, number.end()+1)}
        for include in pos & chars.keys():
            chars[include].append((int(number.group())))

print(sum(sum(sublist) for sublist in chars.values()))

### second part
print(sum(math.prod(sublist) for sublist in chars.values() if len(sublist) == 2))