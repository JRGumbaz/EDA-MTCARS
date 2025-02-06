install.packages(c("ggplot2", "dplyr", "corrplot", "summarytools"))
library(ggplot2)
library(dplyr)
library(corrplot)
library(summarytools)
data("mtcars")
head(mtcars)
str(mtcars)
summary(mtcars)
colnames(mtcars) <- c("mpg", "cylinders", "displacement", "horsepower", "rear_axle_ratio", "weight", "qsec", "vs", "am", "gear", "carb")
mtcars$transmission <- factor(mtcars$am, labels = c("Automatic", "Manual"))
head(mtcars)
ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(bins = 10, fill = "blue", color = "black", alpha = 0.7) +
  labs(title = "Distribution of Miles Per Gallon", x = "MPG", y = "count")
ggplot(mtcars, aes(x = transmission, y = horsepower, fill = transmission)) +
  geom_boxplot() +
  labs(title = "Horsepower by Transmission Type", x = "Transmission", y = "Horsepower")
ggplot(mtcars, aes(x = weight, y = mpg)) + 
  geom_point(color = "red", alpha = 0.7) +
  geom_smooth(method = "lm", col = "blue") +
  labs(title = "Weight vs. MPG", x = "Weight (1000 lbs", y = "Miles Per Gallon")
cor_matrix <- cor(mtcars[,1:6])
corrplot(cor_matrix, method = "circle", type = "lower", tl.cex = 0.8)
dfSummary(mtcars)
