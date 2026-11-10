
# finAnalyze

## Overview
'finAnalyze' is an R package designed for the purpose of conducting quick 
and simple financial analysis. The ratios provided within the package allow
users to evaluate financial performance of businesses or prospective investments.

Some of the key tools in the package include profitability and liquidity ratios
measure the short term performance and operational efficiency of a company. 
Additionally, historical return on investments and forecasted future return on 
investments can be calculated. There are also options to present data in the 
form of a console report or a trend analysis graph.

'finAnalyze' is a useful tool for parties such as accounting and finance students
and prospective investors. Both parties will find value in the ability to
compute these essential financial functions in R. 
## Installation

'finAnalyze' can be installed directly from GitHub using the code below:
``` r
# Install pak if it is not already installed
install.packages("pak")

# Install finAnalyze from GitHub
pak::pak("dc33usf/finAnalyze")

# Load the package
library(finAnalyze)

```
After running the code above, users will be able to access the package and its
documentation.

## Package Functions and Examples

'finAnalyze' provides users with 6 key functions in conducting a thorough
financial analysis. 

### profitability_ratios()

Calculates gross margin, operating margin, net margin, and return on assets to 
evaluate a company's profitability.


Example:
```r
profitability_ratios(
  revenue = 500000,
  cogs = 300000,
  operating_income = 120000,
  net_income = 90000,
  beginning_assets = 400000,
  ending_assets = 500000
)
```
Results:
```text
  gross_margin    operating_margin    net_margin    return_on_assets
      0.40              0.24              0.18            0.20
```
### liquidity_ratios()

Calculates the current ratio, quick ratio, and working capital to evaluate a 
company's ability to meet short term obligations with short term assets.

Example:
```r
liquidity_ratios(
  current_assets = 200000,
  current_liabilities = 100000,
  cash = 50000,
  marketable_securities = 20000,
  accounts_receivable = 60000
)
```
Results:
```text
  current_ratio    quick_ratio    working_capital
      2.0              1.3            100000.0
```     
### financial_summary()

Combines profitability and liquidity ratios into an organized report
using a custom S3 class and print method.

Example:
```r
financial_summary(
  profitability = profitability_ratios(
    revenue = 1000000,
    cogs = 600000,
    operating_income = 250000,
    net_income = 150000,
    beginning_assets = 1200000,
    ending_assets = 1800000
  ),
  liquidity = liquidity_ratios(
    current_assets = 500000,
    current_liabilities = 250000,
    cash = 100000,
    marketable_securities = 50000,
    accounts_receivable = 150000
  )
)
```
Results:
```text
Financial Analysis Report
-------------------------

Profitability Ratios:
    gross_margin      operating_margin    net_margin     return_on_assets
        0.40                0.25             0.15              0.10

Liquidity Ratios:
          current_ratio       quick_ratio     working_capital
                2.0               1.2              250000.0
```
### investment_return()

Calculates an investment's holding-period return and annualized return using 
its beginning value, ending value, income generated, and number of years held.

Example:
```r
investment_return(
  beginning_value = 10000,
  ending_value = 12000,
  income = 500,
  years = 3
  
)  
```
Results:
```text
   holding_period_return    annualized_return
       0.25000000                0.07721735
```                 
### investment_growth()

Calculates the future value and investment gain based on an investment's beginning
value, expected rate of return, and the number of years to be held.

Example:
```r
investment_growth(
  beginning_value = 10000,
  annual_return = 0.08,
  years = 5
)
```
Results:
```text
  future_value    investment_gain
    14693.281         4693.281
```
### plot_financial_trends()

Creates customizable line graphs to visualize changes in financial data over 
time using ggplot2.

Example:
```r
plot_financial_trends(
  years = c(2022, 2023, 2024, 2025, 2026),
  values = c(500000, 550000, 620000, 710000, 800000),
  title = "Annual Revenue Growth",
  y_label = "Revenue ($)"
)
```
Results:
```text
The result will be a line graph showing a steady increase in Revenue from 2022
to 2026.
```
Each function contains a help page within R that provides more detailed 
description of the functions along with helpful examples to execute the function.
After loading the package, simply add a '?' before calling a function in R's 
console like so: ?profitability_ratios

## Design and Purpose
'finAnalyze' was created to help users easily perform some of the most commonly
sought after financial ratios within R studio. Rather than manually punching 
in on a calculator or creating complex functions in Excel, the 'finAnalyze'
package presents an organized function infrastructure allowing for these
calculations to be made much more efficiently. The package also incorporates a 
custom S3 print method to organize financial ratios and a visualization function 
to help users identify trends in financial data. Students and prospective investors
simply can enter the necessary financial values needed for each function and 
receive the insights they are looking for.

Functions in this package each were tested and validated to prevent invalid
inputs and calculations

## AI Usage Disclosure

In the process of completing this R package, ChatGPT was used to 
help professionalize comments within the code along with professionalizing and
condensing the Roxygen2 documentation. AI was also used to generate example
financial numbers to assist in testing functions. AI also suggested using 
cat() to help improve the formatting in the print.financial_report() 
S3 method. Lastly, when creating the plot_financial_trends() function, AI assisted 
in debugging an error preventing the variables referenced in the ggplot2 code 
from being recognized during package checks.This resulted in the import of 
'rlang' into the package. 

Otherwise, I was responsible for the development of code in the package, the 
testing and validation of functions, the basis of description of importance and 
value in each financial measure, and ultimately the design and format of the 
package itself.





