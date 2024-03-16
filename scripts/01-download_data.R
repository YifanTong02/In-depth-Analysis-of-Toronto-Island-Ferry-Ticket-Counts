#### Preamble ####
# Purpose: Downloads and saves the data from 
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]

#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)

download_data <- function() {
  # Identify the package dataset
  dataset_identifier <- "toronto-island-ferry-ticket-counts"
  
  # Fetch dataset information
  dataset_info <- opendatatoronto::get_package(dataset_identifier)
  
  # Ideally, check which resource you want to download (if there are multiple)
  # Here it is assumed we take the first resource for simplicity
  resource_id <- dataset_info$resources[[1]](/file?id=file_01hrv0ghteedj9p0v7658r5504)$id
  
  # Download the data
  data <- opendatatoronto::get_resource(resource_id)
  
  # Save the unedited data in the 'inputs/data' directory
  write.csv(data, file = "inputs/data/unedited_data.csv", row.names = FALSE)
}

# Run the download data function
download_data()

# After running this, you should confirm the existence of the file
if (file.exists("inputs/data/unedited_data.csv")) {
  message("Data has been successfully downloaded and saved.")
} else {
  stop("There was an error in downloading or saving the data.")
}

