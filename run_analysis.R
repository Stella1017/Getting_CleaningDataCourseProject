## Task 1. Merges the training and the test sets to create one data set
## Step 1.1 Load files into R

setwd("~/Google Drive/Coursera-DataScience/3_Data_Cleaning/Week4/UCI HAR Dataset")
train_x <- read.table("./train/X_train.txt")
train_y <- read.table("./train/y_train.txt")
train_subject <- read.table("./train/subject_train.txt")
test_x <- read.table("./test/X_test.txt")
test_y <- read.table("./test/y_test.txt")
test_subject <- read.table("./test/subject_test.txt")


## Step 1.2 Merge the three training datasets together
names(train_subject) <- c("subject") ## give the colname to train_subject
names(train_y) <- c("activity") ## give the colname to train_y
trainsets <- cbind(train_y, train_subject, train_x) ## combine all the tables 

## Step 1.3 Merge the three test datasets together
names(test_subject) <- c("subject")  ## give the colname to train_subject
names(test_y) <- c("activity")  ## give the colname to train_y
testsets <- cbind(test_y, test_subject, test_x)  ## combine all the tables 

## Step 1.4 Combine training and test sets
totaldata <- rbind(trainsets, testsets) 

## Task 2. Extracts only the measurements on the mean and standard deviation for each measurement
## Step 2.1 Read the feature.txt table to understand which features(measurements) are related to mean and std
featurenames <- read.table("./features.txt")

## Step 2.2 Get the index of which rows in features.txt contain "mean" or "std"
features_index <- grep("std|mean\\(", featurenames$V2)

## Step 2.3 Extract the columns in totaldata
## as the first two columns in totaldata are "activity" and "subject", each element in features_index needs to +2 
## to indicate the right no. of col in totaldata
features_index1 <- features_index + 2
finaldata <- totaldata[ , c(1, 2, features_index1)]

## Task 3. Uses descriptive activity names to name the activities in the data set
## Step 3.1 Load the activity_labels.txt file
activity_labels <- read.table("./activity_labels.txt")

## Step 3.2 Turn activities into factors and use descriptive activity names
finaldata$activity <- factor(finaldata$activity, levels = activity_labels[,1], labels = activity_labels[, 2])

## Task 4. Appropriately labels the data set with descriptive variable names
## Step 4.1 Extract names of all the measures
featurenames_wanted <- as.character(featurenames[c(features_index), 2])

## Step 4.2 Change feature names to descriptive variable names
featurenames_wanted <- gsub("\\()", "", featurenames_wanted)  ## delete the "()" in the names
featurenames_wanted <- gsub("Acc", "Accelaration", featurenames_wanted)
featurenames_wanted <- gsub("Mag", "Magnitude", featurenames_wanted)
featurenames_wanted <- gsub("Gyro", "AngularVelocity", featurenames_wanted)
featurenames_wanted <- gsub("^t", "time", featurenames_wanted)
featurenames_wanted <- gsub("^f", "frequency", featurenames_wanted)

## Step 4.3 Label the measures with descriptive variable names
names(finaldata) <- c("activity", "subject", featurenames_wanted)

## Task 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
## for each activity and each subject.
## Step 5.1 Make subjects into factors
finaldata$subject <- as.factor(finaldata$subject)

## Step 5.2 reshape data
library(reshape2)
data_melted <- melt(finaldata, id = c("activity", "subject"))
tidydata <- dcast(data_melted, activity + subject ~ variable, mean)

## Finally, write two files
write.table(finaldata, "./task4_finaldata.txt", row.names = FALSE, quote = FALSE)
write.table(tidydata, "./task5_tidydata.txt", row.names = FALSE, quote = FALSE)
