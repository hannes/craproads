# d <- read.csv("raw/2013-11-12_15-07-30.csv",header=T)
# d$rider <- "Hannes"
# d$bike <- "big"
# d$exp <- "Hannes-Test"
# d$obs <- 1:nrow(d)
# dall <- d

d <- read.csv("raw/2013-11-12_15-19-14.csv",header=T)
d$rider <- "Hannes"
d$bike <- "big"
d$exp <- "Hannes-NormalNoBump"
d$obs <- 1:nrow(d)
dall <- d

# d <- read.csv("raw/2013-11-12_15-11-57.csv",header=T)
# d$rider <- "Hannes"
# d$bike <- "big"
# d$exp <- "Hannes-Grass"
# d$obs <- 1:nrow(d)
# dall <- rbind(dall,d)

d <- read.csv("raw/2013-11-12_15-13-05.csv",header=T)
d$rider <- "Hannes"
d$bike <- "big"
d$exp <- "Hannes-NormalRun"
d$obs <- 1:nrow(d)
dall <- rbind(dall,d)

d <- read.csv("raw/2013-11-12_15-14-23.csv",header=T)
d$rider <- "Hannes"
d$bike <- "big"
d$exp <- "Hannes-Wiggly"
d$obs <- 1:nrow(d)
dall <- rbind(dall,d)

d <- read.csv("raw/2013-11-12_15-15-30.csv",header=T)
d$rider <- "Hannes"
d$bike <- "big"
d$exp <- "Hannes-StopAndGo"
d$obs <- 1:nrow(d)
dall <- rbind(dall,d)

d <- read.csv("raw/2013-11-12_15-18-00.csv",header=T)
d$rider <- "Wouter"
d$bike <- "big"
d$exp <- "Wouter-Coat-NormalRun"
d$obs <- 1:nrow(d)
dall <- rbind(dall,d)

d <- read.csv("raw/2013-11-12_15-19-14.csv",header=T)
d$rider <- "Wouter"
d$bike <- "big"
d$exp <- "Wouter-Coat-Grass"
d$obs <- 1:nrow(d)
dall <- rbind(dall,d)

d <- read.csv("raw/2013-11-12_15-20-32.csv",header=T)
d$rider <- "Wouter"
d$bike <- "big"
d$exp <- "Wouter-Coat-SidewalkBumps"
d$obs <- 1:nrow(d)
dall <- rbind(dall,d)


dall$rider <- factor(dall$rider)
dall$bike <- factor(dall$bike)
dall$acc <- sqrt(dall$accelerationX^2 + dall$accelerationY^2 + dall$accelerationZ^2)
#dall$acc <- abs(dall$accelerationX) + abs(dall$accelerationY) + abs(dall$accelerationZ)

#dall$exp <- factor(dall$exp)

write.csv(dall,"all.csv",row.names=F)

