library(testthat)
library(here)
i_am("tests/testthat/test-manuscript.R")

test_that("manuscript.qmd file exists and is readable", {
  expect_true(file.exists(here("manuscript/manuscript.qmd")),
              info = "manuscript.qmd not found")
  
  # Check that file can be read
  manuscript_content <- readLines(here("manuscript/manuscript.qmd"), warn = FALSE)
  expect_gt(length(manuscript_content), 100,
            label = "manuscript.qmd should have substantial content")
})

test_that("all required data dependencies exist", {
  # Check that all required saved data files exist
  required_files <- c(
    "save/corr.RData",
    "save/PCA.RData", 
    "save/scree.RData",
    "save/regModels.RData",
    "save/regTable.RData",
    "save/regModels_africa.RData",
    "save/regTable_africa.RData",
    "save/regModels_europe.RData",
    "save/regTable_europe.RData",
    "save/regModels_fiscal.RData",
    "save/regTable_fiscal.RData",
    "data/panel_data_pca.rds"
  )
  
  for (file in required_files) {
    expect_true(file.exists(here(file)),
                info = paste(file, "not found - run analysis scripts first"))
  }
})

test_that("manuscript.qmd contains expected sections", {
  # Read the manuscript file
  manuscript_content <- readLines(here("manuscript/manuscript.qmd"), warn = FALSE)
  manuscript_text <- paste(manuscript_content, collapse = "\n")
  
  # Check for key sections
  expect_true(grepl("# Introduction", manuscript_text, fixed = TRUE),
              info = "Introduction section not found")
  expect_true(grepl("# Literature Review", manuscript_text, fixed = FALSE),
              info = "Literature Review section not found")
  expect_true(grepl("# Hypotheses", manuscript_text, fixed = TRUE),
              info = "Hypotheses section not found")
  expect_true(grepl("# Data", manuscript_text, fixed = TRUE),
              info = "Data section not found")
  expect_true(grepl("# Model Specification", manuscript_text, fixed = FALSE),
              info = "Model Specification section not found")
  expect_true(grepl("# Results", manuscript_text, fixed = TRUE),
              info = "Results section not found")
  expect_true(grepl("# Robustness Checks", manuscript_text, fixed = TRUE),
              info = "Robustness Checks section not found")
  expect_true(grepl("# Conclusion", manuscript_text, fixed = TRUE),
              info = "Conclusion section not found")
})

test_that("manuscript.qmd loads all required data files correctly", {
  # Read the manuscript file
  manuscript_content <- readLines(here("manuscript/manuscript.qmd"), warn = FALSE)
  manuscript_text <- paste(manuscript_content, collapse = "\n")
  
  # Check that manuscript loads the expected data files
  expected_loads <- c(
    "save/corr.RData",
    "save/PCA.RData",
    "save/scree.RData",
    "save/regTable.RData",
    "save/regTable_africa.RData",
    "save/regTable_europe.RData",
    "save/regTable_fiscal.RData"
  )
  
  for (file in expected_loads) {
    # Check if file is referenced in manuscript
    expect_true(grepl(file, manuscript_text, fixed = TRUE),
                info = paste("Expected reference to", file, "not found in manuscript"))
  }
})

test_that("manuscript.qmd uses tinytable correctly", {
  # Read the manuscript file
  manuscript_content <- readLines(here("manuscript/manuscript.qmd"), warn = FALSE)
  manuscript_text <- paste(manuscript_content, collapse = "\n")
  
  # Check that tinytable is used
  expect_true(grepl("tinytable", manuscript_text, fixed = TRUE),
              info = "tinytable package not used in manuscript")
  
  # Check that theme_latex is used (for LaTeX/PDF output)
  expect_true(grepl("theme_latex", manuscript_text, fixed = TRUE),
              info = "tinytable::theme_latex not used in manuscript")
  
  # Check for proper tinytable usage pattern
  expect_true(grepl("tinytable::theme_latex\\(resize_width", manuscript_text),
              info = "Expected tinytable::theme_latex pattern not found")
})

test_that("all loaded data files can be read without errors", {
  # Test that all data files can actually be loaded
  data_files <- list(
    corr = "save/corr.RData",
    PCA = "save/PCA.RData",
    scree = "save/scree.RData",
    regTable = "save/regTable.RData",
    regTable_africa = "save/regTable_africa.RData",
    regTable_europe = "save/regTable_europe.RData",
    regTable_fiscal = "save/regTable_fiscal.RData",
    panel_data_pca = "data/panel_data_pca.rds"
  )
  
  for (file_name in names(data_files)) {
    file_path <- here(data_files[[file_name]])
    
    expect_no_error({
      if (grepl("\\.rds$", file_path)) {
        readRDS(file_path)
      } else {
        load(file_path)
      }
    }, message = paste("Error loading", file_name, "from", data_files[[file_name]]))
  }
})

