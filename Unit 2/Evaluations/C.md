# Second Evaluation
### Code
The first part of the code it's for reading the csv file and converting it to a dataframe
```r
# Reading CSV
projectcsv <- read.csv(file.choose())

# Converting CSV to dataframe
wdata <- as.data.frame(projectcsv)
```
In lines 11 and 12 we have a vector for each type of the data of interest
```r
# Data of interest
genres <- c('action', 'adventure','animation','comedy','drama')
studios <- c('Buena Vista Studios','Fox','Paramount Pictures','Sony','Universal','WB')
```
After we put the libraries we are going to use in this case.
```r
# Libraries 
library('dplyr')
library('ggplot2')
```
We continue with the filtering using the vectors from lines 11 and 12.
```r
# Filtering
workingdata <- filter(wdata,Genre %in% genres, Studio %in% studios)
```
We run a summary to confirm we have the correct data
```r
summary(workingdata)
```
After that, the initial plot is created in order to cut the points outside the box diagram, since making the complete graph in a single instruction generates certain errors.
```r
# Create plot
plt  <- ggplot(workingdata, aes(x = Genre, y = Gross...US)) + labs(title = 'Domestic Gross % By Genre', x = "Genre", y = "Gross % US")
```
In the second part of the plot we added jitter and boxplot.
Boxplot with an alpha of 0.4 to display the points behind the diagram and outlier color equals NA to hide the points out of the plot.
```r
#Final plot
fnlplt <- plt + geom_jitter(aes(size = Budget...mill., color = Studio)) + geom_boxplot(alpha = 0.4, outlier.color = NA)
fnlplt$labels$size <- 'Budget $M'

fnlplt
```
Finally, we add a theme to the graph.
```r
#Theme
fnlplt <- fnlplt + theme(axis.title.x = element_text(color = "blue", size = "22"), axis.title.y = element_text(color = "blue", size = "22"), plot.title = element_text(color = "black", size = "26",hjust = 0.5), legend.title = element_text(color = "black", size = "14"), text = element_text(family = "Comic Sans MS"))

fnlplt
```
### Picture of the code
![](https://github.com/diazdesandi/datamining/blob/Unit-2/Unit%202/Evaluations/code.png)
### Graph
![](https://github.com/diazdesandi/datamining/blob/Unit-2/Unit%202/Evaluations/finalplot.png)
