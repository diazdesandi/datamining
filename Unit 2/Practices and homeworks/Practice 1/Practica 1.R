#import CSV-salary
dataset <- read.csv(file.choose())

#library to used
library(caTools)
?caTools()
#split of "dataset" that we'll use
set.seed(123)
split <- sample.split(dataset$salary, SplitRatio = 2/3)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

# Fitting Simple Linear Regression to the Training set
regressor = lm(formula = salary ~ yrs.service,
               data = dataset)
summary(regressor)

# Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)

# Visualizing the Training set results
library(ggplot2)
ggplot() +
  geom_point(aes(x=training_set$yrs.service, y=training_set$salary),
             color = 'red') +
  geom_line(aes(x = training_set$yrs.service, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('Salary vs years of experience (Training Set)') +
  xlab('Years of experience') +
  ylab('Salary')

# Visualizing the Test set results
ggplot() +
  geom_point(aes(x=test_set$yrs.service, y=test_set$salary),
             color = 'red') +
  geom_line(aes(x = training_set$yrs.service, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('Salary vs Years of experience (Test Set)') +
  xlab('Years of experience') +
  ylab('Salary')
