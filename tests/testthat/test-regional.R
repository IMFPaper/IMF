library(testthat)
library(here)
i_am("tests/testthat/test-regional.R")

# Setup: Run is_Africa.R and is_Europe.R once and store results for all subsequent tests
local({
    test_that("is_Africa script setup and execution", {
      skip_if_not(file.exists(here("code/is_Africa.R")))
      skip_if_not(file.exists(here("data/panel_data_pca.rds")))

      # Create temp workspace that persists across tests
      temp_dir <- tempfile("pca_test_")
      dir.create(temp_dir)

      # Copy required inputs
      dir.create(file.path(temp_dir, "data"), recursive = TRUE)
      dir.create(file.path(temp_dir, "save"), recursive = TRUE)
      dir.create(file.path(temp_dir, "helper"), recursive = TRUE)

      file.copy(here("data/panel_data_pca.rds"), file.path(temp_dir, "data/panel_data_pca.rds"))
      file.copy(here("helper/f_test.R"), file.path(temp_dir, "helper/f_test.R"))

      # Run PCA.R in temp directory
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

test_that("Africa Regression table is reproducible", {
  skip_if_not(exists("regional_temp_dir"))
  
  expect_true(file.exists(here("save/regTable_africa.RData")),
              info = "Original regTable_africa.RData not found - run code/PCA.R to generate it")
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
              info = "Original regTable_europe.RData not found - run code/PCA.R to generate it")
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