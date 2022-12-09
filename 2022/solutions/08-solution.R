setwd("/Users/tea/coding/advent-of-code/2022")

##### 08 #####
input <- readLines("input/08-input.txt")
inp_mat <- t(sapply(strsplit(input, ""), as.numeric))

### part 1
outp_mat <- matrix(0, nrow = nrow(inp_mat), ncol = ncol(inp_mat))

# from left
for (i in 1:(nrow(inp_mat) - 1)) {
  for (j in 1:(ncol(inp_mat) - 1)) {
    if (max(inp_mat[i, (1:j)]) < inp_mat[i, (j + 1)]) {
      outp_mat[i, (j + 1)] <- 1
    }
  }
}

# from top
for (j in 1:(ncol(inp_mat) - 1)) {
  for (i in 1:(nrow(inp_mat) - 1)) {
    if (max(inp_mat[1:i, j]) < inp_mat[(i + 1), j]) {
      outp_mat[(i + 1), j] <- 1
    }
  }
}

# from right
for (i in nrow(inp_mat):2) {
  for (j in ncol(inp_mat):2) {
    if (max(inp_mat[i, j:ncol(inp_mat)]) < inp_mat[i, (j - 1)]) {
      outp_mat[i, (j - 1)] <- 1
    }
  }
}

# from bottom
for (j in ncol(inp_mat):2) {
  for (i in nrow(inp_mat):2) {
    if (max(inp_mat[i:nrow(inp_mat), j]) < inp_mat[(i - 1), j]) {
      outp_mat[(i - 1), j] <- 1
    }
  }
}

outp_mat[1, ] <- 1
outp_mat[, 1] <- 1
outp_mat[nrow(outp_mat), ] <- 1
outp_mat[, ncol(outp_mat)] <- 1
sum(outp_mat)

### part 2
outp_mat <- matrix(0, nrow = nrow(inp_mat), ncol = ncol(inp_mat))
# all trees on edge has score zero: never mind these
# put NA there to stop algorithm when hitting edge
outp_mat[1, ] <- NA
outp_mat[, 1] <- NA
outp_mat[nrow(outp_mat), ] <- NA
outp_mat[, ncol(outp_mat)] <- NA

for (i in 2:(nrow(inp_mat) - 1)) {
  for (j in 2:(ncol(inp_mat) - 1)) {
    score1 <- 0
    score2 <- 0
    score3 <- 0
    score4 <- 0
    step <- 1
    while (inp_mat[i, j] >= max(inp_mat[i, (j + 1):(j + step)])) { # to left
      score1 <- score1 + 1
      if (inp_mat[i, j] == max(inp_mat[i, (j + 1):(j + step)])) break
      if (is.na(outp_mat[i, (j + step)])) break
      step <- step + 1
    }
    step <- 1
    while (inp_mat[i, j] >= max(inp_mat[i, (j - 1):(j - step)])) { # to right
      score2 <- score2 + 1
      if (inp_mat[i, j] == max(inp_mat[i, (j - 1):(j - step)])) break
      if (is.na(outp_mat[i, (j - step)])) break
      step <- step + 1
    }
    step <- 1
    while (inp_mat[i, j] >= max(inp_mat[(i - 1):(i - step), j])) { # up
      score3 <- score3 + 1
      if (inp_mat[i, j] == max(inp_mat[(i - 1):(i - step), j])) break
      if (is.na(outp_mat[(i - step), j])) break
      step <- step + 1
    }
    step <- 1
    while (inp_mat[i, j] >= max(inp_mat[(i + 1):(i + step), j])) { # down
      score4 <- score4 + 1
      if (inp_mat[i, j] == max(inp_mat[(i + 1):(i + step), j])) break
      if (is.na(outp_mat[(i + step), j])) break
      step <- step + 1
    }
    outp_mat[i, j] <- prod(score1, score2, score3, score4)
  }
}

max(outp_mat, na.rm = TRUE)
