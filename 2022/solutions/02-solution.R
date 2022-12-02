setwd("/Users/tea/coding/advent-of-code-2022")

##### 02 #####
### Part 1
input <- read.table("input/02-input.txt")

rps <- function(input){
    points <- 0
    for (i in 1:nrow(input)) {
       if (input[i, 1] == "A" && input[i, 2] == "X") {
            points <- points + 3
       }
       if (input[i, 1] == "B" && input[i, 2] == "Y") {
            points <- points + 3
       }
       if (input[i, 1] == "C" && input[i, 2] == "Z") {
            points <- points + 3
       }
       if (input[i, 1] == "A" && input[i, 2] == "Y") {
            points <- points + 6
       }
       if (input[i, 1] == "B" && input[i, 2] == "Z") {
            points <- points + 6
       }
       if (input[i, 1] == "C" && input[i, 2] == "X") {
           points <- points + 6
       }
       if (input[i, 2] == "X") {
           points <- points + 1
       }
       if (input[i, 2] == "Y") {
           points <- points + 2
       }
       if (input[i, 2] == "Z") {
           points <- points + 3
       }
    }
    return(points)
}

rps(input)

### Part 2
input2 <- input
input[, 3] <- NA

for (i in 1:nrow(input2)) {
    if (input2[i, 1] == "A" && input2[i, 2] == "X") {
        input2[i, 3] <- "Z"
    }
    if (input2[i, 1] == "A" && input2[i, 2] == "Y") {
        input2[i, 3] <- "X"
    }
    if (input2[i, 1] == "A" && input2[i, 2] == "Z") {
        input2[i, 3] <- "Y"
    }
    if (input2[i, 1] == "B" && input2[i, 2] == "X") {
        input2[i, 3] <- "X"
    }
    if (input2[i, 1] == "B" && input2[i, 2] == "Y") {
        input2[i, 3] <- "Y"
    }
    if (input2[i, 1] == "B" && input2[i, 2] == "Z") {
        input2[i, 3] <- "Z"
    }
    if (input2[i, 1] == "C" && input2[i, 2] == "X") {
        input2[i, 3] <- "Y"
    }
    if (input2[i, 1] == "C" && input2[i, 2] == "Y") {
        input2[i, 3] <- "Z"
    }
    if (input2[i, 1] == "C" && input2[i, 2] == "Z") {
        input2[i, 3] <- "X"
    }
}

rps(input2[, c(1, 3)])
