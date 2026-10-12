## Here we check code coverage.

rm(list = ls())

library(covr)

source("functions.R")
source("tests.R")

# Check coverage
function_coverage(check_genotypes, test_check_genotypes())
function_coverage(inbreeding_coefficient, test_inbreeding_coefficient())
function_coverage(fixation_index, test_fixation_index())

# RUN ALL THE ABOVE TO MEASURE COVERAGE FOR EACH FUNCTION

## Hint: Use report() to generate a clickable coverage report in HTML format from the
## output of function_coverage(), and find which lines are not covered.