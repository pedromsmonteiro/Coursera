library(plyr)
############################################ Task 1 ###################################
# Load and bind X
testdata_X <- read.table("UCI HAR Dataset/test/X_test.txt", sep = "", header = FALSE)
trainingdata_X <- read.table("UCI HAR Dataset/train/X_train.txt", sep = "", header = FALSE)
new_table_X <- rbind(testdata_X, trainingdata_X)
#Load and bind Y
testdata_Y <- read.table("UCI HAR Dataset/test/y_test.txt", sep = "", header = FALSE)
trainingdata_Y <- read.table("UCI HAR Dataset/train/y_train.txt", sep = "", header = FALSE)
new_table_Y <- rbind(testdata_Y, trainingdata_Y)


# For subject
subject_Test <- read.table("UCI HAR Dataset/test/subject_test.txt", sep = "", header = FALSE)
subject_Train <- read.table("UCI HAR Dataset/train/subject_train.txt", sep = "", header = FALSE)
subject <- rbind(subject_Test, subject_Train)
# Include the subject in the new_table_X
X <- cbind(subject, new_table_X)

#Column labels
label <- read.table("UCI HAR Dataset/features.txt", sep = "", header = FALSE, stringsAsFactors=FALSE)
label <- rbind(c(1, "subject"), label)
XX <- setNames(X, label$V2)

#include activity
act_labels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)
new_table_Y <- setNames(new_table_Y, "activity")
XX_1 <- cbind(XX, new_table_Y)

############################################ Task 2 ###################################
#select data

XX_1 <- XX_1[,grepl("subject|activity|mean|std", names(XX_1))]


############################################ Task 3 ###################################
XX_2 <- setNames(data.frame(factor(XX_1$activity, levels=1:6, act_labels$V2)), "activity")
XX_1$activity <- XX_2$activity


############################################ Task 4 ###################################

#remove parenthises
names(XX_1) <- gsub("\\(|\\)","", names(XX_1))


#Replacing labels
names(XX_1) <- gsub('Gyro',"AngularVelocity",names(XX_1))
names(XX_1) <- gsub('Mag',"Magnitude",names(XX_1))
names(XX_1) <- gsub('^t',"Time",names(XX_1))
names(XX_1) <- gsub('GyroJerk',"AngularAcceleration",names(XX_1))
names(XX_1) <- gsub('\\mean',"Mean",names(XX_1))
names(XX_1) <- gsub('\\Std',"StandardDeviation",names(XX_1))
names(XX_1) <- gsub('Acc',"Acceleration",names(XX_1))
names(XX_1) <- gsub('\\Freq',"Frequency",names(XX_1))
names(XX_1) <- gsub('^f',"Frequency",names(XX_1))

############################################ Task 5 ###################################



final <- ddply(XX_1, .(subject, activity), numcolwise(mean))



write.table(final, file="final.txt", row.names = FALSE)