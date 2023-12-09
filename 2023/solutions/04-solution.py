import re

file_name = "/Users/tea/Library/Mobile Documents/com~apple~CloudDocs/coding/advent-of-code/2023/input/04-input.txt"
file_content = open(file_name).readlines()

### first part, second part
value = {str(i): 0 for i in range(1, 202)}
cards = [1] * 201
for index, line in enumerate(file_content):
    n = 0
    line = re.findall(r'(\d+)', line)
    for i in range(11, 36):
        if line[i] in line[1:11]:
            value[line[0]] = 0.5
    if value[line[0]] == 0.5:
        for i in range(11, 36):
            if line[i] in line[1:11]:
                value[line[0]] = value[line[0]] * 2
                n += 1
    for i in range(n):
        cards[index + i + 1] += cards[index]

print(sum(value.values()))
print(sum(cards))