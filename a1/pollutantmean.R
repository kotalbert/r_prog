##   Assignment 1 Part 1 

## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'pollutant' is a character vector of length 1 indicating
## the name of the pollutant for which we will calculate the
## mean; either "sulfate" or "nitrate".

## 'id' is an integer vector indicating the monitor ID numbers
## to be used

## Return the mean of the pollutant across all monitors list
## in the 'id' vector (ignoring NA values)

pollutantmean <- function(directory = "specdata", pollutant = "sulfate", id = 1:332) {
    
    
    fls <- list.files(directory);
    file.indx <- data.frame(fls);
    files.ids <- file.indx[id, ];
    
    vect <- vector(length=0);
    
    for (i in seq_along(files.ids)) {
        pth <- paste(directory, files.ids[i], sep = "/");
        df <- read.csv(pth);  
        vals <- df[,pollutant];
        vals.good <- vals[!is.na(vals)];
        vect <- c(vect, vals.good);
    }
    
    return (mean(vect));
 
       
}