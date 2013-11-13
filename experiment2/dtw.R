library(dtw)
d <- read.csv("all.csv")
d <- d[ d$exp=="Wouter-Coat-NormalRun" || d$exp=="Hannes-NormalNoBump",]

dref <- d[d$exp=="Hannes-NormalRun",]$acc

d <- rbind(d,read.csv("../experiment1/all.csv"))
d$exp <- factor(d$exp)

sumval <- NA
dtwalign <- function(x) {
  align <- dtw(dref,x$acc)  
  print(length(x$acc))
  if (is.na(sumval)) {
    sumval <- dref[align$index1]
  }
  sumval <<- sumval + x$acc[align$index2]
  NULL
}

by(d,d$exp,dtwalign)
str(sumval)

plot(sumval,type="l")

