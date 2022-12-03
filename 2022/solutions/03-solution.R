setwd("/Users/tea/coding/advent-of-code/2022")

##### 03 #####
input <- readLines("input/03-input.txt")

### Part 1
comp1 <- substring(input, 1, nchar(input)/2)
comp2 <- substring(input, (nchar(input)/2 + 1), nchar(input))

matched <- list(NA)
for (i in 1:length(comp1)) {
  matched[[i]] <- pmatch(unlist(strsplit(comp1[i], "")), unlist(strsplit(comp2[i], "")))
}

matched_letters <- list(NA)
for (i in 1:length(comp1)) {
  matched_letters[[i]] <- unlist(strsplit(comp1[i], ""))[!is.na(matched[[i]])]
}

score <- 0
for (i in 1:length(comp1)) {
  score <- sum(pmatch(matched_letters[[i]], letters),
               (26 + pmatch(matched_letters[[i]], LETTERS)),
               score, na.rm = TRUE)
}

score

### Part 2
matched2 <- list(NA)
for (i in 1:(length(input)/3)) {
  for (j in seq(1, 300, by = 3)){
    match12 <- pmatch(unlist(strsplit(input[j], "")), unlist(strsplit(input[j+1], "")))
    letters12 <- unlist(strsplit(input[j], ""))[!is.na(match12)]
    match123 <- pmatch(unlist(strsplit(letters12, "")), unlist(strsplit(input[j+2], "")))
    letters123 <- letters12[!is.na(match123)]
    matched2[[j]] <- letters123
  }
}

score <- 0
for (i in 1:length(matched2)) {
  score <- sum(pmatch(matched2[[i]], letters),
               (26 + pmatch(matched2[[i]], LETTERS)),
               score, na.rm = TRUE)
}

score