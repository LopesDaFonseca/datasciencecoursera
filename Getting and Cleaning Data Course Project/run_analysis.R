# 'directory' is character vector indicating the location of the files and folders with the Samsung Data
# copy the path for the UCI HAR Dataset folder on your computer and paste it inside the parentheses

directory<-setwd("D:/Courses/Coursera/8 Getting and Cleaning Data/Project/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset")

files<-list.files(directory)
train.file.path<-paste(directory,"//", "train", sep="")
test.file.path<-paste(directory,"//", "test", sep="")


#---------------------------------------------------------------------
# Part 1 - Merges the training and the test sets to create one dataset
# Reads the data and creates one dataframe "All.data" with train and test data for X, y and subject

X.train <- read.table(paste(train.file.path,"/", "X_train.txt", sep=""), quote="\"")
X.test <- read.table(paste(test.file.path,"/", "X_test.txt", sep=""), quote="\"")

Y.train <- read.table(paste(train.file.path,"/", "Y_train.txt", sep=""), quote="\"")
Y.test <- read.table(paste(test.file.path,"/", "Y_test.txt", sep=""), quote="\"")

subject.train <- read.table(paste(train.file.path,"/", "subject_train.txt", sep=""), quote="\"")
subject.test <- read.table(paste(test.file.path,"/", "subject_test.txt", sep=""), quote="\"")

All.data<-cbind(rbind(X.train,X.test),rbind(Y.train,Y.test),rbind(subject.train,subject.test))


#------------------------------------------------------------------------------------------------
# Part 2 - Extracts only the measurements on the mean and standard deviation for each measurement
# Gets the headings so mean and std related variables can be selected

features <- read.table("features.txt", quote="\"")

# Adds y and subject heading to the end of existing features table with the description of Xs
V1<-562L
V2<-c("activity")
y.feature<-data.frame(cbind(V1,V2))
y.feature$V1<- as.integer(y.feature$V1)

V1<-563L
V2<-c("subject")
subject.feature<-data.frame(cbind(V1,V2))
subject.feature$V1<- as.integer(subject.feature$V1)

All.features<-rbind(features,y.feature,subject.feature)
All.features$V1[562]<-562L
All.features$V1[563]<-563L

# Labels the columns in the dataset 
names(All.data)<-All.features$V2

# Subsets data for measurements on the mean and std only after making sure that there are no issues with lower/upper case letters
names(All.data)<-tolower(names(All.data))
mean.col<-grep("mean",names(All.data))
std.col<-grep("std",names(All.data))
mean.and.std.data<-cbind(subset(All.data,select=mean.col),subset(All.data,select=std.col), subset(All.data, select=activity),subset(All.data, select=subject))

angle.col<-grep("angle",names(mean.and.std.data))
mean.and.std.data<-subset(mean.and.std.data, select=-(angle.col))


# Tidies up header names
names(mean.and.std.data)<-gsub("-","",names(mean.and.std.data))
names(mean.and.std.data)<-gsub("\\(\\)","",names(mean.and.std.data))


#-------------------------------------------------------------------------------
# Part 3 - Uses descriptive activity names to name the activities in the dataset
# Gets the description of activities

activity.labels <- read.table("activity_labels.txt", quote="\"")

# Tidies up and corrects labels
tidy.activity.labels<-gsub("LAY", "LY",activity.labels$V2)
tidy.activity.labels<-data.frame(tidy.activity.labels)
tidy.activity.labels<-gsub("_", " ", tidy.activity.labels$tidy.activity.labels)
tidy.activity.labels<-data.frame(tidy.activity.labels)
tidy.activity.labels<-tolower(tidy.activity.labels$tidy.activity.labels)
tidy.activity.labels<-data.frame(tidy.activity.labels)
tidy.activity.labels<-cbind(activity.labels$V1,tidy.activity.labels)
colnames(tidy.activity.labels)<-c("activity","activityname")

#--------------------------------------------------------------------------
# Part 4 - Appropriately labels the dataset with descriptive activity names
# removes 1st column with activity numbers as dataframe already has column with activity names
Tidy.mean.and.std.data<- merge(mean.and.std.data, tidy.activity.labels)
Tidy.mean.and.std.data<-subset(Tidy.mean.and.std.data, select=-c(activity))

#---------------------------------------------------------------------------------
# Part 5 - Create a dataset with the average of each variable for each activity and each subject
# To remove "subject" and "activity" from the aggregation analysis, as these are factors
# Creates new dataset making sure that only mean and std related columns are analysed
# Although could just select columns manualy and perform analysis ignoring factor variables:
# averages<-aggregate(Tidy.mean.and.std.data[,1:79], list(Tidy.mean.and.std.data$subject,Tidy.mean.and.std.data$activityname), mean)

Tidy.mean.col<-grep("mean",names(Tidy.mean.and.std.data))
Tidy.std.col<-grep("std",names(Tidy.mean.and.std.data))
data.for.averaging<-cbind(subset(Tidy.mean.and.std.data,select=Tidy.mean.col),subset(Tidy.mean.and.std.data,select=Tidy.std.col))

averages<-aggregate(data.for.averaging, list(Tidy.mean.and.std.data$subject,Tidy.mean.and.std.data$activityname), mean)

# Tidies up column names
names(averages)<-gsub("Group.1","subject",names(averages))
names(averages)<-gsub("Group.2","activity",names(averages))


