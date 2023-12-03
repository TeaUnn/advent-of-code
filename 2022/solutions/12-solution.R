setwd("/Users/tea/coding/advent-of-code/2022")

##### 12 #####
input <- readLines("input/12-input.txt")

### part 1
map <- matrix(unlist(strsplit(input, "")),
              ncol = length(strsplit(input, "")[[1]][]),
              byrow = TRUE)

which(map == "S")
