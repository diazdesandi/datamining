# Unit 1
## Practice 1
The aim of this practice is to make an R script to check the Law of Large Numbers
```
x <- seq(-5,5,by=0.5)
cont <- 0
for(i in x)
{
  cont <- cont + 1
  if(i >= -1 && i <= 1)
  {
    cat("Valor numero:", cont,"")
    cat("Valor: ", i, " Se encuentra en [-1,1]")
  }
  else {
  }
}
```
## Practice 2
This practice aims to use 20 R functions
```
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
```
## Practice 3
```
#Data
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

#Solution
#1 Calculate Profit As The Differences Between Revenue And Expenses
profit <- revenue - expenses
profit

#2 Calculate Tax As 30% Of Profit And Round To 2 Decimal Points
tax <- round(0.30 * profit,2) #round(,3)used to decide some decimals will be used 
tax 

#3 Calculate Profit Remaining After Tax Is Deducted
profit.after.tax <- profit - tax
profit.after.tax

#4 Calculate The Profit Margin As Profit After Tax Over Revenue
#Round To 2 Decimal Points, Then Multiply By 100 To Get %
profit.margin <- round(profit.after.tax/revenue,2) *100
profit.margin <- paste(profit.margin,'%') 
profit.margin #to concatenate characters it is separated by commas and quotation marks are used in the deceased character

#5 Calculate The Mean Profit After Tax For The 12 Months
mean_pat <- mean(profit.after.tax) #The mean is the average of the numbers
mean_pat

#6 Find The Months With Above-Mean Profit After Tax
good.months <- profit.after.tax > mean_pat #with the character> the search for the months greater than the average was mean
good.months

#7 Bad Months Are The Opposite Of Good Months !
bad.months <-  !good.months #!tells us otherwise
bad.months

#8 The Best Month Is Where Profit After Tax Was Equal To The Maximum
best.month <- profit.after.tax == max(profit.after.tax)
best.month

#9 The Worst Month Is Where Profit After Tax Was Equal To The Minimum
worst.month <- profit.after.tax == min (profit.after.tax)
worst.month

#10 Convert All Calculations To Units Of One Thousand Dollars
revenue.1000 <- round(revenue / 1000, 0)
expenses.1000 <- round(expenses / 1000, 0)
profit.1000 <- round(profit / 1000, 0 )
profit.after.tax.1000 <- round(profit.after.tax / 1000, 0) 

#11 Print Results
revenue.1000
expenses.1000
profit.1000
profit.after.tax.1000
profit.margin
good.months
bad.months
best.month
worst.month

#12 BONUS:
#Preview Of What's Coming In The Next Section
M <- rbind(revenue.1000,expenses.1000,profit.1000,profit.after.tax.1000,profit.margin,good.months,bad.months,best.month,worst.month)
```
## Practice 4
The objetive of this practice its to create three plots that portray the following insights from matrix data:
* Free Throw Attempts per game
* Accurancy of Free Throws
* Player playing style (2 vs 3 points preference) excluding Free Throws

