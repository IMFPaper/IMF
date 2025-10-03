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

# Cleanup
withr::defer({
  if (exists("fiscal_temp_dir")) {
    unlink(fiscal_temp_dir, recursive = TRUE, force = TRUE)
    rm(fiscal_temp_dir, envir = .GlobalEnv)
  }
}, envir = .GlobalEnv)