Important: run_Analysis.R must be in the same folder as the folder "getdata-projectfiles-UCI HAR Dataset".

Script run_analysis.R creates a new, tidy data set from the raw data 
set of UCI HAR. In the assignment description it is not required to do 
the tasks

	1. Merges the training and the test sets to create one data set.
	2. Extracts only the measurements on the mean and standard deviation
		 for each measurement.
	3. Uses descriptive activity names to name the activities in the data set
	4. Appropriately labels the data set with descriptive variable names.
	5. From the data set in step 4, creates a second, independent tidy 
		data set with the average of each variable for each activity 
		and each subject.
 
in this order so the order was free to choose as long as the final data set
from task 5 is as desired. The script run_analysis.R must be in the same
 folder as folder "getdata-projectfiles-UCI HAR Dataset" and does the following:

.) Task 1: Reads in train and test data. Note that data from "Inertial Signals" is not 
	read in since it is not relevant for this assignment. The data is 
	merged to one big data frame.

.) Task 4: Labels the data set with descriptive variable names from "features.txt"

.) Task 3: Makes subject and activity to factor variables. Creates descriptive activity names 
	to name the activities as in "activity_labels.txt".

.) Task 2: Task 2 "Extracts only the measurements on the mean and standard 
	deviation for each measurement" was interpreted as follows: Every 
	collum name that contains either "std()" or "mean()" is kept in the 
        data set, all other collums (except for "activity" and "subject") 
	are dropped.

.) Task 5: Creates a second, independent tidy data set "newUCI_HAR_data.csv" with 
	the average of each variable for each activity and each subject. Column 
	names have been added "avg_" in the beginning.
