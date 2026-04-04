library(testthat)
library(resultcheck)

test_that("PCA script produces stable results", {
  sandbox <- setup_sandbox(c("data", "save", "helper"))
  on.exit(cleanup_sandbox(sandbox), add = TRUE)

  # Errors immediately if any snapshot inside analysis.R doesn't match.
  run_in_sandbox("code/PCA.R", sandbox)

  # Verify output files were written.
  expect_true(
    file.exists(file.path(sandbox$path, "save/corr.RData")),
    info = "corr.RData not found"
  )
  expect_true(
    file.exists(file.path(sandbox$path, "save/PCA.RData")),
    info = "PCA.RData not found"
  )
  expect_true(
    file.exists(file.path(sandbox$path, "save/scree.RData")),
    info = "scree.RData not found"
  )
  expect_true(
    file.exists(file.path(sandbox$path, "data/panel_data_pca.rds")),
    info = "panel_data_pca.rds not found"
  )
  expect_true(
    file.exists(file.path(sandbox$path, "save/regModels.RData")),
    info = "regModels.RData not found"
  )
  expect_true(
    file.exists(file.path(sandbox$path, "save/regTable.RData")),
    info = "regTable.RData not found"
  )
})
