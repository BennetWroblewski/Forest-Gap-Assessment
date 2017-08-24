install.packages("tiff")
library("rgdal")      
library("tiff")
library("rgeos")
library("raster")
library("rasterVis")

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
levelplot(raster_test144_chm, par.settings = GrTheme, main = "Canopy Height Model")
raster_test144_chm

#canopy height distribution

oldpar <- par(mfrow=c(1,1))
par(mfrow=c(1,2))
hist(raster_test144_chm, main = "Canopy Height Distribution", plot = TRUE)

#removing negative values 
raster_test144_chm[raster_test144_chm<0] = 0
raster_test144_chm
#save as image:
levelplot(raster_test144_chm, par.settings = GrTheme, main = "Canopy Height Model")

#reclassify in forest/ non forest

chm_reclassified <- raster_test144_chm
chm_reclassified[chm_reclassified <= 2] = 0
chm_reclassified[chm_reclassified > 2] = 1
plot(chm_reclassified)
levelplot(chm_reclassified, par.settings = RdBuTheme)

