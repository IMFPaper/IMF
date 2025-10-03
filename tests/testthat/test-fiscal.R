library(testthat)
library(here)
i_am("tests/testthat/test-fiscal.R")

# Setup: Run fiscal.R once and store results for all subsequent tests
local({
    test_that("fiscal script setup and execution", {

      # Create temp workspace that persists across tests
      temp_dir <- tempfile("fiscal_test_")
      dir.create(temp_dir)

      # Copy required inputs
      dir.create(file.path(temp_dir, "data"), recursive = TRUE)
      dir.create(file.path(temp_dir, "save"), recursive = TRUE)
      dir.create(file.path(temp_dir, "helper"), recursive = TRUE)

      file.copy(here("data/panel_data_pca.rds"), file.path(temp_dir, "data/panel_data_pca.rds"))
      file.copy(here("data/fiscal.dta"), file.path(temp_dir, "data/fiscal.dta"))
      file.copy(here("save/regModels.RData"), file.path(temp_dir, "save/regModels.RData"))
      file.copy(here("helper/f_test_fiscal.R"), file.path(temp_dir, "helper/f_test_fiscal.R"))

      # Run PCA.R in temp directory
      withr::with_dir(temp_dir, {
        suppressMessages({
          suppressWarnings({
            pdf(NULL)
            capture.output({
              source(here("code/fiscal.R"))
            })
            dev.off()
          })
        })
      })

      # Store temp_dir for subsequent tests
      assign("fiscal_temp_dir", temp_dir, envir = .GlobalEnv)

      # Basic check that script completed
      expect_true(file.exists(file.path(temp_dir, "data/panel_data_fiscal.rds")))
      expect_true(file.exists(file.path(temp_dir, "save/regModels_fiscal.RData")))
      expect_true(file.exists(file.path(temp_dir, "save/regTable_fiscal.RData")))
    })
})

test_that("Panel data with fiscal variables is reproducible", {
  skip_if_not(exists("fiscal_temp_dir"))
  
  expect_true(file.exists(here("data/panel_data_fiscal.rds")),
              info = "Original panel_data_fiscal.rds not found - run code/fiscal.R to generate it")
  expect_true(file.exists(file.path(fiscal_temp_dir, "data/panel_data_fiscal.rds")),
              info = "Regenerated panel_data_fiscal not found")

  original_data <- readRDS(here("data/panel_data_fiscal.rds"))
  regenerated_data <- readRDS(file.path(fiscal_temp_dir, "data/panel_data_fiscal.rds"))

  # Check dimensions
  expect_equal(dim(original_data), dim(regenerated_data))
  expect_equal(names(original_data), names(regenerated_data))

  # Check PCA variables specifically (allowing for potential sign flips)
  expect_equal(abs(original_data$us), abs(regenerated_data$us), tolerance = 1e-10)
  expect_equal(abs(original_data$eu), abs(regenerated_data$eu), tolerance = 1e-10)
  expect_equal(abs(original_data$pca), abs(regenerated_data$pca), tolerance = 1e-10)

  # Check non-PCA variables are identical
  non_pca_vars <- setdiff(names(original_data), c("us", "eu", "pca"))
  for (var in non_pca_vars) {
    expect_equal(original_data[[var]], regenerated_data[[var]], tolerance = 1e-12)
  }
})

test_that("Fiscal Regression models are reproducible", {
  skip_if_not(exists("fiscal_temp_dir"))
  
  expect_true(file.exists(here("save/regModels_fiscal.RData")),
              info = "Original regModels_fiscal.RData not found - run code/fiscal.R to generate it")
  expect_true(file.exists(file.path(fiscal_temp_dir, "save/regModels_fiscal.RData")),
              info = "Regenerated regModels_fiscal.RData not found")

  load(here("save/regModels_fiscal.RData"))
  original_models <- regModels

  load(file.path(fiscal_temp_dir, "save/regModels_fiscal.RData"))

  # Check that same number of models exist
  expect_equal(length(original_models), length(regModels))
  expect_equal(names(original_models), names(regModels))

  # Check coefficients for each model (allowing for small numerical differences)
  for (model_name in names(original_models)) {
    original_coef <- coef(original_models[[model_name]])
    regenerated_coef <- coef(regModels[[model_name]])

    expect_equal(original_coef, regenerated_coef, tolerance = 1e-8,
                 label = paste("Coefficients for", model_name))
  }
})

test_that("Fiscal Regression table is reproducible", {
  skip_if_not(exists("fiscal_temp_dir"))
  
  expect_true(file.exists(here("save/regTable_fiscal.RData")),
              info = "Original regTable_fiscal.RData not found - run code/fiscal.R to generate it")
  expect_true(file.exists(file.path(fiscal_temp_dir, "save/regTable_fiscal.RData")),
              info = "Regenerated regTable_fiscal.RData not found")

  load(here("save/regTable_fiscal.RData"))
  original_table <- resultsTable

  load(file.path(fiscal_temp_dir, "save/regTable_fiscal.RData"))

  # Compare the actual table data, not the S4 object attributes
  # Extract the data frame or character representation
  original_output <- format(original_table, output = "latex")
  regenerated_output <- format(resultsTable, output = "latex")
  
  expect_equal(original_output, regenerated_output)
})

# Cleanup
withr::defer({
  if (exists("fiscal_temp_dir")) {
    unlink(fiscal_temp_dir, recursive = TRUE, force = TRUE)
    rm(fiscal_temp_dir, envir = .GlobalEnv)
  }
}, envir = .GlobalEnv)