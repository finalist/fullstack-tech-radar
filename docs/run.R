library(getopt)

spec <- rbind(c("solution", "s", 1, "character"),
              c("wiki",     "w", 0, "logical"),
              c("help",     "h", 0, "logical"),
              c("clean",    "c", 0, "logical"))

opt <- getopt(spec)

if ( !is.null(opt$help) ) {
    cat(getopt(spec, usage=T))
    q(status=1)
}

if ( !is.null(opt$clean) ) {
    fn <- "confluence.html"
    if ( file.exists(fn) ) {
        file.remove(fn)
    }
    q(status=1)
}

if ( !is.null(opt$solution) ) {
    rmarkdown::render('default.Rmd',
                      'html_document',
                      params=list(opt$solution))
}

if ( !is.null(opt$wiki) ) {
    rmarkdown::render("confluence.Rmd", 'html_fragment')
    source("confluence.R")
    upload_html()
}
