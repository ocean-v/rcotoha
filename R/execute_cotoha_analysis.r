#' Execute COTOHA analysis
#'
#' @param access_token Access token gotten by `get_cotoha_token` (character)
#' @param API API name (character): "parse", "ne", "coreference", "keyword", "similarity", "sentence_type", "user_attribute", "sentiment". See https://api.ce-cotoha.com/contents/reference/apireference.html.
#' @param sentence For "parse", "ne", "sentence_type", "sentiment" (character)
#' @param document For "coreference", "keyword", "user_attribute" (character)
#' @param s1 For "similarity" (character)
#' @param s2 For "similarity" (character)
#' @param optional Additional argument for each API (list). See https://api.ce-cotoha.com/contents/reference/apireference.html.
#'
#' @return HTTP response (json)
#'
#' @importFrom jsonlite read_json
#' @importFrom httr POST
#' @importFrom httr add_headers
#' @importFrom httr verbose
#'
#' @export
#'
execute_cotoha_analysis <- function(access_token = "", API = "", sentence = "", document = "", s1 = "", s2 = "", optional = list()) {
    body.tmp <- c(list(sentence = sentence, document = document, s1 = s1, s2 = s2), optional)
    body <- body.tmp[which(body.tmp != "")]

    endpoint <- jsonlite::read_json("endpoint.json")
    url.base <- endpoint$API_Base_URL
    url <- paste0(url.base, "nlp/v1/", API)

    response <- httr::POST(url, body = body, encode = "json", content_type = "application/json;charset=UTF-8", httr::add_headers(Authorization = paste("Bearer", access_token)), httr::verbose())
    return(response)
}