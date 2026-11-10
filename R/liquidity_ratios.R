#' Calculate Liquidity Ratios
#'
#' Calculates three financial metrics used to evaluate a company's
#' ability to meet its short-term financial obligations with its current assets.
#'
#' @details
#' Current Ratio: Measures a company's ability to cover its
#' current liabilities using its current assets. It is calculated
#' by dividing current assets by current liabilities.
#'
#' Quick Ratio: Measures a company's ability to cover its
#' current liabilities using its most liquid assets, which excludes
#' inventory and prepaids. It is calculated
#' by dividing cash, marketable securities, and accounts receivable
#' by current liabilities.
#'
#' Working Capital: Measures the difference between a company's
#' current assets and current liabilities. It is calculated by
#' subtracting current liabilities from current assets.
#'
#' @param current_assets Total current assets of the company (cash,
#' accounts receivable, inventory, prepaid expenses expiring within
#' a year, etc.).
#' @param current_liabilities Total current liabilities of the company
#' (accounts payable, interest payable, salaries payable, etc.).
#' @param cash Cash and cash equivalents (unrestricted cash and
#' Treasury bills with original maturities of 90 days or less).
#' @param marketable_securities Short-term marketable securities
#' (highly liquid, easily converted to cash, short-term investments).
#' @param accounts_receivable Accounts receivable (money owed to
#' the business through operations).
#'
#' @return A named numeric vector containing the current ratio,
#' quick ratio, and working capital.
#'
#' @examples
#' liquidity_ratios(
#'   current_assets = 200000,
#'   current_liabilities = 100000,
#'   cash = 50000,
#'   marketable_securities = 20000,
#'   accounts_receivable = 60000
#' )
#'
#' @export
liquidity_ratios <- function(current_assets, current_liabilities,
                             cash, marketable_securities,
                             accounts_receivable) {

  # Stop the function if any of the five inputs contains more or less than one value
  if (any(lengths(list(current_assets, current_liabilities,
                       cash, marketable_securities,
                       accounts_receivable)) != 1)) {
    stop("Each input must be a single numeric value.")
  }

  # Check that all inputs are numeric and finite
  inputs <- c(current_assets, current_liabilities, cash,
              marketable_securities, accounts_receivable)

  if (!is.numeric(inputs) || any(!is.finite(inputs))) {
    stop("All inputs must be finite numeric values.")
  }

  # Stop the function if current liabilities is zero since ratios
  # require this for division
  if (current_liabilities == 0) {
    stop("Current liabilities cannot be zero.")
  }

  # Current ratio
  current_ratio <- current_assets / current_liabilities

  # Quick ratio
  quick_ratio <- (cash + marketable_securities +
                    accounts_receivable) / current_liabilities

  # Working capital
  working_capital <- current_assets - current_liabilities

  # Combine results into one vector
  results <- c(
    current_ratio = current_ratio,
    quick_ratio = quick_ratio,
    working_capital = working_capital
  )

  return(results)
}
