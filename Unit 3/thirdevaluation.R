# Clean Workspace or Ctrl + Shift + F10
rm(list = ls())

# Package for Naive Bayes
library('e1071')
library('ggplot2') #necessary for caret
library('lattice')  #necessary for caret
library('caTools')

# CSV import
socialnetwork <- read.csv("C:/Users/rjds_/Desktop/Social_Network_Ads.csv")

# Seed
set.seed(4)

# We don't need all the data
socialnwrk <- socialnetwork[3:5]

# Purchased column as factor
socialnwrk$Purchased = factor(socialnwrk$Purchased, levels = c(0,1))

# Remove csv
rm(socialnetwork)

# Check all True
#complete.cases(socialnwrk)

# Data split
split = sample.split(socialnwrk$Purchased, SplitRatio = 0.7)

# Training Data
traindata = subset(socialnwrk, split == TRUE)
testdata = subset(socialnwrk, split == FALSE)

# Remove split
rm(split)

# Scaling
traindata[-2] = scale(traindata[-2])
testdata[-2] = scale(testdata[-2])

# Naive Bayes Model
nbmodel <- naiveBayes(Purchased ~ Age, data = socialnwrk)

# Check
nbmodel

# Prediction
library('caret')
pred <- predict(nbmodel,testdata)

# Table 
tab <- table(testdata$Purchased, pred, dnn = c("Actual", "Predicha"))

# Final Matrix
confusionMatrix(tab)

# Visualizing the Training set results
library(ElemStatLearn)
set = traindata
X1 = seq(min(set[, 1]) - 0.5, max(set[, 1]) + 0.5)
X2 = seq(min(set[, 2]) - 0.5, max(set[, 2]) + 0.5)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(nbmodel, newdata = grid_set,)
plot(set[, -2],
     main = 'Naive Bayes (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

# Visualizing the Test set results
library(ElemStatLearn)
set = testdata
X1 = seq(min(set[, 1]) - 0.5, max(set[, 1]) + 0.5)
X2 = seq(min(set[, 2]) - 0.5, max(set[, 2]) + 0.5)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(nbmodel, newdata = grid_set)
plot(set[, -3],
     main = 'Naive Bayes (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
