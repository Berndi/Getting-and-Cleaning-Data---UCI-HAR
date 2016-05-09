# Reads in test data
# Does not read in test data from "Inertial Signals" since it is not relevant
subject_test <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt");
y_test <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt");
X_test <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt");
# Merges test data
mergedTestData <- cbind(subject_test,y_test,X_test);

# Reads in train data
# Does not read in train data from "Inertial Signals" since it is not relevant
subject_train <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt");
y_train <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt");
X_train <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt");
# Merges train data
mergedTrainData <- cbind(subject_train,y_train,X_train);

# Merges test and train data together (task 1)
mergedData <- rbind(mergedTestData,mergedTrainData);

# Labels the data set with descriptive variable names (task 4)
featureTable <- read.table("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt");
featureList <- as.character(featureTable$V2);
dataHeaders <- c("subject","activity",featureList);
colnames(mergedData) <- dataHeaders;

# Changes subject and activity variable to type factor
# Uses descriptive activity names to name the activities in the data set (task 3)
activityLabels <- c("walking","walking_upstairs","walking_downstairs","sitting","standing","lying");
mergedData$activity <- factor(mergedData$activity,levels = 1:6, labels = activityLabels);
mergedData$subject <- factor(mergedData$subject,levels = 1:30, labels = as.character(levels))

# Task 2: "Extracts only the measurements on the mean and standard deviation for each measurement"
# This is interpreted as follows: 
#     Every collum name that contains either "std()" or "mean()"
#     is kept in the data set, all other collums (except for 
#     "activity" and "subject") are dropped (task 2)
stdMeanIndices <- rep(0,length(names(mergedData)));
stdMeanIndicator <- which(grepl("std()", names(mergedData)) | grepl("mean()", names(mergedData)));
stdMeanIndices <- c(1,2,stdMeanIndicator);
mergedData <- mergedData[,stdMeanIndices];

# Creates a second, independent tidy data set "newUCI_HAR_data.csv" with the average 
# of each variable for each activity and each subject (task 5)
splittedMergedData <- split(mergedData,list(mergedData$subject,mergedData$activity))
newDataMatrix <- sapply(splittedMergedData, function(x) colMeans(x[,3:81]));
newDataFrame <- as.data.frame(t(newDataMatrix));
# adds the string "avg_" to each column name to make it clear that those are average values
colnames(newDataFrame) <- paste(rep("avg_",79),names(newDataFrame),sep = "");
write.csv(newDataFrame,file="newUCI_HAR_data.csv")
