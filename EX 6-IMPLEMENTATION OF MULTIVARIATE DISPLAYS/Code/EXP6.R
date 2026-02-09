# Roll No: 23BAD311
# Multivariate Analysis

# Load required libraries
library(ggplot2)
library(GGally)
library(dplyr)

# Load dataset
retail_data <- read.csv("C:\\Users\\vicky\\Downloads\\6.retail_business.csv")

# Remove missing values
retail_data <- na.omit(retail_data)

# -----------------------------------------
# 1. Parallel Coordinate Plot (Sales & Profit)
# -----------------------------------------

ggparcoord(
  data = retail_data,
  columns = which(names(retail_data) %in% c("Sales", "Profit")),
  groupColumn = which(names(retail_data) == "Customer_Segment"),
  scale = "uniminmax",
  showPoints = TRUE
) +
  labs(
    title = "Parallel Coordinate Plot for Sales and Profit",
    color = "Customer Segment"
  ) +
  theme_minimal()

# -----------------------------------------
# 2. Bubble Chart: Sales vs Profit
# -----------------------------------------

ggplot(
  retail_data,
  aes(
    x = Sales,
    y = Profit,
    size = Sales,
    color = Customer_Segment
  )
) +
  geom_point(alpha = 0.7) +
  labs(
    title = "Bubble Chart: Sales vs Profit",
    x = "sales",
    y = "profit"
  )+
  theme_minimal()

