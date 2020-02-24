#Task 1 - Merge datasets


setwd("/Users/andre/OneDrive/Transfer/Coursera/Tasks/Getting and Cleaning Data/Course_Project/Data Cleaning/data")

#load activity labels
activity_lab <- read.table("activity_labels.txt")
activity_lab <- as.vector(activity_lab$V2)

#load features
features <- read.table("features.txt")
features <- as.vector(features$V2)

#Train dataset
setwd("/Users/andre/OneDrive/Transfer/Coursera/Tasks/Getting and Cleaning Data/Course_Project/Data Cleaning/data/train")


#load subject train
subject_train <- read.table("subject_train.txt")

#load X_train & y_train
X_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")

#Subject is the ID of the participant
#y_train is the type of activity
#Features is the Colnames of X_train

#Creating train dataset
#Add Subject ID
train <- data.frame(subject_train)
colnames(train) <- "SubjectID"

#Add Activity
train <- cbind(train, y_train)
colnames(train)[2] <- "Activity"


#Add Measurement data
train <- cbind(train, X_train)
#Add Colnames for measurement data
colnames(train)[3:563] <- features

#clear memory
rm(subject_train,X_train,y_train)


#Preparation of train for matching is finished

#Prepare test dataset
#Test dataset
setwd("/Users/andre/OneDrive/Transfer/Coursera/Tasks/Getting and Cleaning Data/Course_Project/Data Cleaning/data/test")


#load subject test
subject_test <- read.table("subject_test.txt")

#load X_test & y_test
X_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")

#Subject is the ID of the participant
#y_test is the type of activity
#Features is the Colnames of X_test

#Creating test dataset
#Add Subject ID
test <- data.frame(subject_test)
colnames(test) <- "SubjectID"

#Add Activity
test <- cbind(test, y_test)
colnames(test)[2] <- "Activity"


#Add Measurement data
test <- cbind(test, X_test)
#Add Colnames for measurement data
colnames(test)[3:563] <- features

#clear memory
rm(subject_test,X_test,y_test)

#Merge datasets
#Check, if Colnames match for both datasets
sum(colnames(train) == colnames(test))
#Expected result = 563

#Merge
fulldata <- rbind(train,test)

#Clear Memory
rm(test, train)

#Task 2 - Extracts only the measurements on the mean and 
#standard deviation for each measurement.
library(dplyr)

#Create vectors for colnumbers with mean and std
meancol <- grep("mean()", colnames(fulldata),fixed = TRUE)
stdcol <- grep("std()",colnames(fulldata),fixed = TRUE)
#Create single vector of colnumbers
meanstd <- c(meancol, stdcol)
#Sort colnumbers
meanstd <- sort(meanstd)
#Subset only relevant cols
fulldata <- fulldata[,c(1,2,meanstd)]

#Task 3
#Uses descriptive activity names to name the activities in the data set
#Change Activity to Factor
fulldata$Activity <- factor(fulldata$Activity, labels = activity_lab)


