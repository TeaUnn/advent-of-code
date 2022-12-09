setwd("/Users/tea/coding/advent-of-code/2022")

##### 07 #####
input <- readLines("input/07-input.txt")

### part 1
library(tidyverse)

directories <- list()
path <- c(NULL)
i <- 2

while (i <= length(input)) {
  if (input[i] == "$ ls") {
    repeat {
      i <- i + 1
      if (i > length(input)) break
      if (str_detect(input[i], "^\\$")) break
      if (str_detect(input[i], "^dir")) {
        dir_name <- str_remove(input[i], "dir ")
        directories[[c(path, dir_name)]] <- list()
      } else {
        file_name <- str_remove(input[i], "\\d+ ")
        file_value <- as.numeric(str_extract(input[i], "\\d+"))
        directories[[c(path, file_name)]] <- file_value
      }
    }
  } else if (str_detect(input[i], "^\\$ cd \\.\\.")) {
      path <- path[-length(path)]
      i <- i + 1
  } else if (str_detect(input[i], "^\\$ cd")) {
    next_dir <- str_remove(input[i], "^\\$ cd ")
    path <- c(path, next_dir)
    i <- i + 1
  }
}

dir_sums <- list()

lists <- sapply(directories, is.list)
sup_folders <- as.list(names(directories)[lists])

repeat {
  if (length(sup_folders) == 0) break
  path <- sup_folders[[1]]
  lists <- sapply(directories[[path]], is.list)
  if (any(lists)) {
    new_lists <- names(lists)[lists]
    for (new_list in new_lists) {
      sup_folders <- c(list(c(path, new_list)), sup_folders)
    }
  } else {
    dir_sum <- sum(unlist(directories[[path]]))
    dir_sums[paste(path, collapse = "_")] <- dir_sum
    directories[[path]] <- dir_sum
    sup_folders[[1]] <- NULL
  }
}

dir_sums$total <- sum(unlist(directories))
dir_sums <- unlist(dir_sums)

sum(dir_sums[dir_sums < 100000])

### part 2
head(sort(dir_sums[dir_sums >= (30000000 - (70000000 - dir_sums["total"]))]), 1)

