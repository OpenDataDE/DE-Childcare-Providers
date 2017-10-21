library(readr)

source_dataset <- read_csv("Licensed_Child_Care_Providers_and_Facilities.csv")

# Use the following command to view the source data
#View(source_dataset)

# Begin formatting cleanup
# Several columns will be converted to factors because they are actually values from a list, not numeric
# or free-response text

# Convert 'County' and 'Zip Code' columns to factors
source_dataset$County <- as.factor(source_dataset$County)
source_dataset$`Zip Code` <- as.factor(source_dataset$`Zip Code`)
source_dataset$City <- as.factor(source_dataset$City)
source_dataset$State <- as.factor(source_dataset$State)

## WORK IN PROGRESS
# Split out the geocoding coords from the `Geocoded Location` column
# Would work great except a few rows are missing the cords -- whole list gets out of alignment
#coords <- strsplit(source_dataset$`Geocoded Location`, "\n")
