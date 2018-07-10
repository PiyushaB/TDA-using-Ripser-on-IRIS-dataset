##Installing libraries

library(devtools)

library(Rcpp)

library(ripserr)

library(TDA)

##Read the data from a CSV text file d<- read.csv("C:/Users/Piyusha/Desktop/d.csv") ##Exclude categorical variable and convert it to matrix 
d<- subset(d, select= -species) 
dmat <- as.matrix(d)
View(dmat)

##Run Ripser

x<-ripserr::ripser(dmat)

x

ppt1 <-ripserDiag(x,4, 2, format= "point-cloud")

##plotting Barcode

TDA::plot.diagram(ppt1, barcode = TRUE)

##Comparing both the homologies:

comparison <- TDA::wasserstein(homology1, homology2, p = 1, dimension = 1)
band<- plot.diagram(ppt1, diagLim = NULL, dimension = NULL, col = NULL, rotated = FALSE, barcode = FALSE, band = 50, lab.line = 2.2,
                  colorBand = "yellow", colorBorder = NA, add = FALSE)
