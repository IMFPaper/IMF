library(testthat)
library(resultcheck)

test_that("fiscal.R produces stable results", {
  sandbox <- setup_sandbox(c("data", "save", "helper"))
  on.exit(cleanup_sandbox(sandbox), add = TRUE)

  # Errors immediately if any snapshot inside analysis.R doesn't match.
  run_in_sandbox("code/fiscal.R", sandbox)

  # Verify output files were written.
  expect_true(
    file.exists(file.path(sandbox$path, "data/panel_data_fiscal.rds")),
    info = "panel_data_fiscal.rds not found"
  )
  expect_true(
    file.exists(file.path(sandbox$path, "save/regTable_fiscal.RData")),
    info = "regTable_fiscal.RData not found"
  )
  expect_true(
    file.exists(file.path(sandbox$path, "save/regModels_fiscal.RData")),
    info = "regModels_fiscal.RData not found"
  )
})
