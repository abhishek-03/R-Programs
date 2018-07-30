data = read.table("https://archive.ics.uci.edu/ml/machine-learning-databases/auto-mpg/auto-mpg.data",col.names = c('mpg','cylinders','displacement','horsepower','weight','acceleration','model year','origin','car name'), na.strings = '?')
head(data)
colSums(is.na(data))

is.na(data$horsepower)
data[is.na((data$horsepower)),]
