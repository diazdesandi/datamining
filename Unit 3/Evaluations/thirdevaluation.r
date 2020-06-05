# Package for Naive Bayes
install.packages("remotes")
library(remotes)
install_github("cran/ElemStatLearn")
force=TRUE
library('e1071')
library('ggplot2')
library('lattice')
library('caret')

# CSV import
socialnetwork <- read.csv(file.choose())

# Seed
set.seed(4)


# We don't need the user id
socialnwrk <- socialnetwork[,c(3,4,5)]
rm(socialnetwork)

# Check all True
# complete.cases(socialnwrk)

# Training and test data
ind <- sample(2,nrow(socialnwrk), replace = TRUE, prob = c(0.6,0.4))

# Training data
trainData<- socialnwrk[ind==1,]

#Testing data
testData<- socialnwrk[ind==2,]


# Naive Bayes Model
model <- naiveBayes(as.factor(Purchased)~., data = socialnwrk)

# Check
model

# Prediction 
pred <- predict(model,testData)

# Table 
tab <- table(testData$Purchased, pred, dnn = c("Actual", "Predicha"))

# Final Matrix
confusionMatrix(tab)

# Visualizing the Training set results
library(ElemStatLearn)
set = trainData
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(model, newdata = grid_set)
plot(set[, -3],
     main = 'Naive Bayes (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

# Visualizing the Test set results
library(ElemStatLearn)
set = testData
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(model, newdata = grid_set)
plot(set[, -3],
     main = 'Naive Bayes (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

