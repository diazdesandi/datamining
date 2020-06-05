# Practice 2
The objective of this practice is to apply the multiple regression model
CSV from https://www.kaggle.com/ireneeliu/green-house-gases-mexico-by-sectors-19902010

```r
# Green House Gases Mexico By Sectors (1990-2010)
gases <- read.csv("C:/Users/rjds_/Desktop/Data Mining/Unit 2/Practices and homeworks/Practice 2/GHG-Mexico-1990-2010.csv")

# We assign a number to each sector
gases$Sector = factor(gases$Sector,
                      levels = c('Energy','Industrial processes','Agricuture','Silviculture','Waste management'),
                      labels = c(1,2,3,4,5))

# We assign a number to each GHG
gases$GHG = factor(gases$GHG,
                      levels = c('CO2','CH4','N20'),
                      labels = c(1,2,3))

# Dataset split using caTools
library(caTools)
set.seed(100)

# Subsector removed
gasesfilter <- gases[,c(1,2,3,5)]

# Split
splitdata <- sample(2,nrow(gasesfilter), replace = TRUE, prob = c(0.72,0.18))

# Training data
trainData<- gasesfilter[splitdata==1,]

# Testing data
testData<- gasesfilter[splitdata==2,]

# Regressor for Multiple Linear Regression
regressor = lm(formula = Amount ~ .,
               data = trainData )

# Check
summary(regressor)

#Prediction testData
y_pred = predict(regressor, newdata = testData)
y_pred

# test predict
regressor = lm(formula = Amount ~ Sector + GHG)
y_pred = predict(regressor, newdata = testData)
y_pred
```