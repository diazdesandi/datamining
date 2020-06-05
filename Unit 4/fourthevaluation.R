# Clear workspace or Ctrl + Shift + F10
rm(list = ls())

# Libraries
library(datasets)
library(caTools)
library(class)
library(NbClust)
library(ggplot2)
library(ggpubr)

# Seed
set.seed(44)

# Dataset
data(iris)
#summary(iris)

# Extract species
testiris <- iris[,-c(5)]

# Calling NbClust for chosing best mehtod
# data = dataset, dis = distance matrix, distance = type of distance formula we are going to use
# min.nc = minimum number of clusters, max.nc = maximum number of clusters, methods = methods we
NbClust(data = testiris, diss = NULL, distance = "euclidean", min.nc = 2, max.nc = 15, method = "kmeans")

# View factor
table(iris$Species)

# Split dataset
split = sample.split(iris$Species, SplitRatio = 0.75)

# Data for training
traindata = subset(iris, split == TRUE)

# Data for testing
testdata = subset(iris, split == FALSE)

# Fast change
x = 3

# K-means model
kmodel = kmeans(iris[,c(3:4)],x)
iris$cluster2 <- as.factor(kmodel$cluster)

ggplot(iris, aes(Petal.Length, Petal.Width, color = iris$cluster2)) + geom_point() + ggtitle(" k =", x)