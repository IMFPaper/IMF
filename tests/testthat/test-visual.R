library(testthat)
library(resultcheck)

test_that("Coefficient plot script produces stable results", {
  sandbox <- setup_sandbox(c("data", "save"))
  on.exit(cleanup_sandbox(sandbox), add = TRUE)

  # Errors immediately if any snapshot inside visual.R doesn't match.
  run_in_sandbox("code/visual.R", sandbox)

  # Verify output files were written.
  expect_true(
    file.exists(file.path(sandbox$path, "save/coef_plot.rds")),
    info = "coef_plot.rds not found"
  )
})
