# Support Vector Machine (SVM)
# CSV from https://www.kaggle.com/ronitf/heart-disease-uci?select=heart.csv

#Libraries
library('lattice')
library('caret')
#install.packages("remotes")
#library(remotes)
#install_github("cran/ElemStatLearn")
library(ElemStatLearn)


# Importing the dataset
dataset = read.csv('C:/Users/rjds_/Desktop/Data Mining/Unit 2/Practices and homeworks/Practice 5/heart.csv')

# Encoding the target feature as factor
dataset$target = factor(dataset$target, levels = c(0, 1))

colnames(dataset)[1]  <- "age"

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(55)
split = sample.split(dataset$target, SplitRatio = 0.70)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Fitting SVM to the Training set
library(e1071)
classifier = svm(formula = target ~ .,
                 data = training_set,
                 type = 'C-classification',
                 kernel = 'linear')
svm

# Predicting the Test set results
y_pred = predict(classifier, newdata = test_set)
y_pred

#print(paste(predict(classifier,newdata=test_set),test_set$target))


# Making the Confusion Matrix
cm <- table(test_set$target, y_pred, dnn = c("Actual", "Predicha"))
confusionMatrix(cm)

set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 13]) - 1, max(set[, 13]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
y_grid = predict(classifier, newdata = grid_set, type ='class')
plot(set[, -3], main = 'SVM (Test set)',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))