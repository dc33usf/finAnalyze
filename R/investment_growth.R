#' Investment Growth
#'
#' @description
#' Calculates the future value and investment gain of an investment
#' based on its beginning value, annual rate of return, and holding period.
#'
#' @details
#' This function calculates two measures of investment growth:
#'
#' Future Value: Measures the projected value of an investment based
#' on its beginning value, annual rate of return (expressed as a decimal),
#' and holding period, period is assumed to be years.
#'
#' Investment Gain: Measures the difference between the projected
#' future value and the beginning value of the investment.
#'
#' The annual rate of return should be entered as a decimal, and the
#' holding period can include fractional years ( i.e if investment is for 2 years
#' but interest compounds semi annually years multiply by 2 and
#' the annual return rate will be divided by 2.
#'
#' @param beginning_value The initial value of the investment.
#' @param annual_return The expected annual rate of return expressed
#' as a decimal.
#' @param years The length of the investment holding period in years,
#' including fractional years.
#'
#' @return A named numeric vector containing the future value and
#' investment gain.
#'
#' @examples
#' # Example 1: Investment with a positive annual return
#' investment_growth(
#'   beginning_value = 10000,
#'   annual_return = 0.08,
#'   years = 5
#' )
#'
#' # Example 2: Investment with a negative annual return
#' investment_growth(
#'   beginning_value = 10000,
#'   annual_return = -0.05,
#'   years = 3
#' )
#'
#' # Example 3: Repeat of Example 1 but compounded SEMI annually
#' investment_growth(
#'   beginning_value = 10000,
#'   annual_return = 0.08 / 2,
#'   years = 5 * 2
#' )
#' @export


investment_growth <- function(beginning_value, annual_return, years) {


  # Check that each input is a single value
  if (any(lengths(list(beginning_value, annual_return, years)) != 1)) {
    stop("Each input must be a single numeric value.")
  }

  # Check that all inputs are finite numeric values
  inputs <- c(beginning_value, annual_return, years)

  if (!is.numeric(inputs) || any(!is.finite(inputs))) {
    stop("All inputs must be finite numeric values.")
  }

  # Check for invalid negative values
  if (beginning_value < 0 || years < 0) {
    stop("Beginning value and years cannot be negative.")
  }

  # Check that annual return is not less than -100%
  if (annual_return < -1) {
    stop("Annual return cannot be less than -100%.")
  }

  # Calculate future value of investment
  future_value <- beginning_value * (1 + annual_return)^years

  # Calculate investment gain
  investment_gain <- future_value - beginning_value

  # Return investment results
  return(c(
    future_value = future_value,
    investment_gain = investment_gain
  ))
}
