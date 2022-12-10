# thanks to Karl Sigfrid's github that helped me solve some problems

setwd("/Users/tea/coding/advent-of-code/2022")

##### 07 #####
input <- readLines("input/07-input.txt")

### part 1
files2 <- list()
temp <- c()
location_names <- function(x) {
  if(is.null(x)) return(NULL)
  sapply(1:length(x), function(y) paste(x[1:y], collapse = "/"))
}
for (element in input) {
  if (element == "$ cd ..") temp <- head(temp, -1)
  if (grepl("[$] cd \\w", element)) {
    temp <- c(temp, strsplit(element, " ")[[1]][3])
  }
  if (grepl("^\\d", element)) {
    files2 <- c(files2, list(list(size = as.numeric(gsub("\\D", "", element)),
                                location = location_names(temp))))
  }
}

directories <- unique(unlist(lapply(files2, function(x) x$location)))

sizes <- sapply(directories, function(x){
  tot_size <- 0
  for (element in files2) {
    if (x %in% element$location) tot_size <- tot_size + element$size
  }
  tot_size
})

sum(sizes[sizes <= 100000])

### part 2
tot_size <- sum(sapply(files2, function(x) x$size))
sort(sizes)[sort(sizes) >= tot_size - 4e+07][1]
