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
      assign("pca_temp_dir", temp_dir, envir = .GlobalEnv)

      # Basic check that script completed
      expect_true(file.exists(file.path(temp_dir, "save/regModels_africa.RData")))
      expect_true(file.exists(file.path(temp_dir, "save/regTable_africa.RData")))
      expect_true(file.exists(file.path(temp_dir, "save/regModels_europe.RData")))
      expect_true(file.exists(file.path(temp_dir, "save/regTable_europe.RData")))
    })
})
