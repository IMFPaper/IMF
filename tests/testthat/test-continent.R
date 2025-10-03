library(testthat)
library(here)
i_am("tests/testthat/test-continent.R")

test_that("Reproduce `data/panel_data.rds` (regenerate if needed)", {
  # Create temp workspace
  temp_dir <- withr::local_tempdir()

  # Copy inputs needed by continent.R
  dir.create(file.path(temp_dir, "data"), recursive = TRUE)
  file.copy(
    here("data/panel_data_raw.dta"),
    file.path(temp_dir, "data/panel_data_raw.dta")
  )
  file.copy(
    here("data/continents.json"),
    file.path(temp_dir, "data/continents.json")
  )

  # Run continent.R in temp directory
  withr::with_dir(temp_dir, {
    source(here("code/continent.R"))
  })

  # Load both versions
  original <- readRDS(here("data/panel_data.rds"))
  regenerated <- readRDS(file.path(temp_dir, "data/panel_data.rds"))

  # Compare
  expect_identical(original, regenerated)
})
