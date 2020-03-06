# Unit 1
## Practice 1
```
x <- seq(-20,20, by=1)
y <- dnorm(x)
plot(x,y)
c <- 0
for(i in x)
{
    c <- c + 1
    print(c)
    if(i >= -1 && i <= 1)
    {
        print(i)
        print("Se encuentra en [-1,1]")
    }
    else {
        print(i)
        print("Fuera del intervalo")
    }
}
```
## Practice 2
```
vivienda <- read.csv("C:/Users/rjds_/Downloads/TRVIVIENDA02.csv", header=FALSE)
names(vivienda)
head(vivienda)
levels(vivienda$V5)
nrow(vivienda)
ncol(vivienda)
sort(vivienda$V5)
length(vivienda$V5)
which(vivienda$V5=='Tijuana')
length(which(vivenda$V5=='Mexicali'))
table(vivenda$V5)
prop.table(table(vivenda$V5))
#Functions on R

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
