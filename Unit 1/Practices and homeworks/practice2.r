# csv read
vivienda <- read.csv("C:/Users/rjds_/Downloads/TRVIVIENDA02.csv", header=FALSE)
# Functions to get or set the names of an object.
names(vivienda)
# Returns the first or last parts of a vector, matrix, table, data frame or function.
head(vivienda)
# Categorical variables (factors) stored in R
levels(vivienda$V5)
# Number of rows
nrow(vivienda)
# Number of columns
ncol(vivienda)
# Sort a vector or factor into ascending or descending order. 
sort(vivienda$V5)
# Gets or sets the length of a vector (list) or other objects
length(vivienda$V5)
# Return the position of the elements in a logical vector which are TRUE
which(vivienda$V5=='Tijuana')
length(which(vivenda$V5=='Mexicali'))
# Uses  the cross-classifying factors to build a contingency table of the counts at each combination of factor levels.
table(vivenda$V5)
# Calculate proportions over the entire table.
prop.table(table(vivenda$V5))

#cat convert the values into character values then combine those values and pint them
cat('one',2,'three',4,'five')
#paste accept an unlimited number of scalars and join them together.
paste('X',1:5,sep='')
#unique eliminates duplicate elements/rows from a vector.
x<-c(1:10,5:15)
unique(x)
#Sample function in R, generates a sample of the specified size from the data set or elements, either with or without replacement.
sample(1:20, 10, replace=TRUE)
#rnorm create randoms values
rnorm(5)
#substring can be used to extract parts of character strings, or to change the values of parts of character strings.
substring("HumptyDumpty sat on a wall",5,9)
#table performs categorical tabulation of data with the variable and its frequency.
table(iris$Species)
#strsplit is used to split string into substrings with the specific delimiter.
mysentence<- "wow mineria de datos"
strsplit(mysentence," ")
#union perfmorms union of two or more vectors or dataframe
x <- c(1:4)
y <- c(2:7)
union(x,y)