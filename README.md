# Third evaluation
###Code
```r
//we import libraries to be able to use naive bayes and to be able to graph
the data
```r
library(&#39;e1071&#39;)
library(&#39;ggplot2&#39;) #necessary for caret
library(&#39;lattice&#39;) #necessary for caret
library(&#39;caTools&#39;)
```r
//import and read the csv Social_Network_Ads.csv
socialnetwork &lt;- read.csv(&quot;C:/Users/rjds_/Desktop/Social_Network_Ads.csv&quot;)
```
//we place the seed, it helps us to reproduce any result that is random
set.seed(4)
```r
//we only import columns 3,4,5 since we don't need all the csv information
to be able to perform the naive bayes, since the other columns are not numerical values ​​and
would produce a problem
socialnwrk &lt;- socialnetwork[3:5]
//We create the dataframe of the purchased column and they are values ​​only 0 and 1 indicating if
I buy or not
socialnwrk$Purchased = factor(socialnwrk$Purchased, levels = c(0,1))
//We removed the original csv to lighten the workspace
rm(socialnetwork)
# Check all True
#complete.cases(socialnwrk)
//We made a division of the dataframe, assigning 60% of the information will be data from
training and 40% will test them
split = sample.split(socialnwrk$Purchased, SplitRatio = 0.6)
# Training Data
traindata = subset(socialnwrk, split == TRUE)
testdata = subset(socialnwrk, split == FALSE)
//We remove the data division.
rm(split)
//we scale the data because otherwise it generates an error to use the generated data
around 200gb.
traindata[-3] = scale(traindata[-3])
testdata[-3] = scale(testdata[-3])
# Naive Bayes Model
//we proceed to perform the naive bayes algorithm with the dependent variables
nbmodel &lt;- naiveBayes(x = traindata[,-3], y = traindata$Purchased, SplitRatio = 0.60)

# Check
nbmodel
//Prediction with the caret library
library(&#39;caret&#39;)
pred &lt;- predict(nbmodel,testdata[,-3])
# Table
//with this table we predict the data
tab &lt;- table(testdata[,3], pred, dnn = c(&quot;Actual&quot;, &quot;Predicha&quot;))
# Final Matrix
//confusion matrix to review the level of pressure.
confusionMatrix(tab)
# Visualizing the Training set results
//Graphic visualization
library(ElemStatLearn)
set = traindata
X1 = seq(min(set[, 1]) - 0.5, max(set[, 1]) + 0.5, by = 0.01)
X2 = seq(min(set[, 2]) - 0.5, max(set[, 2]) + 0.5, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c(&#39;Age&#39;, &#39;EstimatedSalary&#39;)
y_grid = predict(nbmodel, newdata = grid_set,)
plot(set[, -3],
main = &#39;Naive Bayes (Training set)&#39;,
xlab = &#39;Age&#39;, ylab = &#39;Estimated Salary&#39;,
xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = &#39;.&#39;, col = ifelse(y_grid == 1, &#39;springgreen3&#39;, &#39;tomato&#39;))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, &#39;green4&#39;, &#39;red3&#39;))
# Visualizing the Test set results
library(ElemStatLearn)
set = testdata
X1 = seq(min(set[, 1]) - 0.5, max(set[, 1]) + 0.5, by = 0.01)
X2 = seq(min(set[, 2]) - 0.5, max(set[, 2]) + 0.5, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c(&#39;Age&#39;, &#39;EstimatedSalary&#39;)
y_grid = predict(nbmodel, newdata = grid_set)
plot(set[, -3],
main = &#39;Naive Bayes (Test set)&#39;,
xlab = &#39;Age&#39;, ylab = &#39;Estimated Salary&#39;,
xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = &#39;.&#39;, col = ifelse(y_grid == 1, &#39;springgreen3&#39;, &#39;tomato&#39;))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, &#39;green4&#39;, &#39;red3&#39;))
