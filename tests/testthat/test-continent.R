library(testthat)
library(resultcheck)

test_that("continent.R produces stable results", {
  sandbox <- setup_sandbox(c("data/panel_data_raw.dta", "data/continents.json"))
  on.exit(cleanup_sandbox(sandbox), add = TRUE)

  # Errors immediately if any snapshot inside analysis.R doesn't match.
  run_in_sandbox("code/continent.R", sandbox)

  # Verify output files were written.
  expect_true(
    file.exists(file.path(sandbox$path, "data/panel_data.rds")),
    info = "panel_data.rds not found"
  )
})
