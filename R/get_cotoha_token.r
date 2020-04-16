#' Get access token for COTOHA API
#'
#' @param config Your config file (json)
#' @param endpoint Your endpoint file (json)
#'
#' @importFrom jsonlite read_json
#' @importFrom httr POST
#' @importFrom httr verbose
#'
#' @return Access token (character)
#'
#' @export
#'
get_cotoha_token <- function (config = "config.json", endpoint = "endpoint.json") {
    # get config
    config <- jsonlite::read_json(config)
    # get url
    endpoint <- jsonlite::read_json(endpoint)
    url.token <- endpoint$Access_Token_Publish_URL
    # get token
    token <- httr::POST(url.token, body = config, encode = "json", content_type = "application/json", httr::verbose())
    content.token <- content(token)
    access_token <-  content.token[["access_token"]]
    return(access_token)
}