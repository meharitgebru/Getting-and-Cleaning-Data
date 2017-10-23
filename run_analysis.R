# Getting and Cleaning Data Course Project
# By MG, 10/20/2017


# Project information 
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
#
# Here are the data for the project:
#  
#  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#
#You should create one R script called run_analysis.R that does the following.
#
# 1.Merges the training and the test sets to create one data set.
# 2.Extracts only the measurements on the mean and standard deviation for each measurement.
# 3.Uses descriptive activity names to name the activities in the data set
# 4.Appropriately labels the data set with descriptive variable names.
# 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# 1.Merges the training and the test sets to create one data set.

# Set Working Directory
workingDir<-"C:/_R/data/UCI HAR Dataset"
setwd(workingDir)

#read Training and test data
subjectTrain  <-read.table("./train/subject_train.txt")
xTrain <- read.table("./train/X_train.txt")
yTrain <- read.table("./train/y_train.txt")
subjectTest <-read.table("./test/subject_test.txt")
xTest <- read.table("./test/X_test.txt")
yTest <- read.table("./test/y_test.txt")

#Before merging the data, Let's give proper coloum name
#Get feature information for x coloumn name

features <- read.table("./features.txt")

#Update X colomn name using features data
colnames(xTrain) <- features[,2]
colnames(xTest) <- features[,2]

colnames(yTrain) <- "activityId"
colnames(yTest) <- "activityId"

colnames(subjectTest) <- "subject"
colnames(subjectTrain) <- "subject"

#Merge the data
#Fist merge coloumns then rows
trainData <- cbind(yTrain,subjectTrain,xTrain)
testData <- cbind(yTest,subjectTest,xTest)

tidyData <- rbind(trainData,testData)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.

# search for mean and std in coloumn names
# Subject and ActivityID should be included
meanAndStd <-tidyData[,grepl("mean|std|subject|activityId",colnames(tidyData))]

## 3. Uses descriptive activity names to name the activities in the data set

#read actvity label data 
activityLabel <- read.table("./activity_labels.txt")
#give a proper name for coloumns 
colnames(activityLabel)<-c("activityId","activityType")

#join the two table by activity ID
meanAndStd <- join(meanAndStd, activityLabel, by = "activityId")

#remove activity id, since we have activity type
meanAndStd <-meanAndStd[,-1]

## 4. Appropriately labels the data set with descriptive variable names.

#remove parentheses
names(meanAndStd)<gsub("\\(|\\)","",names(meanAndStd),perl=TRUE)
names(meanAndStd) <- make.names(names(meanAndStd))

#change abbrivated names into more descriptive
names(meanAndStd) <- gsub("Acc", "Acceleration", names(meanAndStd))
names(meanAndStd) <- gsub("^t", "Time", names(meanAndStd))
names(meanAndStd) <- gsub("^f", "Frequency", names(meanAndStd))
names(meanAndStd) <- gsub("BodyBody", "Body", names(meanAndStd))
names(meanAndStd) <- gsub("mean", "Mean", names(meanAndStd))
names(meanAndStd) <- gsub("std", "Std", names(meanAndStd))
names(meanAndStd) <- gsub("Freq", "Frequency", names(meanAndStd))
names(meanAndStd) <- gsub("Mag", "Magnitude", names(meanAndStd))

## 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidyAverage<- ddply(meanAndStd, c("subject","activityType"), numcolwise(mean))
