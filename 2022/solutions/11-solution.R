setwd("/Users/tea/coding/advent-of-code/2022")

##### 11 #####
input <- readLines("input/11-input.txt")

### part 1
monkey <- list(
  "0" = list(item = c(66, 79), count = 0),
  "1" = list(item = c(84, 94, 94, 81, 98, 75), count = 0),
  "2" = list(item = c(85, 79, 59, 64, 79, 95, 67), count = 0),
  "3" = list(item = c(70), count = 0),
  "4" = list(item = c(57, 69, 78, 78), count = 0),
  "5" = list(item = c(65, 92, 60, 74, 72), count = 0),
  "6" = list(item = c(77, 91, 91), count = 0),
  "7" = list(item = c(76, 58, 57, 55, 67, 77, 54, 99), count = 0)
)

for (i in 1:20) {
  if (length(monkey$"0"$item) > 0) {
    for (j in 1:length(monkey$"0"$item)) {
      monkey$"0"$item[j] <- monkey$"0"$item[j] * 11
      monkey$"0"$count <- monkey$"0"$count + 1
      monkey$"0"$item[j] <- floor(monkey$"0"$item[j] / 3)
      if (monkey$"0"$item[j] %% 7 == 0) {
        monkey$"6"$item <- c(monkey$"6"$item, monkey$"0"$item[j])
      } else monkey$"7"$item <- c(monkey$"7"$item, monkey$"0"$item[j])
    }
    monkey$"0"$item <- c()
  }

  if (length(monkey$"1"$item) > 0) {
    for (j in 1:length(monkey$"1"$item)) {
      monkey$"1"$item[j] <- monkey$"1"$item[j] * 17
      monkey$"1"$count <- monkey$"1"$count + 1
      monkey$"1"$item[j] <- floor(monkey$"1"$item[j] / 3)
      if (monkey$"1"$item[j] %% 13 == 0) {
        monkey$"5"$item <- c(monkey$"5"$item, monkey$"1"$item[j])
      } else monkey$"2"$item <- c(monkey$"2"$item, monkey$"1"$item[j])
    }
    monkey$"1"$item <- c()
  }

  if (length(monkey$"2"$item) > 0) {
    for (j in 1:length(monkey$"2"$item)) {
      monkey$"2"$item[j] <- monkey$"2"$item[j] + 8
      monkey$"2"$count <- monkey$"2"$count + 1
      monkey$"2"$item[j] <- floor(monkey$"2"$item[j] / 3)
      if (monkey$"2"$item[j] %% 5 == 0) {
        monkey$"4"$item <- c(monkey$"4"$item, monkey$"2"$item[j])
      } else monkey$"5"$item <- c(monkey$"5"$item, monkey$"2"$item[j])
    }
  monkey$"2"$item <- c()
  }

  if (length(monkey$"3"$item) > 0) {
    for (j in 1:length(monkey$"3"$item)) {
      monkey$"3"$item[j] <- monkey$"3"$item[j] + 3
      monkey$"3"$count <- monkey$"3"$count + 1
      monkey$"3"$item[j] <- floor(monkey$"3"$item[j] / 3)
      if (monkey$"3"$item[j] %% 19 == 0) {
        monkey$"6"$item <- c(monkey$"6"$item, monkey$"3"$item[j])
      } else monkey$"0"$item <- c(monkey$"0"$item, monkey$"3"$item[j])
    }
  monkey$"3"$item <- c()
  }

  if (length(monkey$"4"$item) > 0) {
    for (j in 1:length(monkey$"4"$item)) {
      monkey$"4"$item[j] <- monkey$"4"$item[j] + 4
      monkey$"4"$count <- monkey$"4"$count + 1
      monkey$"4"$item[j] <- floor(monkey$"4"$item[j] / 3)
      if (monkey$"4"$item[j] %% 2 == 0) {
        monkey$"0"$item <- c(monkey$"0"$item, monkey$"4"$item[j])
      } else monkey$"3"$item <- c(monkey$"3"$item, monkey$"4"$item[j])
    }
  monkey$"4"$item <- c()
  }

  if (length(monkey$"5"$item) > 0) {
    for (j in 1:length(monkey$"5"$item)) {
      monkey$"5"$item[j] <- monkey$"5"$item[j] + 7
      monkey$"5"$count <- monkey$"5"$count + 1
      monkey$"5"$item[j] <- floor(monkey$"5"$item[j] / 3)
      if (monkey$"5"$item[j] %% 11 == 0) {
        monkey$"3"$item <- c(monkey$"3"$item, monkey$"5"$item[j])
      } else monkey$"4"$item <- c(monkey$"4"$item, monkey$"5"$item[j])
    }
  monkey$"5"$item <- c()
  }

  if (length(monkey$"6"$item) > 0) {
    for (j in 1:length(monkey$"6"$item)) {
      monkey$"6"$item[j] <- monkey$"6"$item[j]^2
      monkey$"6"$count <- monkey$"6"$count + 1
      monkey$"6"$item[j] <- floor(monkey$"6"$item[j] / 3)
      if (monkey$"6"$item[j] %% 17 == 0) {
        monkey$"1"$item <- c(monkey$"1"$item, monkey$"6"$item[j])
      } else monkey$"7"$item <- c(monkey$"7"$item, monkey$"6"$item[j])
    }
  monkey$"6"$item <- c()
  }

  if (length(monkey$"7"$item) > 0) {
    for (j in 1:length(monkey$"7"$item)) {
      monkey$"7"$item[j] <- monkey$"7"$item[j] + 6
      monkey$"7"$count <- monkey$"7"$count + 1
      monkey$"7"$item[j] <- floor(monkey$"7"$item[j] / 3)
      if (monkey$"7"$item[j] %% 3 == 0) {
        monkey$"2"$item <- c(monkey$"2"$item, monkey$"7"$item[j])
      } else monkey$"1"$item <- c(monkey$"1"$item, monkey$"7"$item[j])
    }
  monkey$"7"$item <- c()
  }
}

