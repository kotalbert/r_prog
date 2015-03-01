##   Assignment 1 Part 2 

## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'id' is an integer vector indicating the monitor ID numbers
## to be used

## Return a data frame of the form:
## id nobs
## 1  117
## 2  1041
## ...
## where 'id' is the monitor ID number and 'nobs' is the
## number of complete cases

complete <- function(directory="specdata", id = 1:332) {
    
    
    fls <- list.files(directory);
    file.indx <- data.frame(fls);
    files.ids <- file.indx[id, ];
    
    nobs <- vector(length = length(id));
    
    for (i in seq_along(files.ids)) {
        pth <- paste(directory, files.ids[i], sep = "/");
        df <- read.csv(pth);  
        no.complete <- sum(complete.cases(df));
        nobs[i] <- no.complete;
    
    }
    
    out.df <- data.frame(id, nobs);
    return (out.df);
    
    
}

