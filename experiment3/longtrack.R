setwd("~/git/craproads/experiment3/")

d <- read.csv("raw/2013-11-13_08-51-23.csv",header=T)
d$rider <- "Hannes"
d$bike <- "hannes"
d$exp <- "Hannes-ToWork"
d$obs <- 1:nrow(d)
dall <- d
dall$acc <- sqrt(dall$accelerationX^2 + dall$accelerationY^2 + dall$accelerationZ^2)

library(ggplot2)
library(ggthemes)
pdf("accelerationplot.pdf",width=10,height=7)
print(ggplot(dall,aes(x=obs,y=acc)) + facet_grid(exp~.)+ geom_line() + theme_few() + xlab("Time") + ylab("Acceleration"))
dev.off()

# library(ggmap)
# map <- get_map(location=c(4.91,52.365,4.95,52.379), source="osm",zoom=16)
# pdf("map.pdf")
# ggplot() + geom_path(aes(x=long, y=lat, color=acc), data=dall,size=2) + xlab("Longitude") + ylab("Latitude") + labs(color='Acceleration') + 
#   scale_colour_gradient(low="green",high="red")
# dev.off()

library(rgdal)
roads.amsterdam <- readOGR(".", "roads-amsterdam")
pdf("map.pdf")
plot(roads.amsterdam,xlim=c(4.91,4.95),ylim=c(52.374,52.3749),col="lightgray")
colfunc <- colorRampPalette(c("green", "red"))
gradcols <- colfunc(100)
dall$accscaled <- dall$acc/max(dall$acc)
dall$col <- gradcols[round(dall$accscaled*length(gradcols))]
s <- seq(length(dall$acc)-1)
segments(dall$long[s], dall$lat[s], dall$long[s+1], dall$lat[s+1], col=dall$col,lwd=dall$accscaled*10)
dev.off()

# install.packages("rgdal",configure.args='--with-gdal-config=/export/scratch1/hannes/fakefs/bin/gdal-config --with-proj-share=/export/scratch1/hannes/fakefs/share/proj')
# ogr2ogr -clipsrc 4.82 52.42 4.98 52.32 roads-amsterdam.shp roads.shp         
# http://www.mapcruzin.com/free-netherlands-arcgis-maps-shapefiles.htm
# ogr2ogr -clipsrc 4.82 52.32 4.98 52.38 roads-amsterdam.shp roads.shp       
# http://www.nceas.ucsb.edu/scicomp/usecases/ReadWriteESRIShapeFiles
# http://download.geofabrik.de/europe/netherlands.html