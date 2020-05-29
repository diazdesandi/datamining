# Reading CSV
projectcsv <- read.csv(file.choose())

# Converting CSV to dataframe
wdata <- as.data.frame(projectcsv)

#Reading imported csv
#wdata <- as.data.frame(projectdata)

# Data of interest
genres <- c('action', 'adventure','animation','comedy','drama')
studios <- c('Buena Vista Studios','Fox','Paramount Pictures','Sony','Universal','WB')

library('dplyr')

# Filtering
workingdata <- filter(wdata,Genre %in% genres, Studio %in% studios)

# Check
summary(workingdata)

library('ggplot2')

# Create plot
bxplt  <- ggplot(workingdata, aes(x = Genre, y = Gross...US)) + labs(title = 'Domestic Gross % By Genre', x = "Genre", y = "Gross % US")

# Boxplot
bxplt + geom_boxplot()




