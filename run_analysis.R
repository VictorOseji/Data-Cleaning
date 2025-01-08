##====================================================================
# Load necessary library
# Install required packages if not already installed
if (!require("dplyr")) install.packages("dplyr")
if (!require("stringr")) install.packages("stringr")

library(dplyr)
library(stringr)

# Step 1: Download and unzip dataset
# Define the URL for downloading the dataset
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download_dir <- "UCI_HAR_Dataset.zip"

if (!file.exists(download_dir)) {
  download.file(url, download_dir)
}

if (!file.exists("UCI HAR Dataset")) {
  unzip(download_dir)
}

# Step 2: Load activity labels and features
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("ActivityID", "Activity"))
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("FeatureID", "Feature"))

# Step 3: Load and label test and train datasets
# Load the test data
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Load the train data
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Assign column names to the test and train datasets based on the features
colnames(X_test) <- features$Feature
colnames(X_train) <- features$Feature

# Merge the test and train datasets
X_data <- bind_rows(X_train, X_test)
Y_data <- bind_rows(Y_train, Y_test)
subject_data <- bind_rows(subject_test, subject_train)

# Step 4: Add Descriptive Activity Names
# Merge Y_data and activity_labels to get activity names
Y_data <- left_join(Y_data, activity_labels, by = c("V1" = "ActivityID"))
colnames(Y_data) <- c("ActivityID", "Activity")

# Step 5: Merge all data and Extract Only Mean and Standard Deviation Measurements
full_data <- cbind(subject_data, Y_data$Activity, X_data) %>% 
  select(1,2, contains(c('mean','std')))
colnames(full_data)[1:2] <- c("Subject", "Activity")

# Now you have a dataset with columns: Subject, Activity, and all features

# Step 6: Label the Dataset with Descriptive Variable Names
names(full_data) <- gsub("^t", "Time", names(full_data))
names(full_data) <- gsub("^f", "Frequency", names(full_data))
names(full_data) <- gsub("Acc", "Accelerometer", names(full_data))
names(full_data) <- gsub("Gyro", "Gyroscope", names(full_data))
names(full_data) <- gsub("Mag", "Magnitude", names(full_data))
names(full_data) <- gsub("-mean\\(\\)", "-Mean", names(full_data))
names(full_data) <- gsub("-std\\(\\)", "-STD", names(full_data))
names(full_data) <- gsub("-", "", names(full_data))

###############################################################################################
# Step 7: Extract Only Mean and Standard Deviation Measurements 
Summary_data <- full_data  %>% 
  summarise(across(everything(),mean),.by = c(Subject,Activity))

# Step 8: Write Tidy Dataset to a File
write.table(Summary_data, "tidy_data.txt", row.name = FALSE)

# Detect the presence of other objects in the global environment except for 'Summary_data' and
# remove all other objects from the global environment
rm(list = ls()[!ls() %in% 'Summary_data']) 

gc() # clean the memory consumed
