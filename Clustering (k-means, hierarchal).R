# Load necessary libraries
library(fpc) 
library(ggplot2)

# Load and sample the iris dataset
data(iris)
iris_sample <- iris[sample(nrow(iris), nrow(iris) * 0.9),]

# Perform K-means clustering
fit <- kmeans(iris_sample[, 1:4], 4)

# Display number of clusters in each cluster
cat("Table of cluster sizes:\n")
cat(table(fit$cluster))

# Plot cluster graph
plotcluster(iris_sample[, 1:4], fit$cluster)

# Create scatterplot of petal length vs petal width with species color
scatterplot <- ggplot(iris_sample, aes(Petal.Length, Petal.Width, color = Species)) +
  geom_point(size = 5) +
  labs(title = "Scatterplot of Petal Length vs Petal Width by Species")
print(scatterplot)

# Calculate distance and perform hierarchical clustering
iris_sample.dist <- dist(iris_sample[, 1:4])
iris_sample.hclust <- hclust(iris_sample.dist, method = "ward")

# Plot dendrogram
plot(iris_sample.hclust)

# Cut dendrogram to form 3 groups and print table of group sizes
groupIris.3 <- cutree(iris_sample.hclust, k = 3)
cat("Table of group sizes:\n")
cat(table(groupIris.3))

# Get cluster means for raw data
iris_sample_means <- aggregate(iris_sample[, 1:4], by = list(group = groupIris.3), FUN = mean)

# Plot cluster graph for hierarchical clustering
plotcluster(iris_sample[, 1:4], groupIris.3)