test_that("loaded regression tables are tinytable objects", {
  # Load each regression table and check it's a tinytable object
  table_files <- c(
    "save/regTable.RData",
    "save/regTable_africa.RData",
    "save/regTable_europe.RData",
    "save/regTable_fiscal.RData"
  )
  
  for (table_file in table_files) {
    # Create a new environment to load into
    env <- new.env()
    load(here(table_file), envir = env)
    
    # Check that resultsTable was loaded
    expect_true("resultsTable" %in% ls(env),
                info = paste("resultsTable not found in", table_file))
    
    # Check that it's a tinytable object (S4 class)
    table_obj <- env$resultsTable
    expect_s4_class(table_obj, "tinytable")
    
    # Test that the table can be formatted to latex without errors
    expect_no_error({
      latex_output <- format(table_obj, output = "latex")
    }, message = paste("Error formatting", table_file, "to LaTeX"))
  }
})

test_that("manuscript.qmd can be rendered (if environment is configured)", {
  # Skip on CRAN to avoid long-running tests
  skip_on_cran()
  
  # Skip if quarto is not available
  skip_if_not(nzchar(Sys.which("quarto")), 
              message = "quarto not installed")
  
  # Skip if TinyTeX is not properly configured (orcidlink package check)
  # This allows the test to pass in CI where LaTeX is fully configured
  # but skip in local environments that may not have all packages
  tinytex_configured <- tryCatch({
    system2("/home/runner/.TinyTeX/bin/x86_64-linux/kpsewhich", 
            args = "orcidlink.sty",
            stdout = FALSE, stderr = FALSE) == 0
  }, error = function(e) FALSE)
  
  skip_if_not(tinytex_configured,
              message = "TinyTeX not fully configured with required packages (orcidlink)")
  
  # Create a temporary directory for rendering
  temp_dir <- tempfile("manuscript_test_")
  dir.create(temp_dir)
  
  # Copy all necessary files
  dir.create(file.path(temp_dir, "manuscript"), recursive = TRUE)
  file.copy(here("manuscript/manuscript.qmd"), 
            file.path(temp_dir, "manuscript/manuscript.qmd"))
  
  # Copy _extensions directory
  if (dir.exists(here("manuscript/_extensions"))) {
    file.copy(here("manuscript/_extensions"), 
              file.path(temp_dir, "manuscript"),
              recursive = TRUE)
  }
  
  # Copy saved data files
  dir.create(file.path(temp_dir, "save"), recursive = TRUE)
  for (file in list.files(here("save"), pattern = "\\.RData$", full.names = TRUE)) {
    file.copy(file, file.path(temp_dir, "save", basename(file)))
  }
  
  # Copy panel data
  dir.create(file.path(temp_dir, "data"), recursive = TRUE)
  if (file.exists(here("data/panel_data_pca.rds"))) {
    file.copy(here("data/panel_data_pca.rds"), 
              file.path(temp_dir, "data/panel_data_pca.rds"))
  }
  
  # Copy extra directory (references and CSL)
  if (dir.exists(here("extra"))) {
    file.copy(here("extra"), temp_dir, recursive = TRUE)
  }
  
  # Copy _quarto.yml
  if (file.exists(here("_quarto.yml"))) {
    file.copy(here("_quarto.yml"), file.path(temp_dir, "_quarto.yml"))
  }
  
  # Try to render
  withr::with_dir(temp_dir, {
    render_result <- tryCatch({
      exit_code <- system2("quarto", 
                          args = c("render", "manuscript/manuscript.qmd"),
                          stdout = TRUE,
                          stderr = TRUE)
      
      if (is.null(attr(exit_code, "status"))) {
        list(success = TRUE, output = exit_code)
      } else {
        list(success = FALSE, output = exit_code, 
             status = attr(exit_code, "status"))
      }
    }, error = function(e) {
      list(success = FALSE, error = e$message)
    })
    
    assign("render_result", render_result, envir = parent.frame())
  })
  
  # Check that rendering succeeded
  expect_true(render_result$success,
              info = paste("Manuscript rendering failed:",
                          if (!is.null(render_result$error)) render_result$error
                          else paste(tail(render_result$output, 30), collapse = "\n")))
  
  # Check that PDF was created
  expect_true(file.exists(file.path(temp_dir, "manuscript/manuscript.pdf")),
              info = "manuscript.pdf was not created")
  
  # Check that PDF is not empty
  pdf_size <- file.info(file.path(temp_dir, "manuscript/manuscript.pdf"))$size
  expect_gt(pdf_size, 100000,
            label = "PDF file size should be greater than 100KB")
  
  # Cleanup
  unlink(temp_dir, recursive = TRUE, force = TRUE)
})

