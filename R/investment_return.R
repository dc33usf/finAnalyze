
investment_return <- function(beginning_value, ending_value, income) {

  # Calculate holding period return
  holding_period_return <- (ending_value - beginning_value + income) / beginning_value

  # Return investment results
  return(holding_period_return)
}


