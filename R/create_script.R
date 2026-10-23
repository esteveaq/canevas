#' Create a function to create a script from the mytemplate file
#' @export
create_script <- function() {
  script_path <- file.path(getwd(), "script.R")
  if (!file.exists(script_path)) {
    r_path <- system.file("script_template.R", package = "mytemplate")
    r_txt <- readLines(r_path)
    writeLines(r_txt, con = script_path)
    message("Created script.R")
  } else {
    message("Skipped script.R (already exists)")
  }
}
