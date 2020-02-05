
args = commandArgs(trailingOnly=T)

if ( ! is.na(args[1]) ) {
    rmarkdown::render('default.Rmd',
                      'html_document',
                      params=list(solution=args[2]))
} else {
    print("Error: run.R expects solution argument")
}
