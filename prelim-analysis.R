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

#start cleaning age_range

#change 'to' to '-'
source_dataset$`Age Range`<-sub('to','-', source_dataset$`Age Range`, ignore.case=TRUE)
#change 'through' to '-'
source_dataset$`Age Range`<-sub('through','-', source_dataset$`Age Range`, ignore.case=TRUE)
#change 'through' to '-'
source_dataset$`Age Range`<-sub('thru','-', source_dataset$`Age Range`, ignore.case=TRUE)
#change '--' to '-'
source_dataset$`Age Range`<-sub('--','-', source_dataset$`Age Range`, ignore.case=TRUE)
source_dataset$`Age Range`<-sub('--','-', source_dataset$`Age Range`, ignore.case=TRUE)
#install tidyr and seperate columns,store in a temp dataframe "dataset_age"
#install.packages("tidyr") here if you don't have it
library("tidyr")
dataset_age<-separate(source_dataset,'Age Range',c('Min_Age','Max_Age'),sep='-')
dataset_age<-dataset_age[,13:14]
#change infants/infants to 0
dataset_age<-sapply(dataset_age,sub,pattern='infants',replacement='0',ignore.case=TRUE)%>%data.frame
dataset_age<-sapply(dataset_age,sub,pattern='infant',replacement='0',ignore.case=TRUE)%>%data.frame
#convert written number to number
source("my_functions.R")
dataset_age<-sapply(dataset_age,convert_to_number)%>%data.frame