#Task 4
#Appropriately labels the data set with descriptive variable names.
colnames(fulldata) <- gsub("tBodyAcc-mean()-","Time Body Acceleration_mean_Axis-", colnames(fulldata))
colnames(fulldata) <- gsub("tBodyAcc-std()-","Time Body Acceleration_std_Axis-", colnames(fulldata))
colnames(fulldata) <- gsub("tGravityAcc-mean()-","Time Gravity Acceleration_mean_Axis-", colnames(fulldata))
colnames(fulldata) <- gsub("tGravityAcc-std()-","Time Gravity Acceleration_std_Axis-", colnames(fulldata))
colnames(fulldata) <- gsub("tBodyAccJerk-mean()-","Time Body Acceleration Jerk Signals_mean_Axis-", colnames(fulldata))
colnames(fulldata) <- gsub("tBodyAccJerk-std()-","Time Body Acceleration Jerk Signals_std_Axis-", colnames(fulldata))
colnames(fulldata) <- gsub("tBodyGyro-mean()-","Time Body Gyrometer_mean_Axis-", colnames(fulldata))
colnames(fulldata) <- gsub("tBodyGyro-std()-","Time Body Gyrometer_std_Axis-", colnames(fulldata))
colnames(fulldata) <- gsub("tBodyGyroJerk-mean()-","Time Body Gyrometer Jerk Signals_mean_Axis-", colnames(fulldata))
colnames(fulldata) <- gsub("tBodyGyroJerk-std()-","Time Body Gyrometer Jerk Signals_std_Axis-", colnames(fulldata))
colnames(fulldata) <- gsub("tBodyAccMag-mean()","Time Body Acceleration Magnet_mean", colnames(fulldata))
colnames(fulldata) <- gsub("tBodyAccMag-std()","Time Body Acceleration Magnet_std", colnames(fulldata))
colnames(fulldata) <- gsub("tGravityAccMag-mean()","Time Gravity Acceleration Magnet_mean", colnames(fulldata))
colnames(fulldata) <- gsub("tGravityAccMag-std()","Time Gravity Acceleration Magnet_std", colnames(fulldata))
colnames(fulldata) <- gsub("tBodyAccJerkMag-mean()","Time Body Acceleration Jerk Signals Magnet_mean", colnames(fulldata))
colnames(fulldata) <- gsub("tBodyAccJerkMag-std()","Time Body Acceleration Jerk Signals Magnet_std", colnames(fulldata))
colnames(fulldata) <- gsub("tBodyGyroMag-mean()","Time Body Gyrometer Magnet_mean", colnames(fulldata))
colnames(fulldata) <- gsub("tBodyGyroMag-std()","Time Body Gyrometer Magnet_std", colnames(fulldata))
colnames(fulldata) <- gsub("tBodyGyroJerkMag-mean()","Time Body Gyrometer Jerk Signals Magnet_mean", colnames(fulldata))
colnames(fulldata) <- gsub("tBodyGyroJerkMag-std()","Time Body Gyrometer Jerk Signals Magnet_std", colnames(fulldata))

colnames(fulldata) <- gsub("fBodyAcc-mean()-","Frequency Body Acceleration_mean_Axis-", colnames(fulldata))
colnames(fulldata) <- gsub("fBodyAcc-std()-","Frequency Body Acceleration_std_Axis-", colnames(fulldata))
colnames(fulldata) <- gsub("fBodyAccJerk-mean()-","Frequency Body Acceleration Jerk Signals_mean_Axis-", colnames(fulldata))
colnames(fulldata) <- gsub("fBodyAccJerk-std()-","Frequency Body Acceleration Jerk Signals_std_Axis-", colnames(fulldata))
colnames(fulldata) <- gsub("fBodyGyro-mean()-","Frequency Body Gyrometer_mean_Axis-", colnames(fulldata))
colnames(fulldata) <- gsub("fBodyGyro-std()-","Frequency Body Gyrometer_std_Axis-", colnames(fulldata))
colnames(fulldata) <- gsub("fBodyAccMag-mean()","Frequency Body Acceleration Magnet_mean", colnames(fulldata))
colnames(fulldata) <- gsub("fBodyAccMag-std()","Frequency Body Acceleration Magnet_std", colnames(fulldata))
colnames(fulldata) <- gsub("fBodyBodyAccJerkMag-mean()","Frequency Body Acceleration Jerk Signals Magnet_mean", colnames(fulldata))
colnames(fulldata) <- gsub("fBodyBodyAccJerkMag-std()","Frequency Body Acceleration Jerk Signals Magnet_std", colnames(fulldata))
colnames(fulldata) <- gsub("fBodyBodyGyroMag-mean()","Frequency Body Gyrometer Magnet_mean", colnames(fulldata))
colnames(fulldata) <- gsub("fBodyBodyGyroMag-std()","Frequency Body Gyrometer Magnet_std", colnames(fulldata))
colnames(fulldata) <- gsub("fBodyBodyGyroJerkMag-mean()","Frequency Body Gyrometer Jerk Signals Magnet_mean", colnames(fulldata))
colnames(fulldata) <- gsub("fBodyBodyGyroJerkMag-std()","Frequency Body Gyrometer Jerk Signals Magnet_std", colnames(fulldata))

#Task 5
#From the data set in step 4, creates a second, independent tidy data set with 
#the average of each variable for each activity and each subject.
fulldatatidy <- fulldata %>% group_by(SubjectID,Activity) %>% summarize_all(mean)
write.table(fulldatatidy,"fulldatatidy.txt", row.names = FALSE)

