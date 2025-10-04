library(testthat)
library(here)
i_am("tests/testthat/test-manuscript.R")

test_that("manuscript.qmd file exists and is readable", {
  expect_true(
    file.exists(here("manuscript/manuscript.qmd")),
    info = "manuscript.qmd not found"
  )

  # Check that file can be read
  manuscript_content <- readLines(
    here("manuscript/manuscript.qmd"),
    warn = FALSE
  )
  expect_gt(
    length(manuscript_content),
    400,
    label = "manuscript.qmd should have substantial content"
  )
})

test_that("all required data dependencies exist", {
  # Check that all required saved data files exist
  required_files <- c(
    "save/corr.RData",
    "save/PCA.RData",
    "save/scree.RData",
    "save/regTable.RData",
    "save/regTable_africa.RData",
    "save/regTable_europe.RData",
    "save/regTable_fiscal.RData",
    "data/panel_data_pca.rds"
  )

  for (file in required_files) {
    expect_true(
      file.exists(here(file)),
      info = paste(file, "not found - run analysis scripts first")
    )
  }
})

test_that("manuscript.qmd contains expected sections", {
  # Read the manuscript file
  manuscript_content <- readLines(
    here("manuscript/manuscript.qmd"),
    warn = FALSE
  )
  manuscript_text <- paste(manuscript_content, collapse = "\n")

  # Check for key sections
  expect_true(
    grepl("# Introduction", manuscript_text, fixed = TRUE),
    info = "Introduction section not found"
  )
  expect_true(
    grepl("# Literature Review", manuscript_text, fixed = FALSE),
    info = "Literature Review section not found"
  )
  expect_true(
    grepl("# Hypotheses", manuscript_text, fixed = TRUE),
    info = "Hypotheses section not found"
  )
  expect_true(
    grepl("# Data", manuscript_text, fixed = TRUE),
    info = "Data section not found"
  )
  expect_true(
    grepl("# Model Specification", manuscript_text, fixed = FALSE),
    info = "Model Specification section not found"
  )
  expect_true(
    grepl("# Results", manuscript_text, fixed = TRUE),
    info = "Results section not found"
  )
  expect_true(
    grepl("# Robustness Checks", manuscript_text, fixed = TRUE),
    info = "Robustness Checks section not found"
  )
  expect_true(
    grepl("# Conclusion", manuscript_text, fixed = TRUE),
    info = "Conclusion section not found"
  )
})

test_that("manuscript.qmd loads all required data files correctly", {
  # Read the manuscript file
  manuscript_content <- readLines(
    here("manuscript/manuscript.qmd"),
    warn = FALSE
  )
  manuscript_text <- paste(manuscript_content, collapse = "\n")

  # Check that manuscript loads the expected data files
  expected_loads <- c(
    "save/corr.RData",
    "save/PCA.RData",
    "save/scree.RData",
    "save/regTable.RData",
    "save/regTable_africa.RData",
    "save/regTable_europe.RData",
    "save/regTable_fiscal.RData",
    "data/panel_data_pca.rds"
  )

  for (file in expected_loads) {
    # Check if file is referenced in manuscript
    expect_true(
      grepl(file, manuscript_text, fixed = TRUE),
      info = paste("Expected reference to", file, "not found in manuscript")
    )
  }
})

test_that("R code chunks in manuscript.qmd execute correctly and match snapshots", {
  # Read manuscript file
  manuscript_path <- here("manuscript/manuscript.qmd")
  manuscript_content <- readLines(manuscript_path, warn = FALSE)

  source(here("tests/testthat/helper-r-chunk.R"))

  # Extract all R chunks
  chunks <- extract_r_chunks(manuscript_content)
  expect_gt(length(chunks), 0, label = "Should find at least one R chunk")

  # Set working directory to project root for chunk execution
  withr::with_dir(here(), {
    # Create a clean environment for chunk execution
    chunk_env <- new.env(parent = .GlobalEnv)

    # Execute each chunk and snapshot outputs
    for (chunk_name in names(chunks)) {
      chunk_code <- chunks[[chunk_name]]

      # Skip empty chunks
      if (length(chunk_code) == 0 || all(trimws(chunk_code) == "")) {
        next
      }

      # Check if this is a table chunk (starts with tbl-)
      is_table_chunk <- grepl("^tbl-", chunk_name)

      # Concatenate lines of the chunk into a single string
      chunk_code_combined <- paste(chunk_code, collapse = "\n")

      # Capture output and any side effects
      output <- capture.output({
        result <- tryCatch(
          {
            eval(parse(text = chunk_code_combined), envir = chunk_env)
          },
          error = function(e) {
            list(error = e$message)
          }
        )
      })

      # Create snapshot data based on chunk type
      if (is_table_chunk) {
        # For table chunks, capture the LaTeX output
        latex_output <- if (exists("result") && !is.null(result)) {
          if (inherits(result, "list") && !is.null(result$error)) {
            result
          } else if (inherits(result, "tinytable")) {
            # Capture LaTeX representation
            capture.output(print(result, output = "latex"))
          } else {
            # Try to convert to character/print for other table types
            capture.output(print(result))
          }
        } else {
          NULL
        }
        
        snapshot_data <- list(
          chunk_name = chunk_name,
          code = chunk_code_combined,
          latex_output = latex_output
        )
      } else {
        # For non-table chunks, use the summary approach
        snapshot_data <- list(
          chunk_name = chunk_name,
          code = chunk_code_combined,
          output = output,
          result = if (exists("result")) {
            if (inherits(result, "list") && !is.null(result$error)) {
              result
            } else if (is.null(result)) {
              NULL
            } else {
              # Capture structure for non-null results
              list(
                class = class(result),
                summary = if (is.data.frame(result)) {
                  list(
                    nrow = nrow(result),
                    ncol = ncol(result),
                    colnames = colnames(result)
                  )
                } else {
                  capture.output(str(result, max.level = 2))
                }
              )
            }
          } else {
            NULL
          }
        )
      }
      
      # Snapshot the chunk execution
      expect_snapshot(snapshot_data, cran = FALSE, variant = chunk_name)
    }
  })
})