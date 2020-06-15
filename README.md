# Fourth evaluation
#Code

Clear workspace or Ctrl + Shift + F10
// We clean the WS to avoid errors in the data
```r
rm(list = ls())
```
// We import the libraries to use and be able to carry out the k-means
Libraries
```r
library(datasets)
library(caTools)
library(class)
library(NbClust)
library(ggplot2)
library(ggpubr)
```
// we place the seed to be able to reproduce any generated random value
```r
Seed
set.seed(44)
```
Dataset
// import the iris dataset that comes by default in Rstudio
```r
data(iris)
```
// We use summary to display all the information in the dataset
```r
#summary(iris)
```
Extract species
// We extract the dataset species that come in column 5 of the dataset
```r
testiris <- iris[,-c(5)]
```
Calling NbClust for chosing best mehtod
// We use the NBclust library to find the best amount of K to iterate, giving us the minimum and maximum.
```r
 data = dataset, dis = distance matrix, distance = type of distance formula we are going to use
 min.nc = minimum number of clusters, max.nc = maximum number of clusters, methods = methods we
NbClust(data = testiris, diss = NULL, distance = "euclidean", min.nc = 2, max.nc = 15, method = "kmeans")
```

View factor
// We are going to make a table to visualize the species of the iris data set
```r
table(iris$Species)
```

Split dataset
// We performed a division of the data at 75% in training and 25% in tests.
```r
split = sample.split(iris$Species, SplitRatio = 0.75)
```

Data for training
```r
traindata = subset(iris, split == TRUE)
```
Data for testing
```r
testdata = subset(iris, split == FALSE)
```
// At this point we can select the best number of K that it gave us when using the NBclust library, in this case the best K was 2 and 3 but prune the number of species that are 3 we decided to use 3.
```r
Fast change
x = 3
```
K-means model
// K-means model that uses the iris dataset with columns 3 and 4 with the number of clusters defined.
```r
kmodel = kmeans(iris[,c(3:4)],x)
iris$cluster2 <- as.factor(kmodel$cluster)
```
// graph the data to have a better visualization of the data.
```r
ggplot(iris, aes(Petal.Length, Petal.Width, color = iris$cluster2)) + geom_point() + ggtitle(" k =", x)
```

 
