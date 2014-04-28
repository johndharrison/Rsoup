#' CLASS Connection
#'
#' A Connection provides a convenient interface to fetch content from the web, and parse them into Documents.
#'
#' To get a new Connection, use Jsoup$connect(String). Connections contain Connection.Request and Connection.Response objects. The request objects are reusable as prototype requests.
#' Request configuration can be made using either the shortcut methods in Connection (e.g. userAgent(String)), or by methods in the Connection.Request object directly. All request configuration must be made before the request is executed. 
#'
#' @section Fields:
#' \describe{
#' \item{\code{connection}:}{Object of class \code{"jobjRef"}}
#' }
#'
#' @section Methods:
#' \describe{
#' \item{\code{new(...)}:}{ Create a new \code{Connection} object. ... is used to define the appropriate slots.}
#' \item{\code{connect(url)}:}{ Creates a new \code{\link{Connection}} to a URL. Use to fetch and parse a HTML page. To the connection you can add data, cookies, and headers; set the user-agent, referrer, method; and then execute. 
#' \describe{
#' \item{\code{url: }}{URL to connect to. The protocol must be http or https.}
#' }
#' }
#' \item{\code{parse(html, baseUri)}:}{ Parse HTML into a Document. The parser will make a sensible, balanced document tree out of any HTML.
#' \describe{
#' \item{\code{html: }}{A character string. HTML to parse}
#' \item{\code{baseUri: }}{A boolean. The URL where the HTML was retrieved from. Used to resolve relative URLs to absolute URLs, that occur before the HTML declares a <base href> tag. If NA is specified, absolute URL detection relies on the HTML including a <base href> tag.}
#' }
#' }
#' }
#' 
#' @include Jsoup.R
#' @export Connection
#' @exportClass Connection
#' @aliases Connection
 
Connection <- setRefClass("Connection",
                          fields = list(
                            url = "character",
                            connection = "jobjRef"
                          ),
                          
                          contains = "Jsoup",
                          
                          methods = list(
                            initialize = function(url, ...){
                              url <<- url
                              callSuper(...)
                              connection <<- jsoup$connect(url)
                            }
                          )
)