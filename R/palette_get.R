
#' Get a client's color palette
#'
#' @param client Client name
#'
#' @return A named character vector of colors
#' @export
palette_get <- function(client) {

  # Find config file in user's home directory
  config_file <- path.expand("~/.config/r-config/config_colors.json")

  # Read config
  config <- jsonlite::read_json(config_file, simplifyVector = TRUE)

  # Check client exists
  if (!client %in% names(config$clients)) {
    stop("Unknown client: ", client)
  }

  # Return client's colors
  config$clients[[client]]$colors
}



#' Apply a client's colors to ggplot2 colour
#'
#' @param client Client name
#' @param ... Additional arguments passed to [ggplot2::scale_color_manual()]
#'
#' @export
scale_color_client <- function(client, ...) {
  ggplot2::scale_color_manual(
    values = palette_get(client),
    ...
  )
}



#' Apply a client's colors to ggplot2 fill
#'
#' @param client Client name
#' @param ... Additional arguments passed to [ggplot2::scale_fill_manual()]
#'
#' @export
scale_fill_client <- function(client, ...) {
  ggplot2::scale_fill_manual(
    values = palette_get(client),
    ...
  )
}
