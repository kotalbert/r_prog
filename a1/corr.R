##   Assignment 1 Part 3

## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'threshold' is a numeric vector of length 1 indicating the
## number of completely observed observations (on all
## variables) required to compute the correlation between
## nitrate and sulfate; the default is 0

## Return a numeric vector of correlations

corr <- function(directory="specdata", threshold = 0) {
    
    out.vector <- vector(length = 0);
    
    fls <- list.files(directory);
    for (i in seq_along(fls)) {
        
        pth <- paste(directory, fls[i], sep = "/");
        df <- read.csv(pth);
        compl <- complete.cases(df);
        no.complete <- sum(compl);
        
        if (no.complete > threshold) {
            df.complete <- df[compl ,];
            
            this.cr <- cor(df.complete$nitrate, df.complete$sulfate);
            out.vector <- c(out.vector, this.cr);
                           
        }
        
        
        
    }
    
    return (out.vector);
    
}

