library(tidyverse)
# In aes() x is an independent variable and y is a dependent variable
ggplot(data = BOD, 
       mapping = aes(x = BOD$Time,
                     y = BOD$demand))+
  geom_point(size = 5,)+
  geom_line(color = "red")

names(CO2)
CO2 %>% 
  ggplot(aes(conc,uptake, colour = Treatment))+
  geom_point(size = 3, alpha = 0.5)+
  geom_smooth(method = lm, se = F)+
  facet_wrap(~Type)+
  labs(title = "Concentration of CO2")+
  theme_bw()

CO2 %>% 
  ggplot(aes(Treatment,uptake))+
  geom_boxplot()+
  geom_point(alpha = 0.5, 
             aes(size = 1
                 , colour = Plant))+
  coord_flip()+
  theme_bw()+
  facet_wrap(~Type)+
  labs(title = "Chilled Vs Non-chilled")


view(mpg)
summary(mpg)
dim(mpg)
describe(mpg)
str(mpg)
