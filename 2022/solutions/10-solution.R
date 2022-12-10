setwd("/Users/tea/coding/advent-of-code/2022")

##### 10 #####
input <- readLines("input/10-input.txt")

### part 1
input <- strsplit(input, " ")

strenght <- list()
for (i in c(20, 60, 100, 140, 180, 220)) {
  x <- 1
  cycle <- 0
  for (element in input) {
    if (element[1] == "noop") {
      cycle <- cycle + 1
      if (cycle == i) break
    }
    if (element[1] == "addx") {
      cycle <- cycle + 1
      if (cycle == i) break
      cycle <- cycle + 1
      if (cycle == i) break
      x <- x + as.numeric(element[2])
    }
  }
  strenght[[paste0("C", i)]] <- i * x
}

Reduce(`+`, strenght)

### part 2
letter <- c()
x <- 1
cycle <- 0
for (element in input) {
  if (element[1] == "noop") {
    cycle <- cycle + 1
    if (cycle == 41) cycle <- 1
    if ((cycle-1) %in% c(x-1, x, x+1)) {
      letter <- c(letter, "#")
    } else letter <- c(letter, ".")
  }
  if (element[1] == "addx") {
    cycle <- cycle + 1
    if (cycle == 41) cycle <- 1
    if ((cycle-1) %in% c(x-1, x, x+1)) {
      letter <- c(letter, "#")
    } else letter <- c(letter, ".")
    cycle <- cycle + 1
    if (cycle == 41) cycle <- 1
    if ((cycle-1) %in% c(x-1, x, x+1)) {
      letter <- c(letter, "#")
    } else letter <- c(letter, ".")
    x <- x + as.numeric(element[2])
  }
}

final <- matrix(letter, ncol = 40, byrow = TRUE)
for (i in 1:6) print(paste(final[i, ], collapse=""))
