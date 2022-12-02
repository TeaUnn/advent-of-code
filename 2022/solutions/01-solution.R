setwd("/Users/tea/coding/advent-of-code-2022")

##### 01 #####
input <- readLines("input/01-input.txt")
input <- as.numeric(input)

### Part 1
max(sapply(split(input, cumsum(is.na(input))), sum, na.rm = TRUE))

### Part 2
sum(sort(sapply(split(input, cumsum(is.na(input))),
                sum, na.rm = TRUE), decreasing = TRUE)[1:3])