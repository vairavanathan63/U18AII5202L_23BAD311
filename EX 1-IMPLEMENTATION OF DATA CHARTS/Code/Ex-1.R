library(ggplot2)
library(dplyr)

# Load data
data <- read.csv("C:/Users/mohan/Downloads/1.student_performance.csv")

# View data
head(data)
str(data)

# Check missing values
colSums(is.na(data))

# Convert columns to factors
data$Subject <- as.factor(data$Subject)
data$Department <- as.factor(data$Department)
data$Semester <- as.factor(data$Semester)
data$Final_Grade <- as.factor(data$Final_Grade)

# Subject-wise average marks
subject_avg <- data %>%
  mutate(Average_Marks = (Internal_Test1 + Internal_Test2) / 2) %>%
  group_by(Subject) %>%
  summarise(Average_Marks = mean(Average_Marks, na.rm = TRUE))

# Bar plot: Subject-wise average marks
ggplot(subject_avg, aes(x = Subject, y = Average_Marks, fill = Subject)) +
  geom_bar(stat = "identity") +
  labs(
    title = "Subject-wise Average Marks",
    x = "Subject",
    y = "Average Marks"
  ) +
  theme_minimal()

# Final grade distribution
grade_dist <- data %>%
  count(Final_Grade)

# Pie chart: Final grade distribution
ggplot(grade_dist, aes(x = "", y = n, fill = Final_Grade)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y") +
  labs(title = "Final Grade Distribution") +
  theme_void()
