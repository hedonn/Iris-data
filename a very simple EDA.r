# Load the required libraries
library(ggplot2)

# Load the iris dataset
data(iris)

# Check the number of rows and columns in the dataset
nrow(iris)
ncol(iris)

# Randomly sample 90% of the data
iris_sample <- iris[sample(nrow(iris), nrow(iris) * 0.9), ]

# Get a summary of the sampled data
summary(iris_sample)

# Plot a histogram of Sepal.Width
hist(iris_sample$Sepal.Width, col = 'blue')

# Plot the density of Sepal.Width
plot(density(iris_sample$Sepal.Width))

# Create a scatter plot of Sepal.Length and Sepal.Width
plot(iris_sample$Sepal.Length, iris_sample$Sepal.Width)

# Create a scatter plot of Sepal.Length and Sepal.Width using ggplot2
ggplot(data = iris_sample, aes(x = Sepal.Length, y = Sepal.Width)) + 
  geom_point() +
  facet_wrap(~ Species)

# Check the number of rows and columns in the dataset again
nrow(iris)
ncol(iris)

#Scatter plot of the Sepal Length and Sepal Width
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width)) + geom_point() + facet_grid(. ~ Species)

#Density plot of the Sepal Length
ggplot(iris, aes(x=Sepal.Length, fill=Species)) + geom_density(alpha=0.5)
