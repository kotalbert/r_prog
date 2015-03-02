# best.R
# Finding the best hospital in a state

best <- function(state, outcome) {
  
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
  
  df <- data.frame(f_state$State, f_state$Hospital.Name, mor.rate);
  
  mor.rate.best <- min(df$mor.rate, na.rm = TRUE);
  best.df <- subset(df, df$mor.rate == mor.rate.best);
  best.hospitals <- as.character(best.df$f_state.Hospital.Name);
  
  
  
  if (length(best.hospitals) == 1){
    
    return (best.hospitals);
    
  }
  else {
    
    return (min(best.hospitals));
    
  }
  
}