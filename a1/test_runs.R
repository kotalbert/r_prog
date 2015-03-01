new.wd <- "C:/Users/lenovo/CRS/data_science/r_prog/a1";
setwd(new.wd);

getwd()


##  Testing Part 1: pollutantmean()
source("pollutantmean.R");

pollutantmean("specdata", "sulfate", 1:10);  #OK
pollutantmean("specdata", "nitrate", 70:72); #OK
pollutantmean("specdata", "nitrate", 23);    #OK

##  Testing Part2 complete()

source("complete.R");

complete("specdata", 1);                    #OK
complete("specdata", c(2, 4, 8, 10, 12));   #OK
complete("specdata", 30:25);                #OK
complete("specdata", 3);                    #OK

##  Testing Part3 corr
source("corr.R");

cr <- corr("specdata", 150)
head(cr)
summary(cr)

cr <- corr("specdata", 400)
head(cr)
summary(cr)

cr <- corr("specdata")
summary(cr)

## Submission:
source("http://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript1.R");
submit()

