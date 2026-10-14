## Here we check code coverage.

rm(list = ls())

library(covr)

source("functions.R")
source("tests.R")

# Check coverage
x = function_coverage(inbreeding_coefficient, test_inbreeding_coefficient())
report(x)

## Hint: Use report() to generate a clickable coverage report in HTML format from the
## output of function_coverage(), and find which lines are not covered.