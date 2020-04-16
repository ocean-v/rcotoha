#' Write configulation files for COTOHA API
#'
#' @param clientId Your client ID (character)
#' @param clientSecret Your client secret (character)
#' @param tokenURL Your access token publish url (character)
#' @param baseURL Your api base url (character)
#'
#' @return ("config.json" & "endpoint.json" will be made on the current working directory.)
#'
#' @importFrom jsonlite write_json
#'
#' @export
#'
make_cotoha_config <- function (clientId, clientSecret, tokenURL, baseURL) {
    # write "config.json"
    config <- list(grantType = "client_credentials", clientId = clientId, clientSecret = clientSecret)
    jsonlite::write_json(config, path = "config.json", auto_unbox = TRUE)
    # write "endpoint.json"
    endpoint <- list(Access_Token_Publish_URL = tokenURL, API_Base_URL = baseURL)
    jsonlite::write_json(endpoint, path = "endpoint.json", auto_unbox = TRUE)
}