setwd("/Users/tea/coding/advent-of-code/2022")

##### 04 #####
input <- readLines("input/04-input.txt")

### part 1
split <- strsplit(input, ",")
split <- lapply(split, strsplit, "-")

count <- 0
for (i in seq(1, length(split))){
  count <- count + (as.numeric(split[[i]][[1]][1]) >= as.numeric(split[[i]][[2]][1]) &&
                      as.numeric(split[[i]][[1]][2]) <= as.numeric(split[[i]][[2]][2]))
  if (!(as.numeric(split[[i]][[1]][1]) >= as.numeric(split[[i]][[2]][1]) &&
        as.numeric(split[[i]][[1]][2]) <= as.numeric(split[[i]][[2]][2]))) {
    count <- count + (as.numeric(split[[i]][[2]][1]) >= as.numeric(split[[i]][[1]][1]) &&
                        as.numeric(split[[i]][[2]][2]) <= as.numeric(split[[i]][[1]][2]))
  }
}

count

### part 2
count <- 0
for (i in seq(1, length(split))){
  if (sum(seq(split[[i]][[1]][1], split[[i]][[1]][2]) %in%
      seq(split[[i]][[2]][1], split[[i]][[2]][2])) > 0) {
    count <- count + 1
  }
}

count
