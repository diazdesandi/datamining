# Package for Naive Bayes
library('e1071')
library('caret')
library('ggplot2')
library('lattice')
# CSV import
socialnetwork <- read.csv(file.choose())

set.seed(2018)
t.ids <- createDataPartition(socialnetwork$Purchased, p = 0.67, list = F)

model <- naiveBayes(Purchased ~., data = socialnetwork[t.ids,])
model

#Prediction

pred <- predict(model, socialnetwork[-t.ids,])
tab <- table(socialnetwork[-t.ids,]$Purchased, pred, dnn = c("Actual","Predicha"))