```
#Seasons
Seasons <- c("2005","2006","2007","2008","2009","2010","2011","2012","2013","2014")

#Players
Players <- c("KobeBryant","JoeJohnson","LeBronJames","CarmeloAnthony","DwightHoward","ChrisBosh","ChrisPaul","KevinDurant","DerrickRose","DwayneWade")

#Free Throws
KobeBryant_FT <- c(696,667,623,483,439,483,381,525,18,196)
JoeJohnson_FT <- c(261,235,316,299,220,195,158,132,159,141)
LeBronJames_FT <- c(601,489,549,594,593,503,387,403,439,375)
CarmeloAnthony_FT <- c(573,459,464,371,508,507,295,425,459,189)
DwightHoward_FT <- c(356,390,529,504,483,546,281,355,349,143)
ChrisBosh_FT <- c(474,463,472,504,470,384,229,241,223,179)
ChrisPaul_FT <- c(394,292,332,455,161,337,260,286,295,289)
KevinDurant_FT <- c(209,209,391,452,756,594,431,679,703,146)
DerrickRose_FT <- c(146,146,146,197,259,476,194,0,27,152)
DwayneWade_FT <- c(629,432,354,590,534,494,235,308,189,284)
#Code
FreeThrows <- rbind(KobeBryant_FT, JoeJohnson_FT, LeBronJames_FT, CarmeloAnthony_FT, DwightHoward_FT, ChrisBosh_FT, ChrisPaul_FT, KevinDurant_FT, DerrickRose_FT, DwayneWade_FT)
rm(KobeBryant_FT, JoeJohnson_FT, CarmeloAnthony_FT, DwightHoward_FT, ChrisBosh_FT, LeBronJames_FT, ChrisPaul_FT, DerrickRose_FT, DwayneWade_FT, KevinDurant_FT)
colnames(FreeThrows) <- Seasons
rownames(FreeThrows) <- Players
FreeThrows

#Free Throw Attempts
KobeBryant_FTA <- c(819,768,742,564,541,583,451,626,21,241)
JoeJohnson_FTA <- c(330,314,379,362,269,243,186,161,195,176)
LeBronJames_FTA <- c(814,701,771,762,773,663,502,535,585,528)
CarmeloAnthony_FTA <- c(709,568,590,468,612,605,367,512,541,237)
DwightHoward_FTA <- c(598,666,897,849,816,916,572,721,638,271)
ChrisBosh_FTA <- c(581,590,559,617,590,471,279,302,272,232)
ChrisPaul_FTA <- c(465,357,390,524,190,384,302,323,345,321)
KevinDurant_FTA <- c(256,256,448,524,840,675,501,750,805,171)
DerrickRose_FTA <- c(205,205,205,250,338,555,239,0,32,187)
DwayneWade_FTA <- c(803,535,467,771,702,652,297,425,258,370)
#Code
FreeThrowsAttemps <- rbind(KobeBryant_FTA,JoeJohnson_FTA,LeBronJames_FTA,CarmeloAnthony_FTA,DwightHoward_FTA,ChrisBosh_FTA, ChrisPaul_FTA, KevinDurant_FTA, DerrickRose_FTA, DwayneWade_FTA)
rm(KobeBryant_FTA,JoeJohnson_FTA,LeBronJames_FTA,CarmeloAnthony_FTA,DwightHoward_FTA,ChrisBosh_FTA, ChrisPaul_FTA, KevinDurant_FTA, DerrickRose_FTA, DwayneWade_FTA)
colnames(FreeThrowsAttemps) <- Seasons
rownames(FreeThrowsAttemps) <- Players
FreeThrowsAttemps

# Games
KobeBryant_G <- c(80,77,82,82,73,82,58,78,6,35)
JoeJohnson_G <- c(82,57,82,79,76,72,60,72,79,80)
LeBronJames_G <- c(79,78,75,81,76,79,62,76,77,69)
CarmeloAnthony_G <- c(80,65,77,66,69,77,55,67,77,40)
DwightHoward_G <- c(82,82,82,79,82,78,54,76,71,41)
ChrisBosh_G <- c(70,69,67,77,70,77,57,74,79,44)
ChrisPaul_G <- c(78,64,80,78,45,80,60,70,62,82)
KevinDurant_G <- c(35,35,80,74,82,78,66,81,81,27)
DerrickRose_G <- c(40,40,40,81,78,81,39,0,10,51)
DwayneWade_G <- c(75,51,51,79,77,76,49,69,54,62)
#Code
Games <- rbind(KobeBryant_G, JoeJohnson_G, LeBronJames_G, CarmeloAnthony_G, DwightHoward_G, ChrisBosh_G, ChrisPaul_G, KevinDurant_G, DerrickRose_G, DwayneWade_G)
rm(KobeBryant_G, JoeJohnson_G, CarmeloAnthony_G, DwightHoward_G, ChrisBosh_G, LeBronJames_G, ChrisPaul_G, DerrickRose_G, DwayneWade_G, KevinDurant_G)
colnames(Games) <- Seasons
rownames(Games) <- Players
Games

#Points
KobeBryant_PTS <- c(2832,2430,2323,2201,1970,2078,1616,2133,83,782)
JoeJohnson_PTS <- c(1653,1426,1779,1688,1619,1312,1129,1170,1245,1154)
LeBronJames_PTS <- c(2478,2132,2250,2304,2258,2111,1683,2036,2089,1743)
CarmeloAnthony_PTS <- c(2122,1881,1978,1504,1943,1970,1245,1920,2112,966)
DwightHoward_PTS <- c(1292,1443,1695,1624,1503,1784,1113,1296,1297,646)
ChrisBosh_PTS <- c(1572,1561,1496,1746,1678,1438,1025,1232,1281,928)
ChrisPaul_PTS <- c(1258,1104,1684,1781,841,1268,1189,1186,1185,1564)
KevinDurant_PTS <- c(903,903,1624,1871,2472,2161,1850,2280,2593,686)
DerrickRose_PTS <- c(597,597,597,1361,1619,2026,852,0,159,904)
DwayneWade_PTS <- c(2040,1397,1254,2386,2045,1941,1082,1463,1028,1331)
#Code
Points <- rbind(KobeBryant_PTS, JoeJohnson_PTS, LeBronJames_PTS, CarmeloAnthony_PTS, DwightHoward_PTS, ChrisBosh_PTS, ChrisPaul_PTS, KevinDurant_PTS, DerrickRose_PTS, DwayneWade_PTS)
rm(KobeBryant_PTS, JoeJohnson_PTS, LeBronJames_PTS, CarmeloAnthony_PTS, DwightHoward_PTS, ChrisBosh_PTS, ChrisPaul_PTS, KevinDurant_PTS, DerrickRose_PTS, DwayneWade_PTS)
colnames(Points) <- Seasons
rownames(Points) <- Players
Points

#Field Goals
KobeBryant_FG <- c(978,813,775,800,716,740,574,738,31,266)
JoeJohnson_FG <- c(632,536,647,620,635,514,423,445,462,446)
LeBronJames_FG <- c(875,772,794,789,768,758,621,765,767,624)
CarmeloAnthony_FG <- c(756,691,728,535,688,684,441,669,743,358)
DwightHoward_FG <- c(468,526,583,560,510,619,416,470,473,251)
ChrisBosh_FG <- c(549,543,507,615,600,524,393,485,492,343)
ChrisPaul_FG <- c(407,381,630,631,314,430,425,412,406,568)
KevinDurant_FG <- c(306,306,587,661,794,711,643,731,849,238)
DerrickRose_FG <- c(208,208,208,574,672,711,302,0,58,338)
DwayneWade_FG <- c(699,472,439,854,719,692,416,569,415,509)
#Matrix
FieldGoals <- rbind(KobeBryant_FG, JoeJohnson_FG, LeBronJames_FG, CarmeloAnthony_FG, DwightHoward_FG, ChrisBosh_FG, ChrisPaul_FG, KevinDurant_FG, DerrickRose_FG, DwayneWade_FG)
rm(KobeBryant_FG, JoeJohnson_FG, LeBronJames_FG, CarmeloAnthony_FG, DwightHoward_FG, ChrisBosh_FG, ChrisPaul_FG, KevinDurant_FG, DerrickRose_FG, DwayneWade_FG)
colnames(FieldGoals) <- Seasons
rownames(FieldGoals) <- Players

#Free Throw Attempts per game
?matplot
matplot(t(FreeThrows/Games), type ="b", pch=15:18, col=c(1:4, 6))
legend("bottomleft", inset=0.01, legend=Players, col=c(1:4, 6), pch=15:18, horiz=F)

#Accurancy of Free Throws
?matplot
matplot(t(FreeThrows/FreeThrowsAttemps), type ="b", pch=15:18, col=c(1:4, 6))
legend("bottomleft", inset=0.01, legend=Players, col=c(1:4, 6), pch=15:18, horiz=F)

# Player playing style
x <- Points-FreeThrows
?matplot
matplot(t(x/FieldGoals), type ="b", pch=15:18, col=c(1:4, 6))
legend("bottomleft", inset=0.01, legend=Players, col=c(1:4, 6), pch=15:18, horiz=F)
```
## Practice 5
```
?read.csv()

# Method 1: Select the file manually
stats <- read.csv(file.choose())
stats

# Method 2: Set Working Directory and Read Data
getwd()
#windows
setwd("C:\\Users\\username\\Documents\\Rprojects")
#Mac
setwd()
setwd('/home/chris/Documents/itt/Enero_Junio_2020/Mineria_de_datos/DataMining/Dataframes')
getwd()
rm(stats)
stats <- read.csv("Demographic-Data.csv")

#------Exploring the data
stats
is.data.frame(stats)
nrow(stats)
ncol(stats)
head(stats, n=10)
tail(stats, n=8)
str(stats)
summary(stats)

#------Using the $ sing
stats
head(stats)
stats[3,3]
stats[3, "Birth.rate"]
typeof(stats)
stats$Internet.users
stats$Internet.users[2]
stats[ , "Internet.users"]#es lo mismo que la linea 32 solo que como matriz
levels(stats$Income.Group)#nos indica los campos de la columna que digamos

#------Basic operations with dataframes-----------------------
stats[1:10, ] #subsetting
stats[3:9, ]
stats[c(4, 100),]
is.data.frame(stats[1, ])#renglon si es un dataframe
is.data.frame(stats[,1])#una columna es un vector
is.data.frame(stats[,1, drop=F])#hacer columna un dataframe
stats[,1, drop=F]

#-------Multiply columns
stats$Birth.rate * stats$Internet.users#multiplicacion y sale en un vector
stats$Birth.rate + stats$Internet.users#suma

#-------Add Columns
head(stats)
stats$BRbyIU <- stats$Birth.rate * stats$Internet.users#crear una columna y hacer una operacion de columnas creadas anteriormente
head(stats)

#------Thigs to know
stats$xyz <- 1:5#necesitamos que sea un numero de acuerdo al total de datos
head(stats, n=12)

#------Remove columns
head(stats)
stats$BRbyIU <- NULL
stats$xyz <- NULL

#------Filtering Data Frames -----------------------
head(stats)
filter <- stats$Internet.users < 2 #TRUE
filter
stats[filter,]

stats[stats$Birth.rate > 40,]
stats[stats$Birth.rate > 40 & stats$Internet.users < 2,]
stats[stats$Income.Group == "High income",]
levels(stats$Income.Group)

filter <- stats$Country.Name


#Practice

#Filter countries by Low income
stats[stats$Income.Group=="Low income","Country.Name"]

#Filter countries by Lower middle income
stats[stats$Income.Group=="Lower middle income","Country.Name"]

#Filter countries by Upper middle income
stats[stats$Income.Group=="Upper middle income","Country.Name"]

#Filter by countrie Malta
stats[stats$Country.Name == "Malta",]

#Filter by countrie Qatar
stats[stats$Country.Name == "Qatar",]

#Filter by countrie Netherlands
stats[stats$Country.Name == "Netherlands",]

#Filter by countrie Norway
stats[stats$Country.Name == "Norway",]
```