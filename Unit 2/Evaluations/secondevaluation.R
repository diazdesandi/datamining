# Reading CSV
projectcsv <- read.csv(file.choose())

# Converting CSV to dataframe
wdata <- as.data.frame(projectcsv)

#Reading imported csv
#wdata <- as.data.frame(projectdata)

# Data of interest
genres <- c('action', 'adventure','animation','comedy','drama')
studios <- c('Buena Vista Studios','Fox','Paramount Pictures','Sony','Universal','WB')

# Libraries 
library('dplyr')
library('ggplot2')

# Filtering
workingdata <- filter(wdata,Genre %in% genres, Studio %in% studios)

# Check
summary(workingdata)

# Create plot
plt  <- ggplot(workingdata, aes(x = Genre, y = Gross...US)) + labs(title = 'Domestic Gross % By Genre', x = "Genre", y = "Gross % US")

#Final plot
fnlplt <- plt + geom_jitter(aes(size = Budget...mill., color = Studio)) + geom_boxplot(alpha = 0.4, outlier.color = NA)
fnlplt$labels$size <- 'Budget $M'

fnlplt

#Theme
fnlplt <- fnlplt + theme(axis.title.x = element_text(color = "blue", size = "22"), axis.title.y = element_text(color = "blue", size = "22"), plot.title = element_text(color = "black", size = "26",hjust = 0.5), legend.title = element_text(color = "black", size = "14"), text = element_text(family = "Comic Sans MS"))

fnlplt