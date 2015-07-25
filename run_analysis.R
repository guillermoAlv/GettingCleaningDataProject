library(data.table)

#In the next twelve line we are going to merge training and test set to create a new dataset:
testData <- read.table("./test/X_test.txt")
trainData <- read.table("./train/X_train.txt")
totalData <- rbind(trainData, testData)

testSubj <- read.table("./test/subject_test.txt")
trainSubj <- read.table("./train/subject_train.txt")
totalSubj <- rbind(trainSubj, testSubj)

testLabel <- read.table("./test/y_test.txt")
trainLabel <- read.table("./train/y_train.txt")
totalLabel <- rbind(trainLabel, testLabel)


# 2. Extracts only the measurements on the mean and standard deviation for each measurement:
featuresLst <- read.table("features.txt")
names(featuresLst) <- c('f_Id', 'f_Name')
index_features <- grep("-mean\\(\\)|-std\\(\\)", featuresLst$f_Name)
totalData <- totalData[, index_features] 
# 3. Uses descriptive activity names to name the activities in the data set:
names(x) <- gsub("\\(|\\)", "", (features[index_features, 2]))

#4. Appropriately labels the data set with descriptive activity names:
activities <- read.table("activity_labels.txt")
names(activities) <- c('Act_Id', 'Act_Name')
totalLabel[,1] <- activities[totalLabel[,1], 2]
names(totalLabel) <- "activity"
names(totalSubj) <- "subject"

# Combines data table
finalTowrite <- cbind(totalSubj, totalLabel, totalData)

# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject:
p <- finalTowrite[, 3:dim(finalTowrite)[2]] 
AVGSetTidy <- aggregate(p,list(finalTowrite$subject, finalTowrite$activity), mean)


names(AVGSetTidy)[1] <- "subject"
names(AVGSetTidy)[2] <- "activity"

write.table(finalTowrite, file="tidyDataFile.txt", row.names=FALSE)
write.table(AVGSetTidy, file="tidyDataFileAVG")


