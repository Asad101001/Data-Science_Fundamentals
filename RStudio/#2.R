install.packages("ggplot2")
install.packages("dplyr")
install.packages("tidyr")

#SUMMARIZE mtcars DATASET
summary(mtcars)

#FIND MEAN 
mean(mtcars$mpg[mtcars$cyl== 6])

#FIND MAXIMUM
mtcars[which.max(mtcars$hp), ]

#MERGE 2 DIFERENT DATAFRAMES
students <- data.frame(
  Name = c("Alice", "Bob", "Charlie", "David", "Eva"),
  Age = c(15, 16, 15, 17, 16),
  Score = c(85, 90, 78, 88, 92)
)

students_details <- data.frame(
  ID = c(1, 2, 3, 4, 5),
  Age = c(15, 16, 15, 17, 16)
)
merge(students, students_details, by.x = "Age", by.y = "Age")

#RESHAPE DATAFRAME
library(tidyr)
wide_data <- data.frame(
  Name = c("Alice", "Bob"),
  Math = c(85, 90),
  Science = c(88, 92)
)
wide_data
long_data <- pivot_longer(wide_data, cols = c(Math, Science), names_to = "Subject", values_to = "Score")
print(long_data)

#ADDING A NEW COLUMN
students$Passed <- students$Score > 80
print(students)

#FILTER ROWS USING MULTIPLE CONDITIONS
students[students$Age > 15 & students$Score > 80, ]

#SUMMARY SATISTICS FOR GROUPED DATA
library(dplyr)
students %>% group_by(Age) %>% summarize(
  Mean_Score = mean(Score),
  Max_Score = max(Score),
  Min_Score = min(Score)
)

#CREATE HISTOGRAM
library(ggplot2)
ggplot(students, aes(x = Score)) +
  geom_histogram(binwidth = 5, fill = "blue", color = "black") +
  labs(title = "Score Distribution", x = "Score", y = "Frequency")

#CREATE LINEPLOT
ggplot(mtcars, aes(x = hp, y = mpg)) +
  geom_line() +
  labs(title = "Horsepower vs. MPG", x = "Horsepower", y = "Miles per Gallon")

#USING MUTATE TO CREATE A NEW VARIABLE
students <- students %>% mutate(Grade = ifelse(Score > 90, "A", "B"))
print(students)

#FILTER ROW USING STRINGS
students_with_names <- data.frame(
  Name = c("Alice", "Bob", "Charlie", "David", "Eva"),
  Score = c(85, 90, 78, 88, 92)
)
students_with_names[grep("a", students_with_names$Name, ignore.case = TRUE), ]

#The aes(y = Score) specifies that the variable Score from the students dataset will be mapped to the y-axis of the plot.
#It defines how variables in your dataset are mapped to visual properties (aesthetics) of the plot

#CALCULATE RANK
students$Rank <- rank(-students$Score)
print(students)

#PIE CHART FOR AGE DISTRIBUTION
age_counts <- table(students$Age)
pie(age_counts, main = "Age Distribution", col = rainbow(length(age_counts)))


#USE SELECT FUNCTION TO EXTRACT SPECIFIC COLUMNS
students %>% select(Name, Score)

#CUMULATIVE SUM
students <- students %>% mutate(Cumulative_Score = cumsum(Score))
students

#IDENTIFYING DUPLICATE ROWS
duplicated_rows <- students[duplicated(students), ]
duplicated_rows

#STACKED BAR CHART
ggplot(students, aes(x = factor(Age), fill = Passed)) +
  geom_bar() +
  labs(title = "Age vs Passed", x = "Age", y = "Count")

#SCATTERPLOT WITH REGRESSION LINE
ggplot(mtcars, aes(x = hp, y = mpg)) +
  geom_point() +
  geom_smooth(method = "lm", col = "red") +
  labs(title = "HP vs MPG with Regression Line")

#HEATMAP FOR CORRELATION MATRIX
cor_matrix <- cor(mtcars)
heatmap(cor_matrix, main = "Correlation Heatmap", col = colorRampPalette(c("blue", "white", "red"))(20))

#K-MEANS CLUSTERING
set.seed(123)
clustering <- kmeans(mtcars[, c("mpg", "hp")], centers = 3)
mtcars$Cluster <- clustering$cluster
ggplot(mtcars, aes(x = mpg, y = hp, color = factor(Cluster))) +
  geom_point() +
  labs(title = "K-Means Clustering", x = "MPG", y = "HP")

#DENSITY PLOT
ggplot(students, aes(x = Score)) +
  geom_density(fill = "blue", alpha = 0.5) +
  labs(title = "Score Density Plot", x = "Score")


#PERFORMIG A T-TEST
set.seed(123)
group1 <- rnorm(30, mean = 70, sd = 10)
group2 <- rnorm(30, mean = 75, sd = 10)
t.test(group1, group2)

#VIOLIN PLOT
ggplot(students, aes(x = factor(Age), y = Score)) +
  geom_violin(fill = "lightblue") +
  labs(title = "Violin Plot of Scores by Age", x = "Age", y = "Score")
