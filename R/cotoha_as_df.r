#' Reshape response into data.frame
#'
#' @param response API response by `execute_cotoha_analysis` (json)
#'
#' @importFrom httr content
#' @importFrom dplyr bind_rows
#'
#' @return Analysis result (data.frame)
#'
#' @export
#'
cotoha_as_df <- function(response = response) {
    response.content <- httr::content(response)
    response.result <- response.content[["result"]]
    result.df <- dplyr::bind_rows(response.result)
    return(result.df)
}