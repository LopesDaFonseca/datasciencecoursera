# This script returns one tidy dataset for the UCI HAR Dataset and aggregate mean values

# Data can be downloaded from:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# Unzip the folder and do not change the structure or files/folders names

# Dataset includes data on X (the variables measured in the Time Frequency domain), Y (activities performed) and Subject's IDs.
# Dataset is subset to extract measurements related to the mean and standard deviation of each measurement.
# Aggregate mean values are output for the dataset, by activity and subject.

#---------------------------------------------------------------------

# Set the Working Directory as the UCI HAR Dataset folder
# 'directory' is a character vector indicating the location of the files and folders with the Samsung Data
# copy the path for the UCI HAR Dataset folder and replace the current path inside the parentheses in the following line


directory<-setwd("D:/Courses/Coursera/8 Getting and Cleaning Data/Project/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset")

files<-list.files(directory)
train.file.path<-paste(directory,"//", "train", sep="")
test.file.path<-paste(directory,"//", "test", sep="")

#---------------------------------------------------------------------
# Part 1 - Merges the training and the test sets to create one dataset
# Reads the data and creates one dataframe  with train and test data for X, y and subject

xtrain <- read.table(paste(train.file.path,"/", "X_train.txt", sep=""), quote="\"")
xtest <- read.table(paste(test.file.path,"/", "X_test.txt", sep=""), quote="\"")

ytrain <- read.table(paste(train.file.path,"/", "Y_train.txt", sep=""), quote="\"")
ytest <- read.table(paste(test.file.path,"/", "Y_test.txt", sep=""), quote="\"")

subjecttrain <- read.table(paste(train.file.path,"/", "subject_train.txt", sep=""), quote="\"")
subjecttest <- read.table(paste(test.file.path,"/", "subject_test.txt", sep=""), quote="\"")

alldata<-cbind(rbind(xtrain,xtest),rbind(ytrain,ytest),rbind(subjecttrain,subjecttest))


#------------------------------------------------------------------------------------------------
# Part 2 - Extracts only the measurements on the mean and standard deviation for each measurement
# Reads the headings so mean and std related variables can be selected

features <- read.table("features.txt", quote="\"")

# Adds y and subject heading to the end of existing features table with the description of Xs
V1<-562L
V2<-c("activity")
yfeature<-data.frame(cbind(V1,V2))
yfeature$V1<- as.integer(yfeature$V1)

V1<-563L
V2<-c("subject")
subjectfeature<-data.frame(cbind(V1,V2))
subjectfeature$V1<- as.integer(subjectfeature$V1)

allfeatures<-rbind(features,yfeature,subjectfeature)
allfeatures$V1[562]<-562L
allfeatures$V1[563]<-563L

# Labels the columns in the dataset 
names(alldata)<-allfeatures$V2


# Subsets data for measurements on the mean() and std() measurements 
# Makes sure that there are no issues with lower/upper case letters in finding mean() and std()

names(alldata)<-tolower(names(alldata))
meanandstdcol<-grep("mean\\(\\)|std\\(\\)",names(alldata))
meanandstddata<-cbind(subset(alldata,select=meanandstdcol), subset(alldata, select=activity),subset(alldata, select=subject))


# Tidies up header names
names(meanandstddata)<-gsub("-","",names(meanandstddata))
names(meanandstddata)<-gsub("\\(\\)","",names(meanandstddata))


#-------------------------------------------------------------------------------
# Part 3 - Uses descriptive activity names to name the activities in the dataset
# Gets the description of activities

activitylabels <- read.table("activity_labels.txt", quote="\"")

# Tidies up and corrects labels
tidyactivitylabels<-gsub("LAY", "LY",activitylabels$V2)
tidyactivitylabels<-data.frame(tidyactivitylabels)
tidyactivitylabels<-gsub("_", " ", tidyactivitylabels$tidyactivitylabels)
tidyactivitylabels<-data.frame(tidyactivitylabels)
tidyactivitylabels<-tolower(tidyactivitylabels$tidyactivitylabels)
tidyactivitylabels<-data.frame(tidyactivitylabels)
tidyactivitylabels<-cbind(activitylabels$V1,tidyactivitylabels)
colnames(tidyactivitylabels)<-c("activity","activityname")

#--------------------------------------------------------------------------
# Part 4 - Appropriately labels the dataset with descriptive activity names
# removes 1st column with activity numbers as dataframe already has column with activity names
tidymeanandstddata<- merge(meanandstddata, tidyactivitylabels)
tidymeanandstddata<-subset(tidymeanandstddata, select=-c(activity))

#---------------------------------------------------------------------------------
# Part 5 - Creates a dataset with the average of each variable for each activity and each subject
# Removes "subject" and "activity" columns from the aggregation analysis, as these are factors
# Creates new dataset making sure that only mean and std related columns are analysed

tidymeancol<-grep("mean",names(tidymeanandstddata))
tidystdcol<-grep("std",names(tidymeanandstddata))
dataforaveraging<-cbind(subset(tidymeanandstddata,select=tidymeancol),subset(tidymeanandstddata,select=tidystdcol))

averages<-aggregate(dataforaveraging, list(tidymeanandstddata$subject,tidymeanandstddata$activityname), mean)

# Tidies up column names
names(averages)<-gsub("Group.1","subject",names(averages))
names(averages)<-gsub("Group.2","activity",names(averages))


#---------------------------------------------------
# Exports tables as text files, tab separated values
write.table(tidymeanandstddata,file="tidyprojectdata.txt", sep="\t", row.names=FALSE)
write.table(averages,file="tidyaverages.txt", sep="\t", row.names=FALSE)

