# Helper function to extract R code chunks
extract_r_chunks <- function(lines) {
  chunks <- list()
  in_chunk <- FALSE
  chunk_lines <- c()
  chunk_label <- NULL
  chunk_num <- 0

  for (i in seq_along(lines)) {
    line <- lines[i]

    # Start of R chunk
    if (grepl("^```\\{r", line)) {
      in_chunk <- TRUE
      chunk_num <- chunk_num + 1

      # Extract label if present
      if (i + 1 <= length(lines) && grepl("^#\\|\\s*label:", lines[i + 1])) {
        label_match <- regmatches(
          lines[i + 1],
          regexec("^#\\|\\s*label:\\s*(.+)$", lines[i + 1])
        )
        if (length(label_match[[1]]) > 1) {
          chunk_label <- trimws(label_match[[1]][2]) # Trim whitespace around the label
        } else {
          chunk_label <- paste0("chunk_", chunk_num)
        }
      } else {
        chunk_label <- paste0("chunk_", chunk_num)
      }

      chunk_lines <- c()
      next
    }

    # End of chunk
    if (in_chunk && grepl("^```\\s*$", line)) {
      in_chunk <- FALSE
      chunks[[chunk_label]] <- chunk_lines
      chunk_label <- NULL
      next
    }

    # Inside chunk - collect lines (skip chunk options)
    if (in_chunk && !grepl("^#\\|", line)) {
      chunk_lines <- c(chunk_lines, line)
    }
  }

  return(chunks)
}
