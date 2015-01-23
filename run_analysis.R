
## Load the dplyr package
library(dplyr)

# reading and row-binding the subject texts
subjectTest <- read.table("./test/subject_test.txt")
subjectTrain <- read.table("./train/subject_train.txt")
subject <- rbind(subjectTest, subjectTrain)
colnames(subject) <- "Subject"

# reading and row-binding the activity texts
yTest <- read.table("./test/Y_test.txt")
yTrain <- read.table("./train/Y_train.txt")
y <- rbind(yTest, yTrain)
colnames(y) <- "Activity"

# reading and row-binding the x measurements texts
xTest <- read.table("./test/X_test.txt")
xTrain <- read.table("./train/X_train.txt")
x <- rbind(xTest, xTrain)

# using the lines from features text as the variables names for x
features <- read.table("./features.txt")
colnames(x) <- make.names(features[,2], unique=TRUE)

# Let's keep original datasets x, y subject and use new datasets for operations
meanVariables <- select(x, contains("mean"))
standardVariables <- select(x, contains("std"))
meanStandardData <- cbind(subject, y, meanVariables, standardVariables)

# Labeling the activities
activityNames <- read.table("./activity_labels.txt")
meanStandardData$Activity <- activityNames[meanStandardData$Activity,2]

# Create an independent tidy data set with average of each variable for each activity and each subject
subjectActivityGroup <- group_by(meanStandardData, Subject, Activity)
tidyData <- subjectActivityGroup %>% summarise_each(funs(mean), -Activity, -Subject)

write.table(tidyData, file="./TidyData.txt", row.name=FALSE)

