#Descriptive statistics in R

install.packages("readr")
surveyData <- read.csv("C:/Users/Rhugved/Desktop/R/R-Tutorial-Data-Files/EmployeeSurveyExample.csv")

View(surveyData)
summary(surveyData)

#Nominal/categorical and ordinal measurement scale variables
install.packages("dplyr")
library(dplyr)

count(surveyData,Gender)

count(surveyData,JobSat1)

count(surveyData, Gender, Location)
xtabs(~ Gender+Location, data = surveyData, addNA = TRUE)

##Data Visualization
install.packages("lessR")
library(lessR)
#1. BarChart
BarChart(JobSat1, data= surveyData)
?BarChart

BarChart(JobSat1, data= surveyData, by1 = Location)

BarChart(JobSat1, data= surveyData, by = Location)

#2. PieChart

?PieChart()
PieChart(Gender, data = surveyData,hole_fill = getOption("panel_fill"))

##Continuous variables: interval or ratio measurement scales


hist(surveyData$Tenure_Yrs)
##we can use Plot instead of hist
Plot(Tenure_Yrs, data = surveyData)

Plot(Tenure_Yrs, data = surveyData, by1= Location)

##Measures of central tendency & dispersion
summary(surveyData)
mean(surveyData$JobSat2_rev, na.rm = T)
sd(surveyData$JobSat2_rev, na.rm = T)
min(surveyData$JobSat2_rev, na.rm = T)
max(surveyData$JobSat2_rev, na.rm = T)
median(surveyData$JobSat2_rev, na.rm = T)
range(surveyData$Tenure_Yrs, na.rm = T)
var(surveyData$Tenure_Yrs, na.rm = T)
