import re, math

file_name = "/Users/tea/Library/Mobile Documents/com~apple~CloudDocs/coding/advent-of-code/2023/input/02-input.txt"
file_content = open(file_name).readlines()

test = ["Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green",
"Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue",
"Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red",
"Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red",
"Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green"]

### first part
def find_possible_games(input, r, g, b):
    possible = []
    bag = {'r':r, 'g':g, 'b':b}
    for line in input:
        for num, col in re.findall(r'(\d+) (\w)', line):
            success = True
            if bag[col] < int(num):
                success = False
                break
        if success:
            possible.append(int(re.search(r'Game (\d+)', line).group(1)))
    return sum(possible)

print(find_possible_games(file_content, 12, 13, 14))

### second part
def find_fewest_cubes(input):
    power = 0
    for line in input:
        bag = {'r':0, 'g':0, 'b':0}
        for num, col in re.findall(r'(\d+) (\w)', line):
            bag[col] = max(bag[col], int(num))
        power += (math.prod(bag.values()))
    return power

print(find_fewest_cubes(file_content))