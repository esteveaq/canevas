#' Create a new project folder with templates and subfolders
#'
#' @param date_chr Date in "yyyy-mm-dd" format (used to fill placeholders)
#' @param readme Logical, whether to also create README.md
#' @export
create_project <- function(date_chr, readme = TRUE) {
  if (is.na(as.Date(date_chr, format = "%Y-%m-%d"))) {
    stop("'date_chr' must be in 'yyyy-mm-dd' format.")
  }

  # Extract date components
  date <-
    as.Date(date_chr, format = "%Y-%m-%d")
    if (is.na(date)) {
      stop("'date_chr' must be in 'yyyy-mm-dd' format.")
    }
  date_input <- format(date, "%Y-%m-%d")


  # Use current working directory as base folder
  base_dir <- normalizePath(getwd())

  # Create subfolders
  for (subdir in c("data", "plots", "scripts", "fonts")) {
    sub_path <- file.path(base_dir, subdir)
    if (!dir.exists(sub_path)) {
      dir.create(sub_path, recursive = TRUE, showWarnings = FALSE)
      message("Created folder: ", subdir)
    } else {
      message("Skipped folder (already exists): ", subdir)
    }
  }

  # Load and write script.R only if it doesn't already exist
  script_path <- file.path(base_dir, "scripts", "script.R")
  if (!file.exists(script_path)) {
    r_path <- system.file("mytemplate.R", package = "mytemplate")
    r_txt <- readLines(r_path)
    writeLines(r_txt, con = script_path)
    message("Created scripts/script.R")
  } else {
    message("Skipped scripts/script.R (already exists)")
  }

  # Copy fonts only if fonts directory doesn't already contain files
  fonts_src <- system.file("fonts", package = "mytemplate")
  font_files <- list.files(fonts_src, full.names = TRUE)
  fonts_dest <- file.path(base_dir, "fonts")

  if (length(list.files(fonts_dest)) == 0 && length(font_files) > 0) {
    file.copy(font_files, fonts_dest, overwrite = FALSE)

    message("Copied fonts to fonts/")
  } else {
    message("Skipped copying fonts (folder not empty or no fonts found)")
  }

  # Optional: write README.md with placeholders
  readme_path <- file.path(base_dir, "README.md")
  if (readme) {
    if (!file.exists(readme_path)) {
      readme_template <- system.file("readme-template.md", package = "mytemplate")
      readme_txt <- readLines(readme_template)
      readme_txt <- gsub("date_input", date_input, readme_txt)
      writeLines(readme_txt, con = readme_path)
      message("Created README.md")
    } else {
      message("Skipped README.md (already exists)")
    }
  }

  message("Project initialized safely in: ", base_dir)
}


