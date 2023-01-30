# 4 steps of Data Pre-Processing :
#   1. Missing data
#   2. Categorical data
#   3. splitting data into training and test set
#   4. Feature scaling

library(tidyverse)

# Create a sample dataframe with missing values
df <- data.frame(x = c(1, 2, 3, NA, 5), 
                 y = c(6, NA, 8, 9, 10), 
                 z = c(NA, 12, 13, 14, 15))

# Replace missing values in column 'x' with the mean of column 'x'
df <- df %>%
  mutate_all(funs(ifelse(is.na(.), mean(., na.rm = TRUE), .)))
view(df)


df <- data.frame(
  product = c('apple','orange','strawberry','banana','blueberry'),
  color = c('red','orange','red','yellow','blue')
)

# Use the 'model.matrix' function to encode the data frame
encoded_data <- model.matrix(~ 0 + product + color, data = df)

# View the encoded data
view(encoded_data)

