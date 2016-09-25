## Script file for the Getting and Cleaning project
## Place this file in the same working directory as the UCI HAR Dataset directory

## Download the compressed datasets
fileurl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, "FUCIHAR20Dataset.zip", method = "curl" )

## Uncompress the data sets
unzip ("FUCIHAR20Dataset.zip", exdir = ".")

## Load the training datasets
train_data <- read.table ("./UCI HAR Dataset/train/X_train.txt")
dim(train_data)
train_labels <- read.table ("./UCI HAR Dataset/train/y_train.txt")
train_subjects <- read.table ("./UCI HAR Dataset/train/subject_train.txt")

## Load the test datasets
test_data <- read.table("./UCI HAR Dataset/test/X_test.txt")
dim(test_data)
test_labels <- read.table("./UCI HAR Dataset/test/y_test.txt")
test_subjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Get the names of the features from the features.txt
features_list <- read.table ("./UCI HAR Dataset/features.txt")
features_list[ ,2] <- as.character(features_list[ ,2])

# Filter for the measuremets needed for the data set
# Measurements needed are mean and std deviation of each measurement

measurements_needed <- grep("mean\\(\\)|std\\(\\)", features_list[ ,2]) 
measurement_labels <- features_list[measurements_needed, 2]

## Clean up the label names
msrmnt_labels_cleaned <- gsub("-mean", "Mean", measurement_labels) # Substitute -mean with Mean
msrmnt_labels_cleaned <- gsub("-std", "StdDev", msrmnt_labels_cleaned) # Substitute -std with Std
msrmnt_labels_cleaned <- gsub("[-()]", "", msrmnt_labels_cleaned) # Remove ()
  
# Get the names of the activities from the activity_labels.txt
activity_list <- read.table ("./UCI HAR Dataset/activity_labels.txt")
activity_list[ ,2] <- tolower (as.character(activity_list[, 2]))

## Filter and retain only mean and std values in the dataset
traindata_filtered <- train_data [, measurements_needed]
testdata_filtered <- test_data[, measurements_needed]
dim(traindata_filtered)
dim(testdata_filtered)

# Combine all the test datasets
testData <- cbind(test_subjects, test_labels, testdata_filtered)
dim(testData) 

# Combine all the train datasets
trainData <- cbind(train_subjects, train_labels, traindata_filtered)
dim(trainData) 

# Combine thet test and train datasets and label the columns
cleandata <- rbind(trainData, testData)
dim(cleandata)
colnames(cleandata) <- c("Subject", "Activity", msrmnt_labels_cleaned)

# Write out the clean dataset before minimization
write.table(cleandata, "clean_data.txt") 

# Create a tidy data set with with the average of each variable 
# for each activity and each subject
tidydataset <- aggregate(. ~Subject + Activity, cleandata, mean)
tidydataset <- tidydataset[order(tidydataset$Subject, tidydataset$Activity),]

## Replace Activity code with the activity name
tidydataset$Activity <- activity_list[,2][match(tidydataset$Activity, activity_list[,1])]
dim(tidydataset)

# Write out the tidy data set
write.table(tidydataset, "tidy_data.txt", row.names = FALSE, quote = FALSE, sep = "\t")




