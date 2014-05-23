##CodeBook - Getting and Cleaning Data Course Project##

The purpose of this project is to collect and tidy up a dataset on Human Activity Recognition Using Smartphones dataset (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 

The objective is to write a script in R that produces a tidy dataset with a selection of variables related to the mean and standard deviation of the measurements from variables in the UCI HAR Dataset, and a derived dataset with the average values of the selected variables aggregated by 2 factors (subject and activity).


###Data

The dataset (UCI HAR Dataset.zip) can be downloaded from that webpage or from the following link :

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip



####Dataset description:####

The following descritption of the database, dataset characteristics and variables were obtained from the abovementioned website. For additional information check also the features_info.txt file in the zipped data folder and the following reference:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012



####_Human Activity Recognition Using Smartphones Data Set Information:_####

Database built from the recordings of 30 subjects performing daily activities of daily living while carrying a waist-mounted smartphone with enbedded inertial sensors.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope,  3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz were captured. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 



####_Feature Selection:_####

The features selected for the database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ

tGravityAcc-XYZ

tBodyAccJerk-XYZ

tBodyGyro-XYZ

tBodyGyroJerk-XYZ

tBodyAccMag

tGravityAccMag

tBodyAccJerkMag

tBodyGyroMag

tBodyGyroJerkMag

fBodyAcc-XYZ

fBodyAccJerk-XYZ

fBodyGyro-XYZ

fBodyAccMag

fBodyAccJerkMag

fBodyGyroMag

fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value

std(): Standard deviation

mad(): Median absolute deviation 

max(): Largest value in array

min(): Smallest value in array

sma(): Signal magnitude area

energy(): Energy measure. Sum of the squares divided by the number of values. 

iqr(): Interquartile range 

entropy(): Signal entropy

arCoeff(): Autorregresion coefficients with Burg order equal to 4

correlation(): correlation coefficient between two signals

maxInds(): index of the frequency component with largest magnitude

meanFreq(): Weighted average of the frequency components to obtain a mean frequency

skewness(): skewness of the frequency domain signal 

kurtosis(): kurtosis of the frequency domain signal 

bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.

angle(): Angle between to vectors.


Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
gravityMean, tBodyAccMean, tBodyAccJerkMean, tBodyGyroMean, tBodyGyroJerkMean.


-------------------------------------------------------------------

Thus, for each record it is provided:
* a 561-feature vector with the time and frequency domain variables, 
* its activity label (from six possible different activities), and
* an identifier of the subject (from 30 possible different subjects).

* Features are normalised and bounded within [-1,1] and,
* Each feature vector is a row on the text file with the data._

---------------------------------------------------------------------


####Data Dictionary####

Check the features.txt file For a full list of names of the 561 features, which is available from the downloaded UCI HAR Dataset or from this repo:

For details on their meaning refer to the Feature Selection which lists the original array names and the measurements derived from the arrays. 


-----------------------------------------------------------------


###Data Selection and Transformation with run_analysis.R###

The script is divided into 5 parts:

* 1 Merges the training and the test sets for X, Y (activity) and subject, making sure that the trainning data comes before the test data for X, Y and subject, so measurements are correctly labelled with the activity and subject who performed activity.


* 2 Extracts only the measurements on the mean and standard deviation for each signal measurement:
selection includes only the mean and standard deviation variables from the 17 different signals in the time and frequency domain. Note that there are variables in the original dataset that include the word "mean" and were excluded from the final tidy dataset - these are related to angle() and meanfreq() and are compound measures related to the angle or to the average weight of the frequency.For a full list of the selected variables check the ReadMe document.


* 3 Tidies up the descriptive activity names necessary to label the activities in the dataset using the activity_labels.txt 
Note that activity 6 seems to have been incorrectly labelled as "LAYING" and thus was replaced with "LYING".


* 4 Labels the dataset with descriptive activity labels (activity names) 
Outputs the final tidy data set, which results in 10299 observations and 68 columns (66 variables + 2 factors)

  
* 5 Creates a dataset with the average of each variable for each activity and each subject

---------------------------------------------------------------------

