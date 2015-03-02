# rankhospital.R
# Ranking hospitals by outcome in state

rankhospital <- function (state, outcome, num = "best"){
  
  # read the file
  f <- read.csv("outcome-of-care-measures.csv", colClasses = "character");
  
  # check the 'state' argument
  valid_states <- unique(f$State);
  
  if (!is.element(state, valid_states)) {
    stop("invalid state");
  }
  
  
  # check the 'outcome' argument
  valid_outcomes <- factor(c("heart attack", "heart failure", "pneumonia"));
  
  if (!is.element(outcome, valid_outcomes)) {
    stop("invalid outcome");
  }
  
  
  #limit to single state only
  f_state <- subset(f, subset = f$State == state);

  # select the mortality variable
  if (outcome == "heart attack") {
    mor.rate <- as.numeric(f_state[,11]);
  }
  else if (outcome == "heart failure") {
    mor.rate <- as.numeric(f_state[,17]);
  }
  else {
    mor.rate <- as.numeric(f_state[,23]);
  }  
  
  # creating the ranked data frame
  
  df <- data.frame(h.name=f_state$Hospital.Name, mor.rate);
  
  df.good <- subset(df, !is.na(mor.rate));
  
  
  
  
  df.sorted <- df.good[order(df.good$mor.rate, df.good$h.name), ]
  h.rank <- c(1:nrow(df.sorted));
  
  df.ranked <- cbind(df.sorted, h.rank);
  
  
  # handle the 'num' argument
  if (num == "best") {
    target.rank <- min(h.rank);
  }
  else if (num == "worst") {
    target.rank <- max(h.rank);
  }
  else {
    if (num > nrow(df.ranked)) {
      return (NA);
    }
    else {
      target.rank <- num;
    }
    
  }
    
  df.target.hosp <- subset(df.ranked, h.rank == target.rank);
  
  return (as.character(df.target.hosp$h.name));
  
  
}