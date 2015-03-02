# rankall.R
# ranking hospitals in all states

rankall <- function(outcome, num = "best") {
  
  # read the file
  f <- read.csv("outcome-of-care-measures.csv", colClasses = "character");
  

  # check the 'outcome' argument
  valid_outcomes <- factor(c("heart attack", "heart failure", "pneumonia"));
  
  if (!is.element(outcome, valid_outcomes)) {
    stop("invalid outcome");
  }
  
  # select the mortality variable
  if (outcome == "heart attack") {
    mor.rate <- as.numeric(f[,11]);
  }
  else if (outcome == "heart failure") {
    mor.rate <- as.numeric(f[,17]);
  }
  else {
    mor.rate <- as.numeric(f[,23]);
  }  
  
  df <- data.frame(state = f$State, h.name = f$Hospital.Name, mor.rate);
  
  df.good <- subset(df, !is.na(mor.rate));
  
  df.ordered <- df.good[order(df.good$state, df.good$mor.rate, df.good$h.name),];
  
  # apply ranks in each state
  states_list <- unique(df.good$state);
  states_no <- length(states_list);
  
  
  
  
  return (df.ranked);
  
}