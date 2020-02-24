# Coursera_Data_Cleaning
Coursera Assignment

This readme describes the steps performed to complete the assignment.

Task 1 - Merge datasets

- Load activity_labels.txt and save as vector for later labeling for activity values
- Load features.txt and save as vector to get colnames for datasets

Training data

- Load subject_train.txt to get subject IDs
- Load X_train.txt to get measurements
- Load y_train to get activities
- Add Subject IDs to new dataset "train"
- Bind y_train to new dataset to add activities
- Bind X_train to new dataset to add measurements
- Add colnames based on features.txt

Test data

- Repeat part "Training data" for test data and new dataset "test"

Merge datasets

- Check if Colnames are equal for test and train dataset
- Rbind datasets

Task 2 - Extracts only the measurements on the mean and standard deviation for each measurement.

- Get column index for columns that either contain mean() or std()
- Create a single vector of all required column numbers
- Create subset "fulldata" with SubjectID, Activity and only mean and std columns

Task 3 - #Uses descriptive activity names to name the activities in the data set
- Change Activity to Factor and label it based on activity_labels.txt

Task 4 - #Appropriately labels the data set with descriptive variable names.
- Search for shortened patterns within colnames and replace with more descriptive name

Task 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

- Use dplyr to tidy dataset
- Group data by subjectID and Activity
- Summarize all mean and std variables with function mean

- Write final dataset as .txt
