#containing tools for Data Splitiing, Data preprocessing, Feature selection
install.packages("caret")
library(caret)

#step 1: Data preprocessing
data("iris")
view(iris)

#step 2: Summarise Dataset
#Dataset dimension
dim(iris)

#types of each attr
sapply(iris, class)

head(iris)

summary(iris)

#Create Validation set : Data partitions
validation <- createDataPartition(iris$Species,p=0.80,list = FALSE)
validation20 <- iris[-validation]

iris <- iris[validation,]


#Visualize Data
#Split i/p and op
x <- iris[,1:4]
y <- iris[,5]
view(x)

#Unvariate plots
#individual
boxplot(x[,1])
#or boxplot(x[,1],main=names(iris)[1])

library(caret)

#set plotting area
par(mfrow=c(1,4))
for(i in 1:4){
  boxplot(x[,i],main=names(iris)[i])
}

plot(y)
plot(x)

#Multivariate plots
#scatter plot

featurePlot(x=x,y=y)
install.packages("ellipse")
library(ellipse)
featurePlot(x=x,y=y,plot = "ellipse")

#box-and-whisker plots
featurePlot(x=x,y=y,plot="box")

#density plot- The Distribution of each plot
scales <- list(x=list(relation="free"),y=list(relation="free"))
featurePlot(x=x,y=y,plot = "density",scale=scales)

