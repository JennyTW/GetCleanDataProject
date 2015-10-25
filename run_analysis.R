##Project#############

##(1) load all txt file into R objects.

data_TEs<-read.table("test/subject_test.txt")
data_TEy<-read.table("./test/y_test.txt")
data_TEx<-read.table("./test/X_test.txt")
data_TRs<-read.table("./train/subject_train.txt")
data_TRy<-read.table("./train/y_train.txt")
data_TRx<-read.table("./train/x_train.txt")



##(2) Extracts only the measurements on the mean and standard deviation for each measurement.(Goal#2)  

Feature<-read.table("features.txt")
Feature_Mean_SD <- Feature[grep("mean|std",Feature$V2),]
data_TEx_MS<-data_TEx[,Feature_Mean_SD[,1]]
data_TRx_MS<-data_TRx[,Feature_Mean_SD[,1]]



##(3) Merges the training and the test sets to create one data set. (Goal#1)

data_TE<-cbind(data_TEs,data_TEy,data_TEx_MS)
data_TR<-cbind(data_TRs,data_TRy,data_TRx_MS)
data_All<-rbind(data_TE,data_TR)



##(4) Appropriately labels the data set with descriptive variable names. (Goal#4)

ColName<-c("SubjectID","Activity",as.character(Feature_Mean_SD[,2]))
names(data_All)<-ColName



##(5) Uses descriptive activity names to name the activities in the data set (Goal#3)

data_All$Activity[data_All$Activity == 1] <- "WALKING" 
data_All$Activity[data_All$Activity == 2] <- "WALKING_UPSTAIRS" 
data_All$Activity[data_All$Activity == 3] <- "WALKING_DOWNSTAIRS" 
data_All$Activity[data_All$Activity == 4] <- "SITTING" 
data_All$Activity[data_All$Activity == 5] <- "STANDING" 
data_All$Activity[data_All$Activity == 6] <- "LAYING" 


##(6) From the data set in Goal 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

install.packages("dplyr")
library(dplyr)
data_All_df<-tbl_df(data_All)
data_All_df1<-group_by(data_All_df,SubjectID,Activity)
data_All_df2<-summarise_each(data_All_df1,funs(mean))

write.table(data_All_df2, "NewTidyData.txt", row.name=TRUE)
