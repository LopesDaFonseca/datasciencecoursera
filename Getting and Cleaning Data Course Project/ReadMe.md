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


The downloaded dataset also has Inertia Signals data which are not included in the tidy dataset because this is meant to only include mean and standard deviation measures of the signals' measurements, which were coded as mean() and std(). Thus, this excludes other variables that contain the word "mean" but are composite measures (derived as weighted average of frequency or in windows), and therefore excluded. See codebook for a complete list of variables selected for the analysis.


###The run_analysis script written in R will produce:###

* A tidy dataset with selected variables related to the mean and standard deviation of measurements of sensor signals (accelerometer and gyroscope) (original data described in the CodeBook).   

* derived dataset with the average of each variable for each activity and each subject


##Script is organized in 5 parts:##

###Part 1 -### Merges the training and the test sets for X, Y (activity) and subject


###Part 2 -### Extracts only the measurements on the mean and standard deviation for each signal measurement


###Part 3 -### Uses descriptive activity names to label the activities in the dataset


###Part 4 -### Labels the dataset with descriptive activity labels (activity names) and

	Outputs the final tidy data set, which results in 10299 observations and 68 columns (66 variables + 2 factors)

  ####Variables####
1 tbodyaccmeanx
2 tbodyaccmeany
3 tbodyaccmeanz
4 tbodyaccstdx
5 tbodyaccstdy
6 tbodyaccstdz
7 tgravityaccmeanx
8 tgravityaccmeany
9 tgravityaccmeanz
10 tgravityaccstdx
11 tgravityaccstdy
12 tgravityaccstdz
13 tbodyaccjerkmeanx
14 tbodyaccjerkmeany
15 tbodyaccjerkmeanz
16 tbodyaccjerkstdx
17 tbodyaccjerkstdy
18 tbodyaccjerkstdz
19 tbodygyromeanx
20 tbodygyromeany
21 tbodygyromeanz
22 tbodygyrostdx
23 tbodygyrostdy
24 tbodygyrostdz
25 tbodygyrojerkmeanx
26 tbodygyrojerkmeany
27 tbodygyrojerkmeanz
28 tbodygyrojerkstdx
29 tbodygyrojerkstdy
30 tbodygyrojerkstdz
31 tbodyaccmagmean
32 tbodyaccmagstd
33 tgravityaccmagmean
34 tgravityaccmagstd
35 tbodyaccjerkmagmean
36 tbodyaccjerkmagstd
37 tbodygyromagmean
38 tbodygyromagstd
39 tbodygyrojerkmagmean
40 tbodygyrojerkmagstd
41 fbodyaccmeanx
42 fbodyaccmeany
43 fbodyaccmeanz
44 fbodyaccstdx
45 fbodyaccstdy
46 fbodyaccstdz
47 fbodyaccjerkmeanx
48 fbodyaccjerkmeany
49 fbodyaccjerkmeanz
50 fbodyaccjerkstdx
51 fbodyaccjerkstdy
52 fbodyaccjerkstdz
53 fbodygyromeanx
54 fbodygyromeany
55 fbodygyromeanz
56 fbodygyrostdx
57 fbodygyrostdy
58 fbodygyrostdz
59 fbodyaccmagmean
60 fbodyaccmagstd
61 fbodybodyaccjerkmagmean
62 fbodybodyaccjerkmagstd
63 fbodybodygyromagmean
64 fbodybodygyromagstd
65 fbodybodygyrojerkmagmean
66 fbodybodygyrojerkmagstd
    
  ####Factors####
67 subject    
68 activityname


------------------------------------------------
###Part 5 -### Creates a dataset with the average of each variable for each activity and each subject



## In addition to the CodeBook, you can find 2 text files with tab separated values with the output from the run_analysis.R script:##
* tidyprojectdata.txt
* tidyaverages.txt


