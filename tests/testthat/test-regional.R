library(testthat)
library(here)
i_am("tests/testthat/test-regional.R")

# Setup: Run is_Africa.R and is_Europe.R once and store results for all subsequent tests
local({
    test_that("is_Africa script setup and execution", {

      # Create temp workspace that persists across tests
      temp_dir <- tempfile("regional_test_")
      dir.create(temp_dir)

      # Copy required inputs
      dir.create(file.path(temp_dir, "data"), recursive = TRUE)
      dir.create(file.path(temp_dir, "save"), recursive = TRUE)
      dir.create(file.path(temp_dir, "helper"), recursive = TRUE)

      file.copy(here("data/panel_data_pca.rds"), file.path(temp_dir, "data/panel_data_pca.rds"))
      file.copy(here("helper/f_test.R"), file.path(temp_dir, "helper/f_test.R"))

      # Run scripts in temp directory
      withr::with_dir(temp_dir, {
        suppressMessages({
          suppressWarnings({
            pdf(NULL)
            capture.output({
              source(here("code/is_Africa.R"))
              source(here("code/is_Europe.R"))
            })
            dev.off()
          })
        })
      })

      # Store temp_dir for subsequent tests
      assign("regional_temp_dir", temp_dir, envir = .GlobalEnv)

      # Basic check that script completed
      expect_true(file.exists(file.path(temp_dir, "save/regModels_africa.RData")))
      expect_true(file.exists(file.path(temp_dir, "save/regTable_africa.RData")))
      expect_true(file.exists(file.path(temp_dir, "save/regModels_europe.RData")))
      expect_true(file.exists(file.path(temp_dir, "save/regTable_europe.RData")))
    })
})

test_that("Africa Regression models are reproducible", {
  skip_if_not(exists("regional_temp_dir"))
  
  expect_true(file.exists(here("save/regModels_africa.RData")),
              info = "Original regModels_africa.RData not found - run code/is_Africa.R to generate it")
  expect_true(file.exists(file.path(regional_temp_dir, "save/regModels_africa.RData")),
              info = "Regenerated regModels_africa.RData not found")

  load(here("save/regModels_africa.RData"))
  original_models <- regModels

  load(file.path(regional_temp_dir, "save/regModels_africa.RData"))

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

test_that("Europe Regression models are reproducible", {
  skip_if_not(exists("regional_temp_dir"))
  
  expect_true(file.exists(here("save/regModels_europe.RData")),
              info = "Original regModels_europe.RData not found - run code/is_Europe.R to generate it")
  expect_true(file.exists(file.path(regional_temp_dir, "save/regModels_europe.RData")),
              info = "Regenerated regModels_europe.RData not found")

  load(here("save/regModels_europe.RData"))
  original_models <- regModels

  load(file.path(regional_temp_dir, "save/regModels_europe.RData"))

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

test_that("Africa Regression table is reproducible", {
  skip_if_not(exists("regional_temp_dir"))
  
  expect_true(file.exists(here("save/regTable_africa.RData")),
              info = "Original regTable_africa.RData not found - run code/is_Africa.R to generate it")
  expect_true(file.exists(file.path(regional_temp_dir, "save/regTable_africa.RData")),
              info = "Regenerated regTable_africa.RData not found")

  load(here("save/regTable_africa.RData"))
  original_table <- resultsTable

  load(file.path(regional_temp_dir, "save/regTable_africa.RData"))

  # Compare the actual table data, not the S4 object attributes
  # Extract the data frame or character representation
  original_output <- format(original_table, output = "latex")
  regenerated_output <- format(resultsTable, output = "latex")
  
  expect_equal(original_output, regenerated_output)
})

test_that("Europe Regression table is reproducible", {
  skip_if_not(exists("regional_temp_dir"))
  
  expect_true(file.exists(here("save/regTable_europe.RData")),
              info = "Original regTable_europe.RData not found - run code/is_Europe.R to generate it")
  expect_true(file.exists(file.path(regional_temp_dir, "save/regTable_europe.RData")),
              info = "Regenerated regTable_europe.RData not found")

  load(here("save/regTable_europe.RData"))
  original_table <- resultsTable

  load(file.path(regional_temp_dir, "save/regTable_europe.RData"))

  # Compare the actual table data, not the S4 object attributes
  # Extract the data frame or character representation
  original_output <- format(original_table, output = "latex")
  regenerated_output <- format(resultsTable, output = "latex")
  
  expect_equal(original_output, regenerated_output)
})

# Cleanup
withr::defer({
  if (exists("regional_temp_dir")) {
    unlink(regional_temp_dir, recursive = TRUE, force = TRUE)
    rm(regional_temp_dir, envir = .GlobalEnv)
  }
}, envir = .GlobalEnv)