prod(sort(c(monkey$"0"$count,
            monkey$"1"$count,
            monkey$"2"$count,
            monkey$"3"$count,
            monkey$"4"$count,
            monkey$"5"$count,
            monkey$"6"$count,
            monkey$"7"$count), decreasing = TRUE)[1:2])

### part 2
monkey <- list(
  "0" = list(item = c(66, 79), count = 0),
  "1" = list(item = c(84, 94, 94, 81, 98, 75), count = 0),
  "2" = list(item = c(85, 79, 59, 64, 79, 95, 67), count = 0),
  "3" = list(item = c(70), count = 0),
  "4" = list(item = c(57, 69, 78, 78), count = 0),
  "5" = list(item = c(65, 92, 60, 74, 72), count = 0),
  "6" = list(item = c(77, 91, 91), count = 0),
  "7" = list(item = c(76, 58, 57, 55, 67, 77, 54, 99), count = 0)
)

prod <- 7 * 13 * 5 * 19 * 2 * 11 * 17 * 3

for (i in 1:10000) {
  if (length(monkey$"0"$item) > 0) {
    for (j in 1:length(monkey$"0"$item)) {
      monkey$"0"$item[j] <- monkey$"0"$item[j] * 11
      while (monkey$"0"$item[j] >= prod) {
        monkey$"0"$item[j] <- monkey$"0"$item[j] %% prod
      }
      monkey$"0"$count <- monkey$"0"$count + 1
      if (monkey$"0"$item[j] %% 7 == 0) {
        monkey$"6"$item <- c(monkey$"6"$item, monkey$"0"$item[j])
      } else monkey$"7"$item <- c(monkey$"7"$item, monkey$"0"$item[j])
    }
    monkey$"0"$item <- c()
  }

  if (length(monkey$"1"$item) > 0) {
    for (j in 1:length(monkey$"1"$item)) {
      monkey$"1"$item[j] <- monkey$"1"$item[j] * 17
      while (monkey$"1"$item[j] >= prod) {
        monkey$"1"$item[j] <- monkey$"1"$item[j] %% prod
      }
      monkey$"1"$count <- monkey$"1"$count + 1
      if (monkey$"1"$item[j] %% 13 == 0) {
        monkey$"5"$item <- c(monkey$"5"$item, monkey$"1"$item[j])
      } else monkey$"2"$item <- c(monkey$"2"$item, monkey$"1"$item[j])
    }
    monkey$"1"$item <- c()
  }

  if (length(monkey$"2"$item) > 0) {
    for (j in 1:length(monkey$"2"$item)) {
      monkey$"2"$item[j] <- monkey$"2"$item[j] + 8
      while (monkey$"2"$item[j] >= prod) {
        monkey$"2"$item[j] <- monkey$"2"$item[j] %% prod
      }
      monkey$"2"$count <- monkey$"2"$count + 1
      if (monkey$"2"$item[j] %% 5 == 0) {
        monkey$"4"$item <- c(monkey$"4"$item, monkey$"2"$item[j])
      } else monkey$"5"$item <- c(monkey$"5"$item, monkey$"2"$item[j])
    }
  monkey$"2"$item <- c()
  }

  if (length(monkey$"3"$item) > 0) {
    for (j in 1:length(monkey$"3"$item)) {
      monkey$"3"$item[j] <- monkey$"3"$item[j] + 3
      while (monkey$"3"$item[j] >= prod) {
        monkey$"3"$item[j] <- monkey$"3"$item[j] %% prod
      }
      monkey$"3"$count <- monkey$"3"$count + 1
      if (monkey$"3"$item[j] %% 19 == 0) {
        monkey$"6"$item <- c(monkey$"6"$item, monkey$"3"$item[j])
      } else monkey$"0"$item <- c(monkey$"0"$item, monkey$"3"$item[j])
    }
  monkey$"3"$item <- c()
  }

  if (length(monkey$"4"$item) > 0) {
    for (j in 1:length(monkey$"4"$item)) {
      monkey$"4"$item[j] <- monkey$"4"$item[j] + 4
      while (monkey$"4"$item[j] >= prod) {
        monkey$"4"$item[j] <- monkey$"4"$item[j] %% prod
      }
      monkey$"4"$count <- monkey$"4"$count + 1
      if (monkey$"4"$item[j] %% 2 == 0) {
        monkey$"0"$item <- c(monkey$"0"$item, monkey$"4"$item[j])
      } else monkey$"3"$item <- c(monkey$"3"$item, monkey$"4"$item[j])
    }
  monkey$"4"$item <- c()
  }

  if (length(monkey$"5"$item) > 0) {
    for (j in 1:length(monkey$"5"$item)) {
      monkey$"5"$item[j] <- monkey$"5"$item[j] + 7
      while (monkey$"5"$item[j] >= prod) {
        monkey$"5"$item[j] <- monkey$"5"$item[j] %% prod
      }
      monkey$"5"$count <- monkey$"5"$count + 1
      if (monkey$"5"$item[j] %% 11 == 0) {
        monkey$"3"$item <- c(monkey$"3"$item, monkey$"5"$item[j])
      } else monkey$"4"$item <- c(monkey$"4"$item, monkey$"5"$item[j])
    }
  monkey$"5"$item <- c()
  }

  if (length(monkey$"6"$item) > 0) {
    for (j in 1:length(monkey$"6"$item)) {
      monkey$"6"$item[j] <- monkey$"6"$item[j]^2
      while (monkey$"6"$item[j] >= prod) {
        monkey$"6"$item[j] <- monkey$"6"$item[j] %% prod
      }
      monkey$"6"$count <- monkey$"6"$count + 1
      if (monkey$"6"$item[j] %% 17 == 0) {
        monkey$"1"$item <- c(monkey$"1"$item, monkey$"6"$item[j])
      } else monkey$"7"$item <- c(monkey$"7"$item, monkey$"6"$item[j])
    }
  monkey$"6"$item <- c()
  }

  if (length(monkey$"7"$item) > 0) {
    for (j in 1:length(monkey$"7"$item)) {
      monkey$"7"$item[j] <- monkey$"7"$item[j] + 6
      while (monkey$"7"$item[j] >= prod) {
        monkey$"7"$item[j] <- monkey$"7"$item[j] %% prod
      }
      monkey$"7"$count <- monkey$"7"$count + 1
      if (monkey$"7"$item[j] %% 3 == 0) {
        monkey$"2"$item <- c(monkey$"2"$item, monkey$"7"$item[j])
      } else monkey$"1"$item <- c(monkey$"1"$item, monkey$"7"$item[j])
    }
  monkey$"7"$item <- c()
  }
}

prod(sort(c(monkey$"0"$count,
            monkey$"1"$count,
            monkey$"2"$count,
            monkey$"3"$count,
            monkey$"4"$count,
            monkey$"5"$count,
            monkey$"6"$count,
            monkey$"7"$count), decreasing = TRUE)[1:2])
