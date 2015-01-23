# UCI_wearable
Data collected from the accelerometers from Samsung Galaxy S smartphone which is compressed in this zip file, https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The detailed description on what's in the zip file is in this website, http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

I started by downloading and unzipping the file manually to the working dir. There are four files in the main directory, and three files each in 'Test' and 'Train' directory. Right away, you can see that the filenames under 'Train' and 'Test' folder match up. These files will be combined in run_analysis. 
Per project's instruction, this is my run_analysis.R chronological steps:
1. Load the dplyr package
2. Row-bind each pair of data frame in Test and Train, which Test come first. For instance, y is the result of row-binding Y_test.txt and Y_train.txt
3. Names variable X as "Subject" and Variable Y as "Activity".
4. I'm using every line in features.txt to name all these 561 variables in X. Because dplyr's select() function is somewhat confused by hyphens in the variable names, I need to make each name unique.
5. I decided to include all variables with "mean" or "std" in its names.
6. Everything are column-bound together (Subject, Activity, 'Mean', and 'Standard' variables)
7. Change the index in the activity column to descriptive activity names, such as WALKING, based on activity_labels.txt
8. Creating tidy data set requires group_by function from dplyr to group the data based on Subject and Activity.
9. Using summarise_each function to find the mean for each activity and subject.
10. Finally write the table to the TidyData.txt file.


