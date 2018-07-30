a = installed.packages()
a
library(dplyr)

data()
iris
data(iris)
summary(iris)

iris$Sepal.Length
iris$Sepal.Width

ratio = iris$Sepal.Length/iris$Sepal.Width
ratio = with(iris, Sepal.Length/Sepal.Width)
median(ratio)

iris_1 = iris[,c("Sepal.Length","Species")]  
dim(iris_1)

str(iris)
class(iris$Species) # factor means categorical

baseball = read.csv(file = 'C:\\Users\\nitis\\OneDrive\\Documents\\Data Mining and ML\\MLTutorial\\blood.csv', na.strings = '.')
baseball

library(foreign)
read.