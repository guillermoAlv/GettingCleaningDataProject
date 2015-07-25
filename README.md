Coursera: getting-cleaning-data Project
=======================================
An R script called run_analysis.R that does the following:

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive activity names.
Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Additional Info:

VARIABLES USED:
testData: table readed from X_test.txt
trainData: table readed from X_train.txt
totalData: result of bind trainData and testData

testSubj: table readed from subject_test.txt
trainSubj: table readed from subject_train.txt
totalSubj: result of bind trainSubj and testSubj

testLabel: table readed from y_test.txt
trainLabel: table readed from y_train.txt
totalLabel: result of bind trainLabel and testLabel

