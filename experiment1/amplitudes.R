dall <- read.csv("all.csv")
str(dall)
dall$diffmean <- dall$acc <- mean(dall$acc)
plot(dall$diffmean)