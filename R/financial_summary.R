#' Financial Summary
#'
#' @description
#' Combines profitability and liquidity ratios into a single financial
#' summary report.
#'
#' @details
#' This function combines the results from profitability_ratios() and
#' liquidity_ratios() to provide an overview of a company's financial
#' performance and short-term financial position in a organized table.
#'
#' Profitability ratios measure a company's financial performance through it's
#' ability to generate net income and revenue. Liquidity ratios measure a company's
#' ability to meet its short-term financial obligations using short term 'liquid
#' assets.
#'
#' @param profitability A named numeric vector containing the profitability
#' ratios calculated using profitability_ratios(). Note: You can also calculate
#' using the function 'profitability_ratios' directly in financial_summary function
#' @param liquidity A named numeric vector containing the liquidity ratios
#' calculated using liquidity_ratios(). Note: You can also calculate
#' using the function 'liquidity_ratios' directly in financial_summary function
#'
#' @return A financial_report object containing the profitability and
#' liquidity ratios in a named list.
#'
#' @examples
#'  # Example 1: Create a financial summary using calculated ratios
#' profitability <- c(gross_margin = 0.40, operating_margin = 0.25,
#'                    net_margin = 0.15, return_on_assets = 0.10)
#' liquidity <- c(current_ratio = 2.00, quick_ratio = 1.20,
#'                working_capital = 250000)
#'
#' financial_summary(profitability, liquidity)
#'
#'
#' # Example 2: Create a financial summary using the ratio functions
#' financial_summary(
#'   profitability = profitability_ratios(
#'     revenue = 1000000,
#'     cogs = 600000,
#'     operating_income = 250000,
#'     net_income = 150000,
#'     beginning_assets = 1200000,
#'     ending_assets = 1800000
#'   ),
#'   liquidity = liquidity_ratios(
#'     current_assets = 500000,
#'     current_liabilities = 250000,
#'     cash = 100000,
#'     marketable_securities = 50000,
#'     accounts_receivable = 150000
#'   )
#' )
#'
#' @export


financial_summary <- function(profitability, liquidity) {


  # Check that inputs are named numeric vectors
  if (!is.numeric(profitability) || is.null(names(profitability))) {
    stop("Profitability must be a named numeric vector.")
  }

  if (!is.numeric(liquidity) || is.null(names(liquidity))) {
    stop("Liquidity must be a named numeric vector.")
  }

  # Check that inputs are numeric and finite
  if (length(profitability) == 0 || any(!is.finite(profitability))) {
    stop("Profitability must contain finite numeric values.")
  }

  if (length(liquidity) == 0 || any(!is.finite(liquidity))) {
    stop("Liquidity must contain finite numeric values.")
  }


  # Combine profitability and liquidity ratios
  report <- list(
    profitability = profitability,
    liquidity = liquidity
  )

  # Assign S3 class
  class(report) <- "financial_report"

  return(report)
}
