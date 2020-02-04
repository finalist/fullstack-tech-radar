library(rmarkdown)

render <- function(s)
{
    rmarkdown::render('index.Rmd',
                      'html_document',
                      params=list(solution=s))
    system("open index.html")
}
