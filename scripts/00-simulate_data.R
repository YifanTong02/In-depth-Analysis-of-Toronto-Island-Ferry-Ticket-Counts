#### Preamble ####
# Purpose: Simulates... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)

set.seed(123) # for reproducibility
number_of_entries <- 158 # number of entries in your provided dataset

# Generate timestamps every 15 minutes starting from a specific date and time
timestamps <- seq(from = as.POSIXct("2024-03-10 06:30:00"), 
                  by = "15 min", 
                  length.out = number_of_entries)

# Simulate redemption and sales counts based on ranges observed in your dataset
redemption_count <- sample(0:74, number_of_entries, replace = TRUE)
sales_count <- sample(0:65, number_of_entries, replace = TRUE)

# Create a data frame
simulated_data <- data.frame(_id = 1:number_of_entries,
                             Timestamp = timestamps,
                             Redemption_Count = redemption_count,
                             Sales_Count = sales_count)

# Simple test to check if the dataset has the correct number of entries
stopifnot(nrow(simulated_data) == number_of_entries)

# Write the dataset to a CSV file
write.csv(simulated_data, file = "simulated_dataset.csv", row.names = FALSE)

# Print the head of the dataset to check
head(simulated_data)
