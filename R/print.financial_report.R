
#' Print Financial Report
#'
#' @description
#' Displays the profitability and liquidity ratios from a financial
#' summary report.
#'
#' @details
#' This function is the S3 print method for objects of class
#' financial_report created using financial_summary().
#'
#' The report displays profitability and liquidity ratios in separate
#' sections to provide an overview of a company's financial performance
#' and ability to meet short-term financial obligation with short term,'
#' liquid assets.
#'
#' @param x An object of class financial_report created using
#' financial_summary().
#' @param ... Additional arguments for the print method.
#'
#' @return Displays the financial report in the R Console.
#'
#' @examples
#' # Example 1: Print a financial summary report
#' profitability <- c(gross_margin = 0.40, operating_margin = 0.25,
#'                    net_margin = 0.15, return_on_assets = 0.10)
#' liquidity <- c(current_ratio = 2.00, quick_ratio = 1.20,
#'                working_capital = 250000)
#'
#' report <- financial_summary(profitability, liquidity)
#' print(report)
#'
#' @export


print.financial_report <- function(x, ...) {

  # Display report heading
  cat("\nFinancial Analysis Report\n")
  cat("-------------------------\n")

  # Display profitability ratios
  cat("\nProfitability Ratios:\n")
  print(format(round(x$profitability, 2), scientific = FALSE, trim = TRUE))

   # Display liquidity ratios
  cat("\nLiquidity Ratios:\n")
  print(format(round(x$liquidity, 2), scientific = FALSE, trim = TRUE))
}




