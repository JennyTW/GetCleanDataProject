---
title: "README.md"
author: "Jenny Chen"
---

Thank you for the review!
This repository contains 4 files

1. README.md      : describing how the script works.
2. CodeBook.md    : describing the variables.
3. run_analysis.R : the script to process the raw data into tidy data set.
4. NewTidyData    : the final tidy data set containing 180 observations with 81 variables.

# Following are steps to process raw data into tidy data set to achieve following 5 goals:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##(1) load all txt file into R objects.
In this step, we load 6 txt files need to be used for following steps, inclding:
- subject_test.txt
- y_test.txt
- X_test.txt
- subject_train.txt
- y_train.txt
- x_train.txt


##(2) Extracts only the measurements on the mean and standard deviation for each measurement.(Goal#2)  

1. Load the list of feature of from features.txt
2. Substract the list of features contain keywords "mean" or "std"
3. SubSet the Training and Testing data set with only mean and standard deviation measurement.


##(3) Merges the training and the test sets to create one data set. (Goal#1)

Use cbind() to bind SubjectID, Activity, and related measurements.
Use rbind() to bind tranning and test data set together into new data set "data_All".


##(4) Appropriately labels the data set with descriptive variable names. (Goal#4)

Assign the descriptive variable name to the merged data set.


##(5) Uses descriptive activity names to name the activities in the data set (Goal#3)

Replace the value in Activity column with descriptive activity names.

##(6) From the data set in Goal 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Use dplyr package to group the data set by each subject and each activity, then get the average of measurements for each group.
Finally, load the final tidy data into new text file :NewTidyData.txt 

