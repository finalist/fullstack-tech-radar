library(rmarkdown)
library(readr)
library(httr)
library(yaml)
library(rjson)

cfg <- read_yaml("radar.yml")

authn <- authenticate(cfg$confluence$username,
                      cfg$confluence$password)

render_html <- function()
{
    fname <- "confluence.Rmd"
    rmarkdown::render(fname, 'html_fragment')
    system("open confluence.html")
}

quadrant <- function(x)
{
    ifelse(x == 0, "languages-and-frameworks",
    ifelse(x == 1, "platforms",
    ifelse(x == 2, "techniques",
    ifelse(x == 3, "tools",
                   ""))))
}

ring <- function(x)
{
    ifelse(x == 0, "Adopt",
    ifelse(x == 1, "Trial",
    ifelse(x == 2, "Assess",
    ifelse(x == 3, "Hold",
           ""))))
}

tw_link <- function(q, k)
{
    if ( is.numeric(q) & is.character(k) ) {
        paste0("[", k, "]",
               "(https://www.thoughtworks.com/radar/",
               quadrant(q), "/", k, ")")
    } else {
        k
    }
}

load <- function()
{
    d <- read.table("tech.csv", sep=",", header=T, stringsAsFactors=F)
    d$Product <- paste0("[", d$label, "](", d$link, ")")
    d$ThoughtworksKey <- tw_link(d$quadrant, d$tw_key)
    d$Ring <- ring(d$ring)
    d[order(d$Product),
      c("Product", "ThoughtworksKey", "Ring", "Categorie")]
}

find_page <- function(space_key="AI",
                      page_title="Fullstack Tech Radar")
{
    page_url <- URLencode(sprintf("https://wiki.finalist.com/rest/api/content?title=%s&spaceKey=%s", page_title, space_key))
    json <- content(GET(url=page_url))

    if ( json$statusCode == "404" ) {
        json$message
    } else {
        json$results[[1]]$id
    }        
}

upload_html <- function()
{
    page_url <- paste0(
        "https://wiki.finalist.com/rest/api/content/",
        cfg$confluence$page$id)

    json <- content(GET(url=page_url, authn))

    tryCatch({
        val <- read_file("confluence.html")

        msg <- list(
            id=cfg$confluence$page$id,
            type="page",
            title="Fullstack Tech Radar",
            space=list(key="AI"),
            body=list(storage=list(value=val,
                                   representation="storage")),
            version=list(number=json$version$number+1))
        
        json <- rjson::toJSON(msg)

        PUT(url=page_url,
            body=json,
            content_type_json(),
            authn)
        
    }, error = function(e) {
        e
    })    
}
