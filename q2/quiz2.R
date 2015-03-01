library(datasets)
data(iris)
?iris
head(iris)

# Question 1
tapply(iris$Sepal.Length, iris$Species, mean)

# Question 2
sapply(iris[, 1:4], mean)
apply(iris[, 1:4], 2, mean)

# Question 3
library(datasets)
data(mtcars)
?mtcars
head(mtcars)

# split(mtcars, mtcars$cyl)
# apply(mtcars, 2, mean)

with(mtcars, tapply(mpg, cyl, mean))
#Equals:
tapply(mtcars$mpg, mtcars$cyl, mean)

# Question 4 
hp <- tapply(mtcars$hp, mtcars$cyl, mean)
hp[3] - hp[1]

# Question 5
