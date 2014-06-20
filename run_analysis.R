#read in data from csv files
x_test <- read.csv ("./UCI HAR Dataset/test/X_test.txt",header=F, sep="", comment.char = "",colClasses="numeric");
y_test <- read.csv ("./UCI HAR Dataset/test/y_test.txt",header=F, sep="", comment.char = "",colClasses="numeric");
s_test <- read.csv ("./UCI HAR Dataset/test/Subject_test.txt",header=F, sep="", comment.char = "",colClasses="numeric");

x_train <- read.csv ("./UCI HAR Dataset/train/X_train.txt",header=F, sep="", comment.char = "",colClasses="numeric");
y_train <- read.csv ("./UCI HAR Dataset/train/y_train.txt",header=F, sep="", comment.char = "",colClasses="numeric");
s_train <- read.csv ("./UCI HAR Dataset/train/Subject_train.txt",header=F, sep="", comment.char = "",colClasses="numeric");

feature <-read.csv ("./UCI HAR Dataset/features.txt",header=F, sep=" ", comment.char = "",colClasses="character");
activity <-read.csv ("./UCI HAR Dataset/activity_labels.txt",header=F, sep=" ", comment.char = "",);

#assign column names and merge some data
names(s_train) <- c("subject")
names(s_test) <- c("subject")
names(y_train) <- c("label.num")
names(y_test) <- c("label.num")
names(activity) <- c("label.num","label")
tmp.train <- merge(y_train,activity,by.x="label.num",by.y="label.num")
tmp.test <- merge(y_test,activity,by.x="label.num",by.y="label.num")
y.train <- as.data.frame(tmp.train[,2])
y.test <- as.data.frame(tmp.test[,2])
names(y.test) <- c("activityLabel")
names(y.train) <- c("activityLabel")



trans.names <- t(feature$V2)

#rename columns to more descriptive name
tmp.name <- gsub("BodyBody","Body",trans.names)
tmp.name <- gsub("tBody","TimeBody",tmp.name)
tmp.name <- gsub("fBody","FrequencyBody",tmp.name)
tmp.name <- gsub("tGravity","TimeGravity",tmp.name)
tmp.name <- gsub("fGravity","FrequencyGravity",tmp.name)
tmp.name <- gsub("Acc","Acceleration",tmp.name)
tmp.name <- gsub("Gyro","Gyroscopic",tmp.name)
tmp.name <- gsub("Jerk","Jerk",tmp.name)
tmp.name <- gsub("Mag","Magnitude",tmp.name)
tmp.name <- gsub("-mean\\(\\)","Mean",tmp.name)
tmp.name <- gsub("-std\\(\\)","StandardDeviation",tmp.name)
tmp.name <- gsub("-X","XAxis",tmp.name)
tmp.name <- gsub("-Y","YAxis",tmp.name)
tmp.name <- gsub("-Z","ZAxis",tmp.name)

#assign new descriptive names to x_test and x_train sets
names(x_test) <- c(tmp.name)
names(x_train) <- c(tmp.name)

# get only columns with mean or std
col.lst <- grepl("mean\\(\\)|std\\(\\)",feature$V2)
x.train <- x_train[,c(col.lst)]
x.test <- x_test[,c(col.lst)]

# combine to form test set
test <-cbind(s_test,y.test,x.test)
# combine to form train set
train <-cbind(s_train,y.train,x.train)

#combine all data into master tidy data set
data <- rbind(test,train)

# save file as .txt file
write.table(data,file = "tidy.txt")
#code to input file and name it tidy.import
#tidy.import <- read.table("./tidy.txt",sep = " ")

# Creates a second, independent tidy data set with the average of each
# variable for each activity and each subject. 
tmp <- data.frame(matrix(nrow=0, ncol=68)) 

for(i in 1:30) {

sub_data <- subset(data,data$activityLabel == "WALKING" & data$subject == i)
means <-apply(sub_data[,3:68], 2, mean) 
t.means <- t(means)
subject <- i
activityLabel <- "WALKING"
row.tmp <- cbind(subject,activityLabel,t.means)
tmp <- rbind(tmp,row.tmp)
# WALKING_UPSTAIRS
sub_data <- subset(data,data$activityLabel == "WALKING_UPSTAIRS" & data$subject == i)
means <-apply(sub_data[,3:68], 2, mean) 
t.means <- t(means)
subject <- i
activityLabel <- "WALKING_UPSTAIRS"
row.tmp <- cbind(subject,activityLabel,t.means)
tmp <- rbind(tmp,row.tmp)
# WALKING_DOWNSTAIRS
sub_data <- subset(data,data$activityLabel == "WALKING_DOWNSTAIRS" & data$subject == i)
means <-apply(sub_data[,3:68], 2, mean) 
t.means <- t(means)
subject <- i
activityLabel <- "WALKING_DOWNSTAIRS"
row.tmp <- cbind(subject,activityLabel,t.means)
tmp <- rbind(tmp,row.tmp)
# SITTING
sub_data <- subset(data,data$activityLabel == "SITTING" & data$subject == i)
means <-apply(sub_data[,3:68], 2, mean) 
t.means <- t(means)
subject <- i
activityLabel <- "SITTING"
row.tmp <- cbind(subject,activityLabel,t.means)
tmp <- rbind(tmp,row.tmp)
# STANDING
sub_data <- subset(data,data$activityLabel == "STANDING" & data$subject == i)
means <-apply(sub_data[,3:68], 2, mean) 
t.means <- t(means)
subject <- i
activityLabel <- "STANDING"
row.tmp <- cbind(subject,activityLabel,t.means)
tmp <- rbind(tmp,row.tmp)
# LAYING
sub_data <- subset(data,data$activityLabel == "LAYING" & data$subject == i)
means <-apply(sub_data[,3:68], 2, mean) 
t.means <- t(means)
subject <- i
activityLabel <- "LAYING"
row.tmp <- cbind(subject,activityLabel,t.means)
tmp <- rbind(tmp,row.tmp)
}

tidy <- tmp

# save file as .txt file
write.table(tidy,file = "tidy_average.txt")
#code to input file and name it tidy_average.import
#tidy_average.import <- read.table("./tidy_average.txt",sep = " ")

