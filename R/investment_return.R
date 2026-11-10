#' Investment Return
#'
#' @description
#' Calculates the holding period return and annualized return of an
#' investment based on its beginning value, ending value, income, and
#' holding period (number of years held).
#'
#' @details
#' This function calculates two measures of investment performance and can be used
#' by individuals and businesses:
#'
#' Holding Period Return: Measures the total return earned on an
#' investment, including dividends or other investment income,
#' over the holding period.
#'
#' Annualized Return: Measures the equivalent annual compounded
#' return based on the investment's holding period in years.
#'
#' @param beginning_value The initial value of the investment
#' @param ending_value The value of the investment at the end of the holding period (end of year).
#' @param income investment income(i.e dividends) received during the holding period.
#' @param years The length of the investment holding period in years. Note: If held
#' for less than a year, input as a percent of 1 year,(i.e half a year  = 0.5 ).
#'
#' @return A named numeric vector containing the holding period return
#' and annualized return.
#'
#' @examples
#' # Example 1: Investment with positive returns and dividend income
#' investment_return(
#'   beginning_value = 10000,
#'   ending_value = 12000,
#'   income = 500,
#'   years = 3
#' )
#'
#' # Example 2: Investment with a loss and no dividend income
#' investment_return(
#'   beginning_value = 10000,
#'   ending_value = 8000,
#'   income = 0,
#'   years = 2
#' )
#'
#' @export


investment_return <- function(beginning_value, ending_value, income, years) {

  # Check that each input is a single value
  if (any(lengths(list(beginning_value, ending_value, income, years)) != 1)) {
    stop("Each input must be a single numeric value.")
  }

  # Check that all inputs are finite numeric values
  inputs <- c(beginning_value, ending_value, income, years)

  if (!is.numeric(inputs) || any(!is.finite(inputs))) {
    stop("All inputs must be finite numeric values.")
  }

  # Prevent division by zero
  if (beginning_value == 0 || years == 0) {
    stop("Beginning value and years cannot be zero.")
  }

  # Check for invalid negative values
  if (beginning_value < 0 || ending_value < 0 || income < 0 || years < 0) {
    stop("Beginning value, ending value, income, and years cannot be negative.")
  }

  # Calculate holding period return
  holding_period_return <- (ending_value - beginning_value + income) / beginning_value

  # Calculate annualized return
  annualized_return <- (1 + holding_period_return)^(1 / years) - 1

  # Return investment results
  return(c(
    holding_period_return = holding_period_return,
    annualized_return = annualized_return
  ))
}
