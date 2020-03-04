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