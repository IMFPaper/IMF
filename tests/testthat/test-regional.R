library(testthat)
library(resultcheck)

test_that("Regional analysis produces stable results", {
  sandbox <- setup_sandbox(c("data", "save", "helper"))
  on.exit(cleanup_sandbox(sandbox), add = TRUE)

  # Errors immediately if any snapshot inside analysis.R doesn't match.
  run_in_sandbox("code/is_Africa.R", sandbox)
  run_in_sandbox("code/is_Europe.R", sandbox)

  # Verify output files were written.
  expect_true(
    file.exists(file.path(sandbox$path, "save/regModels_africa.RData")),
    info = "regModels_africa.RData not found"
  )
  expect_true(
    file.exists(file.path(sandbox$path, "save/regTable_africa.RData")),
    info = "regTable_africa.RData not found"
  )
  expect_true(
    file.exists(file.path(sandbox$path, "save/regModels_europe.RData")),
    info = "regModels_europe.RData not found"
  )
  expect_true(
    file.exists(file.path(sandbox$path, "save/regTable_europe.RData")),
    info = "regTable_europe.RData not found"
  )
})
