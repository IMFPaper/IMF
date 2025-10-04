library(testthat)
library(here)
i_am("tests/testthat/test-manuscript.R")

test_that("manuscript.qmd file exists and is readable", {
  expect_true(file.exists(here("manuscript/manuscript.qmd")),
              info = "manuscript.qmd not found")
  
  # Check that file can be read
  manuscript_content <- readLines(here("manuscript/manuscript.qmd"), warn = FALSE)
  expect_gt(length(manuscript_content), 400,
            label = "manuscript.qmd should have substantial content")
})

test_that("all required data dependencies exist", {
  # Check that all required saved data files exist
  required_files <- c(
    "save/corr.RData",
    "save/PCA.RData", 
    "save/scree.RData",
    "save/regTable.RData",
    "save/regTable_africa.RData",
    "save/regTable_europe.RData",
    "save/regTable_fiscal.RData",
    "data/panel_data_pca.rds"
  )
  
  for (file in required_files) {
    expect_true(file.exists(here(file)),
                info = paste(file, "not found - run analysis scripts first"))
  }
})

test_that("manuscript.qmd contains expected sections", {
  # Read the manuscript file
  manuscript_content <- readLines(here("manuscript/manuscript.qmd"), warn = FALSE)
  manuscript_text <- paste(manuscript_content, collapse = "\n")
  
  # Check for key sections
  expect_true(grepl("# Introduction", manuscript_text, fixed = TRUE),
              info = "Introduction section not found")
  expect_true(grepl("# Literature Review", manuscript_text, fixed = FALSE),
              info = "Literature Review section not found")
  expect_true(grepl("# Hypotheses", manuscript_text, fixed = TRUE),
              info = "Hypotheses section not found")
  expect_true(grepl("# Data", manuscript_text, fixed = TRUE),
              info = "Data section not found")
  expect_true(grepl("# Model Specification", manuscript_text, fixed = FALSE),
              info = "Model Specification section not found")
  expect_true(grepl("# Results", manuscript_text, fixed = TRUE),
              info = "Results section not found")
  expect_true(grepl("# Robustness Checks", manuscript_text, fixed = TRUE),
              info = "Robustness Checks section not found")
  expect_true(grepl("# Conclusion", manuscript_text, fixed = TRUE),
              info = "Conclusion section not found")
})

test_that("manuscript.qmd loads all required data files correctly", {
  # Read the manuscript file
  manuscript_content <- readLines(here("manuscript/manuscript.qmd"), warn = FALSE)
  manuscript_text <- paste(manuscript_content, collapse = "\n")
  
  # Check that manuscript loads the expected data files
  expected_loads <- c(
    "save/corr.RData",
    "save/PCA.RData",
    "save/scree.RData",
    "save/regTable.RData",
    "save/regTable_africa.RData",
    "save/regTable_europe.RData",
    "save/regTable_fiscal.RData",
    "data/panel_data_pca.rds"
  )
  
  for (file in expected_loads) {
    # Check if file is referenced in manuscript
    expect_true(grepl(file, manuscript_text, fixed = TRUE),
                info = paste("Expected reference to", file, "not found in manuscript"))
  }
})

