### thanks to AdroMine for giving hints on Reddit

setwd("/Users/tea/coding/advent-of-code/2022")

##### 04 #####
input <- readLines("input/05-input.txt")

### part 1
stacks <- matrix(c(strsplit(input[1:8], "")[[1]][seq(2, 35, by = 4)],
                   strsplit(input[1:8], "")[[2]][seq(2, 35, by = 4)],
                   strsplit(input[1:8], "")[[3]][seq(2, 35, by = 4)],
                   strsplit(input[1:8], "")[[4]][seq(2, 35, by = 4)],
                   strsplit(input[1:8], "")[[5]][seq(2, 35, by = 4)],
                   strsplit(input[1:8], "")[[6]][seq(2, 35, by = 4)],
                   strsplit(input[1:8], "")[[7]][seq(2, 35, by = 4)],
                   strsplit(input[1:8], "")[[8]][seq(2, 35, by = 4)]),
                 ncol = 9, byrow = TRUE)

stacks <- as.data.frame(stacks)
stacks <- lapply(stacks, function(x) Filter(function(y) {y != " "}, x))
stacks <- as.list(stacks)
# copy for part 2
stacks2 <- stacks

# read instructions as table
inst <- read.table("input/05-input.txt", skip = 10)[, c(2, 4, 6)]
names(inst) <- c("move", "from", "to") # update names

for (i in 1:nrow(inst)) {
  move <- inst$move[i]
  from <- inst$from[i]
  to <- inst$to[i]
  for(j in seq_len(move)){
    stacks[[to]] <- c(stacks[[from]][1], stacks[[to]])
    stacks[[from]] <- stacks[[from]][-1]
  }
}

# get first element of each stack
paste(sapply(stacks, `[`, 1), collapse = "")

### part 2
for (i in 1:nrow(inst)) {
  move <- inst$move[i]
  from <- inst$from[i]
  to <- inst$to[i]
  stacks2[[to]] <- c(stacks2[[from]][seq_len(move)], stacks2[[to]])
  stacks2[[from]] <- stacks2[[from]][-seq_len(move)]
}

paste(sapply(stacks2, `[`, 1), collapse = "")