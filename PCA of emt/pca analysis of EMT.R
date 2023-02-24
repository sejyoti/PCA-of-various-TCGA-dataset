setwd("C:/Users/KIIT/Desktop/Dissertation")

getwd()

# Principal Component Analysis
# we will use 'ggbiprot' package
# Install ggbiplot prior to using this script
# Better to have the latest R version. # First install 'devtools' from R repository using
#Environment is empty Plots

library(devtools)

install.packages("devtools")

install_github ("vqv/ggbiplot")

#the default method.
# To install ggbiplot from the github

setwd("C/Users/KIIT/Desktop/Dissertation")

library(ggbiplot)

ge.data <- read.csv ("E_M score in various tumor type.csv")

#We need to reduce the dimention from 3d to wd to visualiza the data in 2D

d <- ge.data [ ,1:3]

#to perform PCA

#use prcomp() function

d.pca <-prcomp (d, centre = TRUE ,scale = TRUE)

summary (d.pca)

#Importance of components:
#PC1    PC2    PC3
#Standard deviation     1.2686 1.0030 0.6202
#Proportion of Variance 0.5364 0.3353 0.1282
#Cumulative Proportion  0.5364 0.8718 1.0000


#Loading matrix and scoring matrix 

d.load <- d.pca$rotation

#the scoring matrix (projection of pca)

d.score <- d.pca$x

#loading pc1 and pc2 data
#plot projection of data on pc1 and pc2 data in ggbiplot

library(ggbiplot)

p1 <- ggbiplot (d.pca , choices = c (1,2), obs.scale = 1,
                var.scale = 1 , labels = ge.data [ ,2])

print (p1)


#color code for groups

#rescale the plot

p1 <- p1 + xlim(-2,2) + ylim(-2,2)

print (p1)

p2<- ggbiplot(d.pca)

p2  <- ggbiplot(d.pca, choices= c(1,2), obs.scale 1, var.scale =1,
              labels = ge.data [ ,2], groups = ge.data [ , 1],
              var.axes = FALSE)


print(p2)
