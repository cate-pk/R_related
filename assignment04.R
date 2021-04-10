#Q1
par(cex.axis=.7)
boxplot(x = as.list(as.data.frame(iris)), las=2, col = "white")

#Q2
par(mfrow=c(1,3))
ylim=c(0, 130)

versicolor <- subset(iris, Species == "versicolor")
boxplot(versicolor[,1:4], main = "Versicolor", las=2, col = "white", ylim=c(0, 8))

setosa <- subset(iris, Species == "setosa")
boxplot(setosa[,1:4], main = "Setosa", las=2, col = "white", ylim=c(0, 8))

virginica <- subset(iris, Species == "virginica")
boxplot(virginica[,1:4], main = "Virginica", las=2, col = "white", ylim=c(0, 8))

#Q3
install.packages("beanplot")
library(beanplot)

par(mfrow=c(1,1))
beanplot(iris[,1:4], col=list(c('salmon','blue',"blue","hot pink")))

#Q4
pairs(iris[, 1:4], col = iris$Species, oma=c(5,5,5,15), cex.labels=1.4)
par(xpd = TRUE)
legend("right", fill = unique(iris$Species), legend = c(levels(iris$Species)), cex = 0.75)

#Q5
install.packages("MASS")
library(MASS)

cols = c('black', 'red', 'green')
parcoord(iris[ ,-5], col = cols[iris$Species],var.label = TRUE,lty=1)
par(xpd = TRUE)
legend("left", fill = unique(iris$Species), legend = c(levels(iris$Species)), cex = 0.75)

