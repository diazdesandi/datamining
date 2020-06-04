# Green House Gases Mexico By Sectors (1990-2010)

gases <- read.csv("C:/Users/rjds_/Desktop/GHG-Mexico-1990-2010.csv")

gases$Sector = factor(gases$Sector,
                      levels = c('Energy','Industrial processes','Agricuture','Silviculture','Waste management'),
                      labels = c(1,2,3,4,5))

gases$GHG = factor(gases$GHG,
                      levels = c('CO2','CH4','N20'),
                      labels = c(1,2,3))

#Dataset split using caTools
library(caTools)

set.seed(100)

#Subsector removed
gasesfilter <- gases[,c(1,2,3,5)]

splitdata <- sample(2,nrow(gasesfilter), replace = TRUE, prob = c(0.72,0.18))

# Training data
trainData<- gasesfilter[splitdata==1,]

#Testing data
testData<- gasesfilter[splitdata==2,]

# Regressor for Multiple Linear Regression
regressor = lm(formula = Amount ~ .,
               data = trainData )

summary(regressor)

#Prediction testData
y_pred = predict(regressor, newdata = testData)
y_pred


# Building the optimal model using Backward Elimination
regressor = lm(formula = Year + GHG + Sector + Amount, data = gasesfilter )
summary(regressor)

regressor = lm(formula = Year + GHG + Sector, data = gasesfilter )
summary(regressor)

regressor = lm(formula = Year + GHG, data = gasesfilter )
summary(regressor)

y_pred = predict(regressor, newdata = testData)
y_pred


backwardElimination <- function(x, sl) {
  numVars = length(x)
  for (i in c(1:numVars)){
    regressor = lm(formula = Profit ~ ., data = x)
    maxVar = max(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"])
    if (maxVar > sl){
      j = which(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"] == maxVar)
      x = x[, -j]
    }
    numVars = numVars - 1
  }
  return(summary(regressor))
}

#SL = 0.05
#trainData
#backwardElimination(trainData, SL)
