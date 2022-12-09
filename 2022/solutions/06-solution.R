setwd("/Users/tea/coding/advent-of-code/2022")

##### 06 #####
input <- readLines("input/06-input.txt")

### part 1
input <- strsplit(input, "")

i <- 4
while (length(unique(input[[1]][(i-3):i])) < 4) {
  i <- i + 1
}
i

### part 2
i <- 14
while (length(unique(input[[1]][(i-13):i])) < 14) {
  i <- i + 1
}
i
