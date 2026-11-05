#' Plot Financial Trends
#'
#' @description
#' Creates a customizable line chart to visualize financial trends
#'
#' @details
#' This function creates a line chart using financial values across
#' multiple years to help identify changes and trends in financial
#' performance.
#'
#' The function can be used to visualize financial statement accounts such as cash,
#' income statement accounts such as revenue as well as
#' financial metrics such as earnings per share, profitability ratios,
#' and investment values.
#'
#' Users can customize the chart title and vertical axis label to
#' represent the financial aspect they are analyzing. Values are displayed
#' without scientific notation for improved readability.
#'
#' @param years A numeric vector containing years in increasing order.
#' @param values A numeric vector containing the financial values
#' corresponding to each year(can be a percent, integer, rounded number etc).
#' @param title The title displayed at the top of the chart.
#' @param y_label The label displayed on the vertical axis.
#'
#' @return A ggplot object displaying financial trends over time.
#'
#' @examples
#' # Example 1: Annual revenue growth
#' plot_financial_trends(
#'   years = c(2022, 2023, 2024, 2025, 2026),
#'   values = c(500000, 550000, 620000, 710000, 800000),
#'   title = "Annual Revenue Growth",
#'   y_label = "Revenue ($)"
#' )
#
#' # Example 2: Earnings per share trend
#' plot_financial_trends(
#'   years = c(2022, 2023, 2024, 2025, 2026),
#'   values = c(2.40, 2.64, 2.93, 3.18, 3.47),
#'   title = "Earnings Per Share Trend",
#'   y_label = "EPS ($ per Share)"
#' )
#'
#' # Example 3: Return on assets trend
#' plot_financial_trends(
#'   years = c(2022, 2023, 2024, 2025, 2026),
#'   values = c(5.2, 6.1, 5.8, 7.3, 8.5),
#'   title = "Return on Assets Trend",
#'   y_label = "ROA (%)"
#' )
#'
#'@importFrom rlang .data
#' @export


plot_financial_trends <- function(years, values,
                                  title = "Financial Trends Over Time",
                                  y_label = "Value") {

  # Check that all inputs are finite numeric values
  inputs <- c(years, values)
  if (!is.numeric(inputs) || any(!is.finite(inputs))) {
    stop("Years and values must be finite numeric values.")
  }

  # Check that years and values have the same length
  if (length(years) != length(values)) {
    stop("Years and values must have the same length.")
  }

  # Check that there are at least two observations
  if (length(years) < 2) {
    stop("At least two observations are required.")
  }

  # Check for invalid year order
  if (is.unsorted(years, strictly = TRUE)) {
    stop("Years must be in increasing order.")
  }

  # Check that title and y_label are single values
  if (length(title) != 1 || length(y_label) != 1) {
    stop("Title and y_label must each be a single value.")
  }

  # Check that title and y_label are valid character values
  if (!is.character(title) || !is.character(y_label) ||
      is.na(title) || is.na(y_label)) {
    stop("Title and y_label must be valid character values.")
  }


  # Create a data frame for a financial trend
  trend_data <- data.frame(
    year = years,
    value = values
  )

  # Create a line chart to measure a financial trend
  trend_plot <- ggplot2::ggplot(
    trend_data,
    ggplot2::aes(x = .data$year, y = .data$value)
  ) +
    ggplot2::geom_line(color = "steelblue", linewidth = 1) +
    ggplot2::geom_point(color = "steelblue", size = 2) +
    ggplot2::scale_y_continuous(
      labels = function(x) format(x, big.mark = ",", scientific = FALSE, trim = TRUE)
    ) +
    ggplot2::labs(
      title = title,
      x = "Year",
      y = y_label
    ) +
    ggplot2::theme_minimal()

  # Return the financial trend plot
  return(trend_plot)
}

