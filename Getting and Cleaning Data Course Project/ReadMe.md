##Running the script run_analysis.R##

* To run the script unzip the "getdata-projectfiles- UCI HAR dataset" folder described in the CodeBook and set the Working Directory  in R as the folder that contains the Human Recognition Activities using Smartphones data set (UCI HAR dataset). 
Do not change the name of any of the files/folders as this will stop the script from producing the desired output.

* Copy the script to that folder and open it in R or RStudio.

* Copy the directory path onto the 1st line of code that sets the directory (replacing the current one).


**_The UCI HAR dataset should contain at least the following files/pathways:_**

- 'train/X_train.txt': Training set.

- 'test/X_test.txt': Test set.

- 'train/y_train.txt': Training labels.

- 'test/y_test.txt': Test labels.

- 'train/subject_train.txt': subject ID of who performed the activity for each window sample. Its range is from 1 to 30.
 
- 'test/subject_test.txt': subject ID of who performed the activity for each window sample. Its range is from 1 to 30.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.


The downloaded dataset also has Inertia Signals data which are not included in the tidy dataset because this is meant to only include mean and standard deviation measures of the signals' measurements, which were coded as mean() and std(). Thus, this excludes other variables that contain the word "mean" but are composite measures (derived as weighted average of frequency or in a signal window sample), and are therefore excluded. Check the features.txt file in the unzipped data folder or from this repo (https://github.com/LopesDaFonseca/datasciencecoursera/blob/master/Getting%20and%20Cleaning%20Data%20Course%20Project/features.txt) for a complete list of variables avaliable for analysis.


###The run_analysis script written in R will produce:###

* A tidy dataset with selected variables related to the mean and standard deviation of measurements of sensor signals (accelerometer and gyroscope) (original data described in the CodeBook).   

* A derived dataset with the average of each variable for each activity and each subject


##Script is organized in 5 parts:##

###Part 1 - Merges the training and the test sets for X, Y (activity) and subject


###Part 2 - Extracts only the measurements on the mean and standard deviation for each signal measurement


###Part 3 - Uses descriptive activity names to label the activities in the dataset


###Part 4 - Labels the dataset with descriptive activity labels (activity names)

 * Outputs the final tidy data set, which results in 10299 observations and 68 columns (66 variables + 2 factors)


------------------------------------------------------------
###List of Output Variables available from the repo (selected_features.txt) or from this link:
 
https://github.com/LopesDaFonseca/datasciencecoursera/blob/master/Getting%20and%20Cleaning%20Data%20Course%20Project/selected_features.txt

------------------------------------------------
###Part 5 - Creates a dataset with the average of each variable for each activity and each subject


---------------------------------------------------------
###The Getting and Cleaning Data Course Project repo contains:
* CodeBook.md with a description of the original data and the transformations made in the process of cleaning and subsetting the dataset
* features.txt listing the 561 variables available in the original downloaded UCI HAR Datset
* selected_features.txt listing the variables selected for analysis (mean and std measures)
* run_analysis.R script with the code to clean and select some variables and calculate aggregate averages
* tidyprojectdata.txt with the clean data output from running the script
* tidyaverages.txt with the aggregate mean values by activity and subject�s ID


