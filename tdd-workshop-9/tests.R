## Here are the test functions.

library(testthat)

source("functions.R")

# Function to test checks
test_check_genotypes <- function() {
  
  # Test checks
  expect_error(check_genotypes(c()))
  expect_error(check_genotypes(list("AA", "aa")))
  expect_error(check_genotypes(c("AA", "Aa", "aa", "Aaa")))
  expect_all_true(check_genotypes(c("AA", "Aa", "aa")) == c("AA", "Aa", "aa"))
  expect_error(inbreeding_coefficient(c("", "", "")))
  
}

# Function to test inbreeding coefficient
test_inbreeding_coefficient <- function() {
  
  # Test inbreeding coefficient
  expect_equal(inbreeding_coefficient(c("AA", "Aa", "aa")), 1/3)
  expect_equal(inbreeding_coefficient(c("AA", "AA", "aa", "aa")), 1)
  expect_equal(inbreeding_coefficient(c("AA", "Aa", "aa", "Aa")), 0)
  expect_true(is.nan(inbreeding_coefficient(c("AA", "AA", "AA"))))
  expect_true(is.nan(inbreeding_coefficient(c("aa", "aa", "aa"))))
  
}

# Function to test fixation index
test_fixation_index <- function() {
  
  # Test fixation index
  expect_equal(fixation_index(c("AA", "AA", "AA"), c("aa", "aa", "aa")), 1)
  expect_equal(fixation_index(c("AA", "Aa", "aa"), c("aa", "Aa", "AA")), 0)
  expect_equal(fixation_index(c("Aa", "Aa", "Aa"), c("Aa", "Aa", "Aa")), 0)
  expect_equal(fixation_index(c("AA", "AA", "Aa", "Aa"), c("aa", "aa", "Aa", "Aa")), 0.25)
  
}