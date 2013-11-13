library(ggplot2)
library(ggthemes)

dall <- read.csv("all.csv")
pdf("accelerationplot.pdf",width=10,height=7)
print(ggplot(dall,aes(x=obs,y=acc)) + facet_grid(exp~.)+ geom_line() + theme_few() + xlab("Time") + ylab("Acceleration"))
dev.off()

