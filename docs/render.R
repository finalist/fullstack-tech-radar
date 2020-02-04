library(rmarkdown)

render <- function(s="Fullstack")
{
    rmarkdown::render('default.Rmd',
                      'html_document',
                      params=list(solution=s))
    fname <- sprintf("%s.html", tolower(s))
    system(sprintf("mv default.html %s", fname))
    system(sprintf("open %s", fname))
}
