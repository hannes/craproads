d <- read.csv("raw/2013-11-11_16-46-17.csv",header=T)
d$rider <- "Ana"
d$bike <- "small"
d$obs <- 1:nrow(d)
dall <- d

d <- read.csv("raw/2013-11-11_16-48-53.csv",header=T)
d$rider <- "Wouter"
d$bike <- "small"
d$obs <- 1:nrow(d)
dall <- rbind(dall,d)

d <- read.csv("raw/2013-11-11_16-50-53.csv",header=T)
d$rider <- "Robert"
d$bike <- "big"
d$obs <- 1:nrow(d)
dall <- rbind(dall,d)

d <- read.csv("raw/2013-11-11_16-54-58.csv",header=T)
d$rider <- "Kaifeng"
d$bike <- "big"
d$obs <- 1:nrow(d)
dall <- rbind(dall,d)

d <- read.csv("raw/2013-11-11_16-56-54.csv",header=T)
d$rider <- "Wouter"
d$bike <- "big"
d$obs <- 1:nrow(d)
dall <- rbind(dall,d)

dall$rider <- factor(dall$rider)
dall$bike <- factor(dall$bike)
dall$acc <- sqrt(dall$accelerationX^2 + dall$accelerationY^2 + dall$accelerationZ^2)
dall$exp <- interaction(dall$rider, dall$bike)

write.csv(dall,"~/Desktop/rws/all.csv",row.names=F)

