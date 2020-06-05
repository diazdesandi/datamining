# Practice 6
The purpose of this practice is to apply decision tree to a different dataset
CSV from https://www.kaggle.com/ronitf/heart-disease-uci
```r
#Libraries
# Importing the dataset
dataset = read.csv('C:/Users/rjds_/Desktop/Data Mining/Unit 2/Practices and homeworks/Practice 5/heart.csv')

# Encoding the target feature as factor

heart <- dataset[,c(1,5,14)]
drop(dataset)

heart <- heart[1:3]

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(60)
split = sample.split(heart$target, SplitRatio = 0.71)
training_set = subset(heart, split == TRUE)
test_set = subset(heart, split == FALSE)

# Fitting Decision Tree Classification to the Training set
install.packages('rpart')
library(rpart)
classifier = rpart(formula = target ~ ., data = training_set)

# Predicting the Test set results
y_pred = predict(classifier, newdata = test_set)
y_pred

# Making the Confusion Matrix
cm = table(test_set[, 3], y_pred)
cm

# Visualising the Training set results
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('�..age', 'chol')
y_grid = predict(classifier, newdata = grid_set, type = 'class')
plot(set[, -3],
     main = 'Decision Tree Classification (Training set)',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

# Visualising the Test set results
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('�..age', 'chol')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3], main = 'Decision Tree Classification (Test set)',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

# Plotting the tree
plot(classifier)
text(classifier, cex=0.6)
```