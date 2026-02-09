# Student Roll No: 23BAD311

# Install required packages
install.packages("lubridate")
install.packages("reshape2")

# Load libraries
library(ggplot2)
library(dplyr)
library(lubridate)
library(reshape2)

# Load data
data <- read.csv("C:/Users/vicky/Downloads/2.ecommerce_transactions.csv")

# View data
head(data)

# Histogram of Transaction Amounts
ggplot(data, aes(x = Transaction_Amount)) +
  geom_histogram(
    binwidth = 500,
    fill = "steelblue",
    color = "black"
  ) +
  labs(
    title = "Histogram of Transaction Amounts",
    x = "Transaction Amount",
    y = "Frequency"
  ) +
  theme_minimal()

# Boxplot of Transaction Amounts
ggplot(data, aes(y = Transaction_Amount)) +
  geom_boxplot(
    fill = "orange",
    outlier.color = "red",
    outlier.size = 2
  ) +
  labs(
    title = "Boxplot of Transaction Amounts",
    y = "Transaction Amount"
  ) +
  theme_minimal()

# Convert Transaction_Date to Date format
data$Transaction_Date <- as.Date(data$Transaction_Date)

# Extract Month and Year
data$Month <- format(data$Transaction_Date, "%b")
data$Year <- format(data$Transaction_Date, "%Y")

# Monthly sales summary
monthly_sales <- data %>%
  group_by(Month, Year) %>%
  summarise(
    TotalSales = sum(Transaction_Amount, na.rm = TRUE),
    .groups = "drop"
  )

# Heatmap of Monthly Sales Intensity
ggplot(monthly_sales, aes(x = Year, y = Month, fill = TotalSales)) +
  geom_tile(color = "white") +
  scale_fill_gradient(low = "lightblue", high = "darkred") +
  labs(
    title = "Heatmap of Monthly Sales Intensity",
    x = "Year",
    y = "Month"
  ) +
  theme_minimal()

