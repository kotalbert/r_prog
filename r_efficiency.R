

start_time <-Sys.time()
sample_file <- read.csv("C:/Users/lenovo/Desktop/sample_file.txt", header=FALSE, stringsAsFactors=FALSE)

g <- sample_file$V2
u <- sample_file$V3

g <- g*1000 + dunif(0)
u <- u*5000 + dnorm(0)

end_time <- Sys.time()

time_elapsed <- end_time - start_time 
print(time_elapsed)
