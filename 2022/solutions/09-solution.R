setwd("/Users/tea/coding/advent-of-code/2022")

##### 09 #####
input <- readLines("input/09-input.txt")

### part 1
input <- strsplit(input, " ")

head <- c(0, 0)
tail <- c(0, 0)
tail_path <- c(0, 0)

tail_steps <- function(head, tail){
  steps <- c(0, 0)
  if(max(abs(head - tail)) > 1 && min(abs(head - tail)) > 0) {
    steps <- c(1, 1) * sign(head - tail)
  }
  if(abs(head - tail)[1] > 1 && abs(head - tail)[2] == 0) {
    steps <- c(1, 0) * sign(head - tail)
  }
  if(abs(head - tail)[1] == 0 && abs(head - tail)[2] > 1) {
    steps <- c(0, 1) * sign(head - tail)
  }
  return(steps)
}

directions <- list(
  "R" = c(0, 1),
  "L" = c(0, -1),
  "D" = c(1, 0),
  "U" = c(-1, 0)
)

for (element in input) {
  for (i in 1:element[2]) {
    head <- head + directions[[element[1]]]
    tail <- tail + tail_steps(head, tail)
    tail_path <- rbind(tail_path, tail)
  }
}

nrow(unique(tail_path))

### part 2
head <- c(0, 0)
tail1 <- c(0, 0)
tail2 <- c(0, 0)
tail3 <- c(0, 0)
tail4 <- c(0, 0)
tail5 <- c(0, 0)
tail6 <- c(0, 0)
tail7 <- c(0, 0)
tail8 <- c(0, 0)
tail9 <- c(0, 0)
tail_path <- c(0, 0)

for (element in input) {
  for (i in 1:element[2]) {
    head <- head + directions[[element[1]]]
    tail1 <- tail1 + tail_steps(head, tail1)
    tail2 <- tail2 + tail_steps(tail1, tail2)
    tail3 <- tail3 + tail_steps(tail2, tail3)
    tail4 <- tail4 + tail_steps(tail3, tail4)
    tail5 <- tail5 + tail_steps(tail4, tail5)
    tail6 <- tail6 + tail_steps(tail5, tail6)
    tail7 <- tail7 + tail_steps(tail6, tail7)
    tail8 <- tail8 + tail_steps(tail7, tail8)
    tail9 <- tail9 + tail_steps(tail8, tail9)
    tail_path <- rbind(tail_path, tail9)
  }
}

nrow(unique(tail_path))
