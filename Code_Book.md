# Code Book for Assignment of Getting and Cleaning Data Course Project
Stella Li
June 10, 2017

Part 1. Code Book
=================

The data of this assignment is from the research, \'93human activity recognition using smartphones dataset\'94, by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Onto from Smartlab.

Download like for the dataset:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### The dataset includes the following files:
- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

##### Notes: 

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

According to their research description, the experiments "have been carried out with a group of 30 volunteers with an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist."

There are two types of sensor signals: accelerometer and gyroscope. Signals were pre-processed and sampled at 128 readings/window. The raw time domain signals were collected and processed to derive body and gravity acceleration signals, Jerk signals, their magnitude, and frequency domain signals.

### In the processed datasets, for each record it is provided a list of variables:
1. "Activity": one of the six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
2. "Subject": An identifier of the subject who carried out the experiment. Its range is from 1 to 30.
3. 66 feature variables from the accelerometer and gyroscope (see below):
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- timeBodyAccelaration-XYZ
- timeGravityAccelaration-XYZ
- timeBodyAccelarationJerk-XYZ
- timeBodyAngularVelocity-XYZ
- timeBodyAngularVelocityJerk-XYZ
- timeBodyAccelarationMagnitude
- timeGravityAccelarationMagnitude
- timeBodyAccelarationJerkMagnitude
- timeBodyAngularVelocityMagnitude
- timeBodyAngularVelocityJerkMagnitude
- frequencyBodyAccelaration-XYZ
- frequencyBodyAccelarationJerk-XYZ
- frequencyBodyAngularVelocity-XYZ
- frequencyBodyAccelarationMagnitude
- frequencyBodyBodyAccelarationJerkMagnitude
- frequencyBodyBodyAngularVelocityMagnitude
- frequencyBodyBodyAngularVelocityJerkMagnitude

There are also some variables were estimated from these signals. In the tidy datasets (task4_finaldata and task5_tidydata), only two sets were kept:
- mean(): Mean value
- std(): Standard deviation

### There are two datasets for this assignment:
"task4_finaldata.txt": Processed dataset as described by project requirements with descriptive lables.
"task5_tidydata.txt" : A dataset generated from 'task4_finaldata.txt' with the average of each variable for each activity and each subject. 

Part 2. Instruction List
========================
Task 1. Merges the training and the test sets to create one data set

- Step 1.1 Load files into R
Set working directory and then load the following files:
./train/X_train.txt
./train/y_train.txt
./train/subject_train.txt
./test/X_test.txt
./test/y_test.txt
./test/subject_test.txt

- Step 1.2 Merge the three training datasets together 

- Step 1.3 Merge the three test datasets together

- Step 1.4 Combine training and test sets to create "totaldata"

Task 2. Extracts only the measurements on the mean and standard deviation for each measurement
- Step 2.1 Read the feature.txt table to understand which features(measurements) are related to mean and std

- Step 2.2 Get the index of which rows in features.txt contain "mean(\'93 or "std"\
Note: since there are variables with \'93meanFreq\'94 in their names, need to use 'mean(' to distinguish 'mean' from 'meanFreq'

- Step 2.3 Extract the columns in totaldata

Task 3. Uses descriptive activity names to name the activities in the data set
- Step 3.1 Load the activity_labels.txt file

- Step 3.2 Turn activities into factors and use descriptive activity names

Task 4. Appropriately labels the data set with descriptive variable names
- Step 4.1 Extract names of all the measures

- Step 4.2 Change feature names to descriptive variable names:
	- delete the '()' in names
	- substitute 'Acc' with 'Accelaration'
	- substitute 'Mag' with 'Magnitude'
	- substitute \'Gyro' with 'AngularVelocity'
	- substitute the 't' and 'f' at the beginning of the names with 'time' 'frequency'

- Step 4.3 Label the measures with descriptive variable names

Task 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
- Step 5.1 Make subjects into factors

- Step 5.2 reshape data with the average of each variable for each activity and each subject

- Finally, write two files
task4_finaldata.txt
task5_tidydata.txt
