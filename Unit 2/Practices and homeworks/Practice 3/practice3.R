# BackwardElimination is assigned to function with parameters (x, sl)
# A function is a set of instructions
# x = data to analyze (dataset)
# sl = significance level for x or (x,y)
backwardElimination <- function(x, sl) {
    # length of the dataset (size)
    # numVars = dataset size
    numVars = length(x)
    # Loop For for iterate in the dataset
    for (i in c(1:numVars)){
        # Regressor: independent variable for predict some outcome
        # In this case, it's the regressor for x (dataset to analyze)
        regressor = lm(formula = Profit ~ ., data = x)
        # Highest coefficent(s) of the regressor
        maxVar = max(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"])
        # If statement for when maxVar its greater than sl
        if (maxVar > sl){
            # Same instruction as line 14 only assigned to variable j
            j = which(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"] == maxVar)
            x = x[, -j]
        }
        numVars = numVars - 1
    }
    # Returns a short description of the regressor
    return(summary(regressor))
}

SL = 0.05
#dataset = dataset[, c(1,2,3,4,5)]
training_set
# Dataset and SL sent to the function BackwardElimination, where training_set = x, and SL = sl
backwardElimination(training_set, SL)