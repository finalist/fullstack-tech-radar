library(rmarkdown)
rmarkdown::render('index.Rmd', 'html_document')
system("open index.html")
