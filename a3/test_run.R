# R Programming
# Programming Assignment 3: Hospital Quality
# Program for runnning  other functions

setwd("c:/CRS/data_science/r_prog/a3/");
rm(list = ls())

# Preliminary analisis
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character");
head(outcome);
ncol(outcome);
nrow(outcome);

outcome[,11] <- as.numeric(outcome[,11]);
hist(outcome[,11]);
outcome[,11]


source("http://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript3.R");

# best
source("best.R");

submit();

# rankhospital
source("rankhospital.R");

x <- rankhospital("TX", "heart failure");
x <- rankhospital("TX", "heart failure", 3);
x <- rankhospital("TX", "heart failure", 4);

submit();

#rankall
source("rankall.R");

df <- rankall("heart failure");
