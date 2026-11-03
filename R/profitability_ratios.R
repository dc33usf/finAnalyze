#' Calculate Profitability Ratios
#'
#' Calculates four financial ratios used to evaluate a company's
#' financial performance and its ability to generate profits.
#'
#' @details
#' The gross profit margin measures the percentage of revenue remaining
#' after subtracting the cost of goods sold. It is calculated by
#' subtracting cost of goods sold from revenue and dividing by revenue.
#'
#' The operating profit margin measures the percentage of revenue
#' remaining after accounting for operating expenses(selling and G&A expenses).
#' It is calculated
#' by dividing operating income by revenue.
#'
#' The net profit margin measures the percentage of revenue remaining
#' after accounting for all expenses and taxes. It is calculated by
#' dividing net income by revenue.
#'
#' Return on assets (ROA) measures how efficiently a company uses its
#' assets to generate net income. It is calculated by dividing net
#' income by average total assets. Average total assets is calculated
#' by adding beginning and ending total assets and dividing by two.
#'
#' @param revenue Total revenue earned by the company.
#' @param cogs Cost of goods sold.
#' @param operating_income Income earned from business operations.
#' @param net_income Net income after all expenses from continuing
#' and discontinued operations and taxes.
#' @param beginning_assets Total assets at the beginning of the period.
#' @param ending_assets Total assets at the end of the period.
#'
#' @return A named numeric vector containing gross profit margin,
#' operating profit margin, net profit margin, and return on assets.
#'
#' @examples
#' profitability_ratios(
#'   revenue = 500000,
#'   cogs = 300000,
#'   operating_income = 120000,
#'   net_income = 90000,
#'   beginning_assets = 400000,
#'   ending_assets = 500000
#' )
#'
#' @export

profitability_ratios <- function(revenue, cogs, operating_income,
                                 net_income, beginning_assets,
                                 ending_assets) {
  # Stop the function if any of the six inputs contains more or less than one value
  if (any(lengths(list(revenue, cogs, operating_income,
                       net_income, beginning_assets,
                       ending_assets)) != 1)) {
    stop("Each input must be a single numeric value.")
  }

  # Check that all inputs are numeric and finite
  inputs <- c(revenue, cogs, operating_income,
              net_income, beginning_assets, ending_assets)

  if (!is.numeric(inputs) || any(!is.finite(inputs))) {
    stop("All inputs must be finite numeric values.")
  }

  # Stop the function if revenue or average total assets is zero since ratios
  # require these for division
  if (revenue == 0) {
    stop("Revenue cannot be zero.")
  }

  if ((beginning_assets + ending_assets) == 0) {
    stop("Average total assets cannot be zero.")
  }

  # Gross profit margin
  gross_margin <- (revenue - cogs) / revenue

  # Operating profit margin
  operating_margin <- operating_income / revenue

  # Net profit margin
  net_margin <- net_income / revenue

  # Average total assets
  average_assets <- (beginning_assets + ending_assets) / 2

  # Return on assets
  roa <- net_income / average_assets

  # Combine results
  results <- c(
    gross_margin = gross_margin,
    operating_margin = operating_margin,
    net_margin = net_margin,
    return_on_assets = roa
  )

  return(results)
}

