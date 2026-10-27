#' Get a Client's Color Palette
#'
#' Retrieve the named colors configured for a client.
#'
#' @param client Character string identifying the client.
#'
#' @details
#' Colors are stored in a JSON configuration file at
#' `~/.config/r-config/config_colors.json`.
#' The file contains a `clients` object, with each client
#' defining a named set of colors. See the package README for instructions on creating
#' the configuration file.
#'
#' @return A named character vector of colors.
#'
#'
#' @examples
#' \dontrun{
#' colors <- palette_get("client_a")
#' print(colors)
#' }
#'
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


#' Apply a Client's Colors to ggplot2
#'
#' Apply a client's color palette to the color aesthetic in a ggplot2 plot.
#'
#' @param client Character string identifying the client.
#' @param ... Additional arguments passed to
#'   [ggplot2::scale_color_manual()].
#'
#' @return A ggplot2 scale object.
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#'
#' ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) +
#'   geom_point() +
#'   scale_color_client("client_a")
#' }
#'
#' @export
scale_color_client <- function(client, ...) {
  ggplot2::scale_color_manual(
    values = palette_get(client),
    ...
  )
}


#' Apply a Client's Colors to ggplot2 Fill
#'
#' Apply a client's color palette to the fill aesthetic in a ggplot2 plot.
#'
#' @param client Character string identifying the client.
#' @param ... Additional arguments passed to
#'   [ggplot2::scale_fill_manual()].
#'
#' @return A ggplot2 scale object.
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#'
#' ggplot(iris, aes(x = Species, fill = Species)) +
#'   geom_bar() +
#'   scale_fill_client("client_a")
#' }
#'
#' @export
scale_fill_client <- function(client, ...) {
  ggplot2::scale_fill_manual(
    values = palette_get(client),
    ...
  )
}
