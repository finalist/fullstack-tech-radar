# install.packages("googlesheets4")
library(googlesheets4)
library(googledrive)

recode_quadrant <- function(s)
{
    ifelse(s == "Languages & Frameworks", 0,
    ifelse(s == "Platforms", 1,
    ifelse(s == "Techniques", 2,
    ifelse(s == "Tools", 3, -1))))
}

recode_ring <- function(s)
{
    ifelse(s == "Adopt", 0,
    ifelse(s == "Trial", 1,
    ifelse(s == "Assess", 2,
    ifelse(s == "Hold", 3, -1))))
}

load_googlesheet <- function(sheet="Fullstack")
{
    doc <- drive_get("Finalist Technology Radars")
    ss <- sheets_get(doc)
    s <- read_sheet(ss$spreadsheet_id, sheet)
    s$quadrant <- recode_quadrant(s$quadrant)
    s$ring <- recode_ring(s$ring)
    s
}

load_csv <- function(fname="tech.csv")
{
    read.table(fname, sep=",", header=T, stringsAsFactors=F)
}
