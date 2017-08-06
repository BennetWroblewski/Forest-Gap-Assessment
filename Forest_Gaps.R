install.packages("tiff")
library("rgdal")                 

test_144 <- readTIFF("test144.tif")
test_144_dtm <- readTIFF("test144_dtm_2nd_try.tif")

raster_test144 <- raster("test144.tif") 
raster_test144
raster_test144_dtm <- raster("test144_dtm_2nd_try.tif")
raster_test144_dtm

par(mfrow=c(1,2))
plot(raster_test144, main = "DSM")
plot(raster_test144_dtm, main = "DTM")

#create CHM by substracting DTM from DSM in qgis

raster_test144_chm <- raster("test144_chm.tif")
plot(raster_test144_chm, main = "Canopy Height Model")

#canopy height distribution

oldpar <- par(mfrow=c(1,1))
par(mfrow=c(1,2))
hist(raster_test144_chm, main = "Canopy Height Distribution", plot = TRUE)

#removing negative values 
raster_test144_chm[raster_test144_chm<0] = 0
raster_test144_chm
