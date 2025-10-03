library(testthat)
library(here)
i_am("tests/testthat/test-PCA.R")

# Setup: Run PCA.R once and store results for all subsequent tests
local({
    test_that("PCA script setup and execution", {
      skip_if_not(file.exists(here("code/PCA.R")))
      skip_if_not(file.exists(here("data/panel_data.rds")))

      # Create temp workspace that persists across tests
      temp_dir <- tempfile("pca_test_")
      dir.create(temp_dir)

      # Copy required inputs
      dir.create(file.path(temp_dir, "data"), recursive = TRUE)
      dir.create(file.path(temp_dir, "save"), recursive = TRUE)
      dir.create(file.path(temp_dir, "helper"), recursive = TRUE)

      file.copy(here("data/panel_data.rds"), file.path(temp_dir, "data/panel_data.rds"))
      file.copy(here("helper/f_test.R"), file.path(temp_dir, "helper/f_test.R"))

      # Run PCA.R in temp directory
      withr::with_dir(temp_dir, {
        suppressMessages({
          suppressWarnings({
            pdf(NULL)
            capture.output({
              source(here("code/PCA.R"))
            })
            dev.off()
          })
        })
      })

      # Store temp_dir for subsequent tests
      assign("pca_temp_dir", temp_dir, envir = .GlobalEnv)
      assign(".pca_test_setup_done", TRUE, envir = .GlobalEnv)

      # Basic check that script completed
      expect_true(file.exists(file.path(temp_dir, "save/corr.RData")))
      expect_true(file.exists(file.path(temp_dir, "save/PCA.RData")))
      expect_true(file.exists(file.path(temp_dir, "save/scree.RData")))
      expect_true(file.exists(file.path(temp_dir, "data/panel_data_pca.rds")))
      expect_true(file.exists(file.path(temp_dir, "save/regModels.RData")))
      expect_true(file.exists(file.path(temp_dir, "save/regTable.RData")))
    })
})

test_that("Correlation matrices are reproducible", {
  skip_if_not(exists("pca_temp_dir"))
  
  # Both files must exist
  expect_true(file.exists(here("save/corr.RData")), 
              info = "Original corr.RData not found - run code/PCA.R to generate it")
  expect_true(file.exists(file.path(pca_temp_dir, "save/corr.RData")),
              info = "Regenerated corr.RData not found")

  # Load and compare
  load(here("save/corr.RData"))
  original_corr_US <- corr_US
  original_corr_EU <- corr_EU

  load(file.path(pca_temp_dir, "save/corr.RData"))

  expect_equal(original_corr_US, corr_US, tolerance = 1e-10)
  expect_equal(original_corr_EU, corr_EU, tolerance = 1e-10)
})

test_that("PCA results are reproducible", {
  skip_if_not(exists("pca_temp_dir"))
  
  expect_true(file.exists(here("save/PCA.RData")),
              info = "Original PCA.RData not found - run code/PCA.R to generate it")
  expect_true(file.exists(file.path(pca_temp_dir, "save/PCA.RData")),
              info = "Regenerated PCA.RData not found")

  load(here("save/PCA.RData"))
  original_US <- US
  original_EU <- EU

  load(file.path(pca_temp_dir, "save/PCA.RData"))

  # Compare PCA standard deviations (eigenvalues)
  expect_equal(original_US$sdev, US$sdev, tolerance = 1e-10)
  expect_equal(original_EU$sdev, EU$sdev, tolerance = 1e-10)

  # Compare loadings (may have sign differences, so check absolute values)
  expect_equal(abs(original_US$rotation), abs(US$rotation), tolerance = 1e-10)
  expect_equal(abs(original_EU$rotation), abs(EU$rotation), tolerance = 1e-10)
})

test_that("Scree plot data is reproducible", {
  skip_if_not(exists("pca_temp_dir"))
  
  expect_true(file.exists(here("save/scree.RData")),
              info = "Original scree.RData not found - run code/PCA.R to generate it")
  expect_true(file.exists(file.path(pca_temp_dir, "save/scree.RData")),
              info = "Regenerated scree.RData not found")

  load(here("save/scree.RData"))
  original_scree_US <- scree_US
  original_scree_EU <- scree_EU

  load(file.path(pca_temp_dir, "save/scree.RData"))

  # Compare plot data (ggplot objects)
  expect_equal(original_scree_US$data, scree_US$data, tolerance = 1e-10)
  expect_equal(original_scree_EU$data, scree_EU$data, tolerance = 1e-10)
})

test_that("Panel data with PCA variables is reproducible", {
  skip_if_not(exists("pca_temp_dir"))
  
  expect_true(file.exists(here("data/panel_data_pca.rds")),
              info = "Original panel_data_pca.rds not found - run code/PCA.R to generate it")
  expect_true(file.exists(file.path(pca_temp_dir, "data/panel_data_pca.rds")),
              info = "Regenerated panel_data_pca.rds not found")

  original_data <- readRDS(here("data/panel_data_pca.rds"))
  regenerated_data <- readRDS(file.path(pca_temp_dir, "data/panel_data_pca.rds"))

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

test_that("Regression models are reproducible", {
  skip_if_not(exists("pca_temp_dir"))
  
  expect_true(file.exists(here("save/regModels.RData")),
              info = "Original regModels.RData not found - run code/PCA.R to generate it")
  expect_true(file.exists(file.path(pca_temp_dir, "save/regModels.RData")),
              info = "Regenerated regModels.RData not found")

  load(here("save/regModels.RData"))
  original_models <- regModels

  load(file.path(pca_temp_dir, "save/regModels.RData"))

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

test_that("Regression table is reproducible", {
  skip_if_not(exists("pca_temp_dir"))
  
  expect_true(file.exists(here("save/regTable.RData")),
              info = "Original regTable.RData not found - run code/PCA.R to generate it")
  expect_true(file.exists(file.path(pca_temp_dir, "save/regTable.RData")),
              info = "Regenerated regTable.RData not found")

  load(here("save/regTable.RData"))
  original_table <- resultsTable

  load(file.path(pca_temp_dir, "save/regTable.RData"))

  # Check that table content is identical
  expect_equal(original_table, resultsTable)
})

# Cleanup
withr::defer({
  if (exists("pca_temp_dir")) {
    unlink(pca_temp_dir, recursive = TRUE, force = TRUE)
    rm(pca_temp_dir, envir = .GlobalEnv)
    rm(.pca_test_setup_done, envir = .GlobalEnv)
  }
}, envir = .GlobalEnv)