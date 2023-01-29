a = 1+2
b <- 20

t <- T
f <- F

v1 <- c(T,2,"Hello")
v2 <- c("RHugved",10,T)
v3 <- c(v1,v2,"Hi")
myList <- list("v1"=v1,"v2"=v2)
df <- data.frame(a = v1,b = v2,"Hello")


View(df)

m1 <- matrix(v2,1,3)
View(m1)

s1 <- function(v1,v2){
  results <- v1+v2
  return(results)
}

s1(10,20)
str(df)

data()
View(randu)
library(tidyverse)
view(starwars)


starwars %>% 
  filter(height > 150 & mass < 200) %>% 
  mutate(Height_in_Meters = height/100) %>% 
  select(Height_in_Meters,mass) %>% 
  #view()
  plot()


View(msleep)
glimpse(msleep)
head(msleep)
class(msleep$name)
length(msleep$name)
names(msleep)
unique(msleep$name)
missing <- !complete.cases(msleep)
view(msleep[missing,])


starwars %>% 
  select(name,height,mass) %>% 
  View()

starwars %>% 
  mutate(name = as.factor(name)) %>% 
  head()
  View()
  
starwars %>% 
  select(mass,sex) %>% 
  filter(mass <100 && sex =="male") %>% 
  View()

#Recode Data
starwars %>% 
  select(sex) %>% 
  mutate(sex = recode(sex,"male" = "men", "female" = "women")) %>% 
  View()

#Dealing with missing data
mean(starwars$height,na.rm = TRUE)

#duplicates
names <- c("Rhugved","Rhucha","Rhugved")
age <- c(20,22,20)
df <- data.frame(names,age)
df
distinct(df)

#Manipulate
####
#create or change a variable
starwars %>% 
  mutate(height_m = height/100) %>% 
  select(name,height,height_m)

#COnditional change(if-else)
starwars %>% 
  mutate(height_m = height/100) %>% 
  select(name,height,height_m) %>% 
  mutate(tallness = if_else(
    height_m <1,"short","tall"
  ))

#reshape the data with pivot wider
view(starwars)

data <- select(starwars,name,height,eye_color)
wide_data <-data %>% 
  pivot_wider(names_from = eye_color, values_from = name)
view(wide_data)

#reshape the data with pivot longer
data <- select(starwars,name,height,eye_color)
wide_data <-data %>% 
  pivot_longer(2:13,names_from = eye_color, values_from = name)
view(wide_data)

#summary
summary(msleep$awake)
drop_na(msleep)

#create table

msleep %>% 
  select(vore,order) %>% 
  filter(order %in% c("Rodentia","Primates")) %>% 
  table()

#Visualization
plot(pressure)
view(pressure)
#The grammar of graphics
#data, mapping, geometry

#Barplot
ggplot(data = starwars,
       mapping = aes(x = gender))+
  geom_bar()

#Histograms
starwars %>% 
  drop_na(height) %>% 
  ggplot(aes(x=height))+
  geom_histogram()

#Boxplots
starwars %>% 
  drop_na(height) %>% 
  ggplot(aes(x = height))+
  geom_boxplot(fill = "steelblue")+
  theme_bw()+
  labs(title = "Boxplot of Height",x = "Height")

view(starwars)

#Density plot
starwars %>% 
  drop_na(height) %>% 
  filter(sex %in% c("male","female")) %>% 
  ggplot(aes(height,color=sex,fill=sex))+
  geom_density(alpha =0.2)+
  theme_bw()

#Scatter Plot
starwars %>% 
  filter(mass<200,sex == c("male","female")) %>% 
  ggplot(aes(height,mass,color = sex))+
  geom_point(size = 5, alpha=0.5)+
  theme_classic()+
  labs(title = "Height and Mass by Sex")

#smoothed mode
starwars %>% 
  #filter(mass<200,sex == c("male","female")) %>% 
  filter(mass<200) %>% 
  ggplot(aes(height,mass,color = sex))+
  geom_point(size = 3, alpha=0.5)+
  geom_smooth()+
  facet_wrap(~sex)+
  theme_classic()+
  labs(title = "Height and Mass by Sex")


##Analyze the data
############
#Hypothesis testing
#T-test

install.packages("gapminder")
library("gapminder")
view(gapminder)
gapminder %>% 
  filter(continent %in% c("Africa","Europe")) %>% 
  t.test(lifeExp ~ continent, data = .)


##Anova
gapminder %>% 
  filter(year == 2007) %>% 
  filter(continent %in% c("Americas","Africa","Europe")) %>% 
  aov(lifeExp ~ continent, data = .) %>% 
  summary()

gapminder %>% 
  filter(year == 2007) %>% 
  filter(continent %in% c("Americas","Africa","Europe")) %>% 
  aov(lifeExp ~ continent, data = .) %>% 
  TukeyHSD()

view(iris)

