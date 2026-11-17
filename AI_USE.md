# AI Usage Disclosure – finAnalyze

## AI Tool Used

ChatGPT was used as the supporting resource during the development and documentation
of the `finAnalyze` R package. The following sections describe the prompts, 
assistance received, and changes made.

## 1. Roxygen2 Documentation Structure

**Prompt:** "Help me create a roxygen2 documentation skeleton for my R functions
in my new R package."

**AI Assistance:** ChatGPT provided a Roxygen2 documentation skeleton 
outlining as follows: title, description, details, parameter descriptions, return values,
examples, and export instructions.

**Changes Made:** I did not change anything to this skeleton as I found that it 
was the logical way present things as I filled it in, had I found items out of
order or unneeded I would have removed it.

## 2. Financial Testing Examples

**Prompt:** "I am creating a financial analysis R package and need example numbers
for these ratios within my R function to test my package results. Please provide
me with [I used this prompt multiple times, the function name and its contents
was placed here]."

**AI Assistance:** ChatGPT provided sample financial figures based on the function
and scenario I gave to it.

**Changes Made:** Used the suggested financial values to test the functions and 
verify that the calculated results were accurate. I also independently performed
the ratio calculations on my excel to confirm R results equaled expected results.
I found it useful that I could tell AI to add a negative or replace with a 0 and
I could see how that would effect my output which resulted in me
adding validation code.


## 3. S3 Print Method Formatting

**Prompt:** "I am creating an S3 method where I print out a financial summary 
report using liquidity ratios and profitability ratios. How do I create an 
organized report like output in R that my users will see each time they run the
report?"

**AI Assistance:** ChatGPT suggested using `cat()` to create headings and organize
the output into separate profitability and liquidity lines. 

**Changes Made:** I decided to add `cat()` into the `print.financial_report()` to help
seperate the functions into different organized lines. After running the report,
my results were in scientific notation so I added `scientific = FALSE` to resolve
that issue, and I also rounded the ratios to two decimal places like they are in
the accounting world.

## 4. ggplot2 Package Check Troubleshooting

**Prompt:** "I keep receiving this warning when running `devtools::check()` on 
my R package containing ggplot2 code. Why?"

```text
plot_financial_trends: no visible binding for global variable 'year'
plot_financial_trends: no visible binding for global variable 'value'

Undefined global functions or variables:
  value year
```

**AI Assistance:** ChatGPT explained that the warnings were caused by how 
variables were referenced within `ggplot2` during package checks and suggested 
using the `.data` pronoun from `rlang`.

**Changes Made:** Updated the variable references by adding this line 
`ggplot2::aes(x = .data$year, y = .data$value)`, I also added `rlang` to the 
package dependencies, and imported `.data` into the namespace.Once I followed 
ChatGPT's directions, confirmed the output worked as expected with my examples
and ran `devtools::check()` and received no errors. I felt comfortable to move on
and leave R lang in my project.
## 5. General Code and Documentation Improvements

**Prompts:** Throughout the project, I used prompts such as:

- "Condense this."
- "Professionalize this."
- "Check this writing for grammar errors."
- "Is there anything out of order between these two coding segments?"

**AI Assistance:** ChatGPT provided suggestions for improving the clarity, 
professionalism, and organization of my comments and documentation. 

**Changes Made:** Sometimes I can ramble on a bit when typing out comments and
find it difficult to encompass a set of code without saying too much or too little.
I used ChatGPT's suggestions to change my comments and documentation into more condense
professional comments that accurately summarized my analysis. There were times 
when I still chose to go back and add back my original comments such as my 
documentation of the accounting significance in the Roxygen2 documentation.

## Verification

All AI inputs mentioned above were tested, edited, and retested before being saved 
into the final project. Ultimately the  package successfully passed `devtools::check()` 
with zero errors, zero warnings, and zero notes.
