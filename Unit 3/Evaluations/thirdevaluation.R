# Package for Naive Bayes
library('e1071')
library('ggplot2')
library('lattice')
library('caret')

# CSV import
socialnetwork <- read.csv(file.choose())

# Seed
set.seed(4)


# We don't need the user id
socialnwrk <- socialnetwork[,c(2,3,4,5)]

# Check all True
# complete.cases(socialnwrk)

# Training and test data
ind <- sample(2,nrow(socialnwrk), replace = TRUE, prob = c(0.7,0.3))

# Training data
trainData<- socialnwrk[ind==1,]

#Testing data
testData<- socialnwrk[ind==2,]


# Naive Bayes Model
model <- naiveBayes(as.factor(Purchased)~., data = socialnwrk)

# Check
model

# Prediction 
pred <- predict(model,testdata)

# Table 
tab <- table(testdata$Purchased, pred, dnn = c("Actual", "Predicha"))

# Final Matrix
confusionMatrix(tab)
