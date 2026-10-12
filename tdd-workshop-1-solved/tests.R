## Here are the test functions.

library(testthat)

source("functions.R")

# Function to test inbreeding coefficient
test_inbreeding_coefficient <- function() {
  
  # Example where we know the output should be 1/3
  expect_equal(inbreeding_coefficient(c("AA", "Aa", "aa")), 1/3)
  
  # Example where we know the output should be 1
  expect_equal(inbreeding_coefficient(c("AA", "AA", "aa", "aa")), 1)
  
  # Example where we know the output should be 0
  expect_equal(inbreeding_coefficient(c("AA", "Aa", "aa", "Aa")), 0)
  
}

# Hint: The above function is called from another script to run all the tests
# at once, but you can also run each of them separately by pasting them into
# your R console from here.