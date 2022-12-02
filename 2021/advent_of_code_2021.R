#################
##### DAY 1 #####
#################
library("readxl")
depths <- read_xlsx("/Users/teaunneback/Documents/advent of code 2021/input1.xlsx", col_names = FALSE)

### part 1
# count the number of times a depth measurement
# increases from the previous measurement
answer1 <- 0
for(i in 2:nrow(depths)){
  if(depths[i, 1] > depths[i-1, 1]){
    answer1 <- answer1 + 12
  }
}

### part 2
# count the number of times the sum of measurements in
# this sliding window increases from the previous sum
answer2 <- 0
for(i in 4:nrow(depths)){
  if(depths[i, 1] > depths[i-3, 1]){
    answer2 <- answer2 + 1
  }
}

#################
##### DAY 2 #####
#################
### part 1
# forward X increases the horizontal position by X units.
# down X increases the depth by X units.
# up X decreases the depth by X units.
# What do you get if you multiply your final horizontal position by your final depth?
commands <- read.table("/Users/teaunneback/Documents/advent of code 2021/input2.txt")
hor_pos <- 0
for(i in 1:nrow(commands)){
  if(commands[i, 1] == "forward"){
    hor_pos <- hor_pos + commands[i, 2]
    }
  }
ver_pos <- 0
for(i in 1:nrow(commands)){
   if(commands[i, 1] == "down"){
     ver_pos <- ver_pos + commands[i, 2]
     } else if(commands[i, 1] == "up"){
       ver_pos <- ver_pos - commands[i, 2]
        }
}
answer3 <- hor_pos * ver_pos
answer3

### part 2
# down X increases your aim by X units.
# up X decreases your aim by X units.
# forward X does two things:
#   It increases your horizontal position by X units.
#   It increases your depth by your aim multiplied by X.
# What do you get if you multiply your final horizontal position by your final depth?
ver_pos <- 0
aim <- 0
for(i in 1:nrow(commands)){
  if(commands[i, 1] == "down"){
    aim <- aim + commands[i, 2]
  } else if(commands[i, 1] == "up"){
    aim <- aim - commands[i, 2]
  } else if(commands[i, 1] == "forward"){
    ver_pos <- ver_pos + aim * commands[i, 2]
  }
}
answer4 <- hor_pos * ver_pos
answer4

#################
##### DAY 3 #####
#################
### part 1
# Use the binary numbers in your diagnostic report to calculate the gamma rate
# and epsilon rate, then multiply them together.
# What is the power consumption of the submarine?
# (Be sure to represent your answer in decimal, not binary.)
dia_matrix <- as.matrix(read.table(
  text=gsub("", ' ', readLines("/Users/teaunneback/Documents/advent of code 2021/input3.txt"))))

# gamma: if mode in col i is 1, gamma[i] = 1, else 0
for(i in 1:ncol(dia_matrix)){
  gamma[i] <- sum(dia_matrix[,i])
}
for(i in 1:length(gamma)){
  if(gamma[i] > nrow(dia_matrix)/2){
    gamma[i] <- 1
  } else(gamma[i] <- 0)
}

# epsilon: if mode in col i is 1, epsilon[i] = 1, else 0
epsilon <- c()
for(i in 1:length(gamma)){
  if(gamma[i] == 1){
    epsilon[i] <- 0
  } else(epsilon[i] <- 1)
}

bits_to_int<-function(x){
  packBits(rev(c(rep(FALSE, 32-length(x)%%32), as.logical(x))), "integer")
}
answer5 <- bits_to_int(gamma) * bits_to_int(epsilon)
answer5

### part 2
# oxygen: keep lines with the mode in pos i until one line left (if equal, mode=1)
oxy_matrix <- dia_matrix
temp <- oxy_matrix
for(i in 1:ncol(oxy_matrix)){
  if(sum(oxy_matrix[, i]) >= nrow(oxy_matrix)/2){
    temp <- oxy_matrix[oxy_matrix[ ,i] == "1",]
  } else temp <- oxy_matrix[oxy_matrix[ ,i] == "0",]
  oxy_matrix <- temp
  if(!is.matrix(oxy_matrix)) break
}

# CO2: ox but other way around
co_matrix <- dia_matrix
temp <- co_matrix
for(i in 1:ncol(co_matrix)){
  if(sum(co_matrix[, i]) < nrow(co_matrix)/2){
    temp <- co_matrix[co_matrix[ ,i] == "1",]
  } else temp <- co_matrix[co_matrix[ ,i] == "0",]
  co_matrix <- temp
  if(!is.matrix(co_matrix)) break
}

answer6 <- bits_to_int(oxy_matrix) * bits_to_int(co_matrix)
answer6

#################
##### DAY 4 #####
#################
### part 1
# find the board that wins first (each board is 5*5)
boards <- read.table("/Users/teaunneback/Documents/advent of code 2021/input4.txt")
numbers <- c(79,9,13,43,53,51,40,47,56,27,0,14,33,60,61,36,72,48,83,42,10,86,41,
             75,16,80,15,93,95,45,68,96,84,11,85,63,18,31,35,74,71,91,39,88,55,
             6,21,12,58,29,69,37,44,98,89,78,17,64,59,76,54,30,65,82,28,50,32,
             77,66,24,1,70,92,23,8,49,38,73,94,26,22,34,97,25,87,19,57,7,2,3,46,
             67,90,62,20,5,52,99,81,4)
bingo <- matrix(F, nrow = nrow(boards), ncol = ncol(boards))

for(i in 1:length(numbers)){
  for(m in 1:ncol(boards)){
    for(n in 1:nrow(boards)){
      if(numbers[i] == boards[n,m]){
        bingo[n,m] <- T
        if(any(rowSums(bingo) == ncol(bingo))) stop(print(i))
        if(any(sum(bingo[5*n-4:5*n,m]) == ncol(bingo))) stop(print(i))
      }
    }
  }
} # numbers[18] is the final call

which(rowSums(bingo) == 5) # row 208 is the bingo row

for(m in 1:ncol(boards)){
  for(n in 1:nrow(boards)){
    which(sum(bingo[5*n-4:5*n,m]) == ncol(bingo))
  }
}

208/5 # board 41 is the winning board

for(n in 206:210){
  for(m in 1:5){
    if(bingo[n,m] == T){
      boards[n,m] <- 0
    }
  }
}

win <- boards[206:210,]
sum(win)*numbers[18]

### part 2
# find the board that will win last


#################
##### DAY 7 #####
#################
### part 1
# how much fuel minimum
crabs <- read.table("/Users/teaunneback/Documents/advent of code 2021/input7.txt", sep = ",")
crabs2 <- t(crabs)

hist(crabs2, breaks = 40)
median(crabs2)

sum(abs(crabs2 - median(crabs2)))

### part 2
# increasing fuel cost
floor(mean(crabs2))

distance <- abs(crabs2 - floor(mean(crabs2)))
fuel <- (distance * (distance + 1)) / 2
sum(fuel)
