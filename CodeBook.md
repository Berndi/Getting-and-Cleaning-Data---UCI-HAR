Codebook – newUCI_HAR_data.csv
About the Data
The data set newUCI_HAR_data is a modified and cleaned version of the UCI HAR data set [1]. 
In the UCI HAR data set, experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 
In the newUCI_HAR_data data set, each row corresponds to a combination of the 30 subjects and the 6 activities which gives 30*6=180 rows in total. Each column corresponds to a feature as it is in [1] but only features containing “mean()” or “std()” are considered in the newUCI_HAR_data data set. The entry of a cell is equal to the average value of the corresponding feature for the corresponding combination of subject and activity.

Variables:
Every feature in [1] that contains “mean()” or “std()” in its name corresponds 1:1 to a variable in newUCI_HAR_data data set. The name of this variable is identical except that the string “avg_” is added at the beginning to highlight that the variable represents an average value. For example, “tBodyAcc-mean()-X” is a variable that is contained in [1] and that contains “mean()” in its name. Therefore, there is a variable “avg_tBodyAcc-mean()-X” in the newUCI_HAR_data data set. There are 79 columns in total in the newUCI_HAR_data data set.
Each row name is of the form x.[activity], where x is a number between 1 and 30 representing the subjects (i.e. the volunteers) and [activity] is one of the following:
•	walking
•	walking_upstairs
•	walking_downstairs
•	sitting
•	standing
•	lying
For example, a row name is “14.standing”. In total there are 30*6 = 180 rows, so therefore the data set 180 rows and 79 columns.
Transformations carried out:
Script run_analysis.R creates the new, tidy data set newUCI_HAR_data.csv from the raw data set of UCI HAR. In the assignment description it is not required to do the steps
	1. Merges the training and the test sets to create one data set.
	2. Extracts only the measurements on the mean and standard deviation
		 for each measurement.
	3. Uses descriptive activity names to name the activities in the data set
	4. Appropriately labels the data set with descriptive variable names.
	5. From the data set in step 4, creates a second, independent tidy 
		data set with the average of each variable for each activity 
		and each subject.
in this order, so the order was free to choose as long as the final data set from task 5 is as desired. The script run_analysis.R must be in the same folder as folder "getdata-projectfiles-UCI HAR Dataset" in order to work and does the following: 
•	Task 1: Reads in train and test data. Note that data from "Inertial Signals" is not 	read in since it is not relevant for this assignment. The data is merged to one big data frame.
•	Task 4: Labels the data set with descriptive variable names from "features.txt".
•	Task 3: Makes subject and activity to factor variables. Creates descriptive activity names to name the activities as in "activity_labels.txt".
•	Task 2: Task 2 "Extracts only the measurements on the mean and standard deviation for each measurement" was interpreted as follows: Every collum name that contains either "std()" or "mean()" is kept in the data set, all other columns (except for "activity" and "subject") are dropped.
•	Task 5: Creates a second, independent tidy data set "newUCI_HAR_data.csv" with the average of each variable for each activity and each subject. Column names have been added "avg_" in the beginning.
References:
[1]	http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
