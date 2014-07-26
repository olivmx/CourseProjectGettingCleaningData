###
## first import column names from features.txt into cn

setwd("C:/TestR/GetCleanCoursera/UCI HAR Dataset")
cn=read.table("features.txt", sep="\t")
colnames(cn)<-c("N")

## then convert labels to more usable names. say extract only those 79 of mean() and std()


### PART 1: MERGE TRAINING SET AND TEST SET INTO ONE DATA SET
## 1 read both training and test data into one set using rbind function

fullSet<-read.table("train/x_train.txt")
fullSet<-rbind(fullSet, read.table("test/x_test.txt"))
## make sure rows are the sum of both files 10299 rows, 561 columns
dim(fullSet) # 


### PART 2: EXTRACT ONLY MEAN AND STD DEV MEASUREMENTS
## 2 extract only the mean and the std dev of the measurements
## 2.1 first set names to those read in cn$N
colnames(fullSet)<-cn$N


## 2.2 selected Cols contains only the names with mean and std on it
selectedCols <- cn$N[(regexpr("mean",cn$N)>0 | regexpr("std",cn$N)>0)]

## 2.3 selectedColNums is the list of column numbers with mean and std in its name
selectedColNums<-vector(mode="integer", length=0)
for(i in 1:length(selectedCols)) {
  selectedColNums <- cbind(selectedColNums, c(as.integer(unlist(strsplit(toString(selectedCols[i]), " ", fixed = TRUE))[1]) ) )
}
selectedColNums <- as.vector(selectedColNums)

## 2.4 filter by col names names with "std()" and "mean()" on the name with a regular expression 
selectedSet <- fullSet[,selectedColNums]

## 2.5 make sure selectedSet has only std() or mean() columns, should return only 79 column names
colnames(selectedSet)
#set colnames to colnames read from features.txt


## 3 USE DESCRIPTIVE ACTIVITY NAMES TO NAME ACTIVITIES IN THE DATA SET
## 3.1 include subject and activity columns
## read four files with subjects (sub_) and activities (act_)
sub_train<-read.table("train/subject_train.txt")
sub_train<-as.vector(sub_train)
sub_test<-read.table("test/subject_test.txt")
sub_test<-as.vector(sub_test)
full_sub<-rbind(sub_train,sub_test)
dim(full_sub)
colnames(full_sub)<-c("SUBJECT")

act_train<-read.table("train/y_train.txt")
act_train<-as.vector(act_train)
act_test<-read.table("test/y_test.txt")
act_test<-as.vector(act_test)
full_act<-rbind(act_train,act_test)
colnames(full_act)<-c("ACTIVITY")

## 3.2 add two columns with subjects and activities (_sub & _act)
fullSet<-cbind(fullSet,full_sub,full_act)
dim(fullSet)

## 3.3 add two columns with subjects and activities (_sub & _act) to the selected set of columns
selectedSet<-cbind(selectedSet,full_sub,full_act)
dim(selectedSet)

## 3.4 read activity descriptions
act_labels<-read.table("activity_labels.txt")

## 3.5 set activity labels

for (i in 1:nrow(selectedSet)){
  selectedSet$ACTIVITY[i] <- toString(selectedSet$ACTIVITY[i])
}

for (i in 1:nrow(selectedSet)){
  selectedSet$ACTIVITY[i] <- toString(act_labels[as.integer(selectedSet$ACTIVITY[i]),2])
}

# selectedSet <- fullSet[,selectedColNums]
# selectedSet<-cbind(selectedSet,full_sub,full_act)
# selectedSet$ACTIVITY

## 3.6 Make sure the last column "ACTIVITY" has now a descriptive content instead off a number
head (selectedSet)

## 4 APPROPIATELY LABELS THE DATA SET WITH DESCRIPTIVE VARIABLE NAMES
## 4.1 first decide what the descrpitive variable names are. Names are quite descriptive but just a bit hard
##     to read so i decided that the names should be changed according to the following.
##     - loose the column number
#        - loose the parenthesis
# 
# the new names will be:
# tBodyAcc-mean()-X     tBodyAcc-mean-X
# tBodyAcc-mean()-Y	tBodyAcc-mean-Y
# tBodyAcc-mean()-Z	tBodyAcc-mean-Z
# tBodyAcc-std()-X	tBodyAcc-std-X
# tBodyAcc-std()-Y	tBodyAcc-std-Y
# tBodyAcc-std()-Z	tBodyAcc-std-Z
# tGravityAcc-mean()-X	tGravityAcc-mean-X
# tGravityAcc-mean()-Y	tGravityAcc-mean-Y
# tGravityAcc-mean()-Z	tGravityAcc-mean-Z
# tGravityAcc-std()-X	tGravityAcc-std-X
# tGravityAcc-std()-Y	tGravityAcc-std-Y
# tGravityAcc-std()-Z	tGravityAcc-std-Z
# tBodyAccJerk-mean()-X	tBodyAccJerk-mean-X
# tBodyAccJerk-mean()-Y	tBodyAccJerk-mean-Y
# tBodyAccJerk-mean()-Z	tBodyAccJerk-mean-Z
# tBodyAccJerk-std()-X	tBodyAccJerk-std-X
# tBodyAccJerk-std()-Y	tBodyAccJerk-std-Y
# tBodyAccJerk-std()-Z	tBodyAccJerk-std-Z
# tBodyGyro-mean()-X	tBodyGyro-mean-X
# tBodyGyro-mean()-Y	tBodyGyro-mean-Y
# tBodyGyro-mean()-Z	tBodyGyro-mean-Z
# tBodyGyro-std()-X	tBodyGyro-std-X
# tBodyGyro-std()-Y	tBodyGyro-std-Y
# tBodyGyro-std()-Z	tBodyGyro-std-Z
# tBodyGyroJerk-mean()-X	tBodyGyroJerk-mean-X
# tBodyGyroJerk-mean()-Y	tBodyGyroJerk-mean-Y
# tBodyGyroJerk-mean()-Z	tBodyGyroJerk-mean-Z
# tBodyGyroJerk-std()-X	tBodyGyroJerk-std-X
# tBodyGyroJerk-std()-Y	tBodyGyroJerk-std-Y
# tBodyGyroJerk-std()-Z	tBodyGyroJerk-std-Z
# tBodyAccMag-mean()	tBodyAccMag-mean
# tBodyAccMag-std()	tBodyAccMag-std
# tGravityAccMag-mean()	tGravityAccMag-mean
# tGravityAccMag-std()	tGravityAccMag-std
# tBodyAccJerkMag-mean()	tBodyAccJerkMag-mean
# tBodyAccJerkMag-std()	tBodyAccJerkMag-std
# tBodyGyroMag-mean()	tBodyGyroMag-mean
# tBodyGyroMag-std()	tBodyGyroMag-std
# tBodyGyroJerkMag-mean()	tBodyGyroJerkMag-mean
# tBodyGyroJerkMag-std()	tBodyGyroJerkMag-std
# fBodyAcc-mean()-X	fBodyAcc-mean-X
# fBodyAcc-mean()-Y	fBodyAcc-mean-Y
# fBodyAcc-mean()-Z	fBodyAcc-mean-Z
# fBodyAcc-std()-X	fBodyAcc-std-X
# fBodyAcc-std()-Y	fBodyAcc-std-Y
# fBodyAcc-std()-Z	fBodyAcc-std-Z
# fBodyAcc-meanFreq()-X	fBodyAcc-meanFreq-X
# fBodyAcc-meanFreq()-Y	fBodyAcc-meanFreq-Y
# fBodyAcc-meanFreq()-Z	fBodyAcc-meanFreq-Z
# fBodyAccJerk-mean()-X	fBodyAccJerk-mean-X
# fBodyAccJerk-mean()-Y	fBodyAccJerk-mean-Y
# fBodyAccJerk-mean()-Z	fBodyAccJerk-mean-Z
# fBodyAccJerk-std()-X	fBodyAccJerk-std-X
# fBodyAccJerk-std()-Y	fBodyAccJerk-std-Y
# fBodyAccJerk-std()-Z	fBodyAccJerk-std-Z
# fBodyAccJerk-meanFreq()-X	fBodyAccJerk-meanFreq-X
# fBodyAccJerk-meanFreq()-Y	fBodyAccJerk-meanFreq-Y
# fBodyAccJerk-meanFreq()-Z	fBodyAccJerk-meanFreq-Z
# fBodyGyro-mean()-X	fBodyGyro-mean-X
# fBodyGyro-mean()-Y	fBodyGyro-mean-Y
# fBodyGyro-mean()-Z	fBodyGyro-mean-Z
# fBodyGyro-std()-X	fBodyGyro-std-X
# fBodyGyro-std()-Y	fBodyGyro-std-Y
# fBodyGyro-std()-Z	fBodyGyro-std-Z
# fBodyGyro-meanFreq()-X	fBodyGyro-meanFreq-X
# fBodyGyro-meanFreq()-Y	fBodyGyro-meanFreq-Y
# fBodyGyro-meanFreq()-Z	fBodyGyro-meanFreq-Z
# fBodyAccMag-mean()	fBodyAccMag-mean
# fBodyAccMag-std()	fBodyAccMag-std
# fBodyAccMag-meanFreq()	fBodyAccMag-meanFreq
# fBodyBodyAccJerkMag-mean()	fBodyBodyAccJerkMag-mean
# fBodyBodyAccJerkMag-std()	fBodyBodyAccJerkMag-std
# fBodyBodyAccJerkMag-meanFreq()	fBodyBodyAccJerkMag-meanFreq
# fBodyBodyGyroMag-mean()	fBodyBodyGyroMag-mean
# fBodyBodyGyroMag-std()	fBodyBodyGyroMag-std
# fBodyBodyGyroMag-meanFreq()	fBodyBodyGyroMag-meanFreq
# fBodyBodyGyroJerkMag-mean()	fBodyBodyGyroJerkMag-mean
# fBodyBodyGyroJerkMag-std()	fBodyBodyGyroJerkMag-std
# fBodyBodyGyroJerkMag-meanFreq()	fBodyBodyGyroJerkMag-meanFreq

# 4.2 create the newNames vector
newNames <- c('tBodyAcc-mean-X'
              ,'tBodyAcc-mean-Y'
              ,'tBodyAcc-mean-Z'
              ,'tBodyAcc-std-X'
              ,'tBodyAcc-std-Y'
              ,'tBodyAcc-std-Z'
              ,'tGravityAcc-mean-X'
              ,'tGravityAcc-mean-Y'
              ,'tGravityAcc-mean-Z'
              ,'tGravityAcc-std-X'
              ,'tGravityAcc-std-Y'
              ,'tGravityAcc-std-Z'
              ,'tBodyAccJerk-mean-X'
              ,'tBodyAccJerk-mean-Y'
              ,'tBodyAccJerk-mean-Z'
              ,'tBodyAccJerk-std-X'
              ,'tBodyAccJerk-std-Y'
              ,'tBodyAccJerk-std-Z'
              ,'tBodyGyro-mean-X'
              ,'tBodyGyro-mean-Y'
              ,'tBodyGyro-mean-Z'
              ,'tBodyGyro-std-X'
              ,'tBodyGyro-std-Y'
              ,'tBodyGyro-std-Z'
              ,'tBodyGyroJerk-mean-X'
              ,'tBodyGyroJerk-mean-Y'
              ,'tBodyGyroJerk-mean-Z'
              ,'tBodyGyroJerk-std-X'
              ,'tBodyGyroJerk-std-Y'
              ,'tBodyGyroJerk-std-Z'
              ,'tBodyAccMag-mean'
              ,'tBodyAccMag-std'
              ,'tGravityAccMag-mean'
              ,'tGravityAccMag-std'
              ,'tBodyAccJerkMag-mean'
              ,'tBodyAccJerkMag-std'
              ,'tBodyGyroMag-mean'
              ,'tBodyGyroMag-std'
              ,'tBodyGyroJerkMag-mean'
              ,'tBodyGyroJerkMag-std'
              ,'fBodyAcc-mean-X'
              ,'fBodyAcc-mean-Y'
              ,'fBodyAcc-mean-Z'
              ,'fBodyAcc-std-X'
              ,'fBodyAcc-std-Y'
              ,'fBodyAcc-std-Z'
              ,'fBodyAcc-meanFreq-X'
              ,'fBodyAcc-meanFreq-Y'
              ,'fBodyAcc-meanFreq-Z'
              ,'fBodyAccJerk-mean-X'
              ,'fBodyAccJerk-mean-Y'
              ,'fBodyAccJerk-mean-Z'
              ,'fBodyAccJerk-std-X'
              ,'fBodyAccJerk-std-Y'
              ,'fBodyAccJerk-std-Z'
              ,'fBodyAccJerk-meanFreq-X'
              ,'fBodyAccJerk-meanFreq-Y'
              ,'fBodyAccJerk-meanFreq-Z'
              ,'fBodyGyro-mean-X'
              ,'fBodyGyro-mean-Y'
              ,'fBodyGyro-mean-Z'
              ,'fBodyGyro-std-X'
              ,'fBodyGyro-std-Y'
              ,'fBodyGyro-std-Z'
              ,'fBodyGyro-meanFreq-X'
              ,'fBodyGyro-meanFreq-Y'
              ,'fBodyGyro-meanFreq-Z'
              ,'fBodyAccMag-mean'
              ,'fBodyAccMag-std'
              ,'fBodyAccMag-meanFreq'
              ,'fBodyBodyAccJerkMag-mean'
              ,'fBodyBodyAccJerkMag-std'
              ,'fBodyBodyAccJerkMag-meanFreq'
              ,'fBodyBodyGyroMag-mean'
              ,'fBodyBodyGyroMag-std'
              ,'fBodyBodyGyroMag-meanFreq'
              ,'fBodyBodyGyroJerkMag-mean'
              ,'fBodyBodyGyroJerkMag-std'
              ,'fBodyBodyGyroJerkMag-meanFreq'
              ,'SUBJECT'
              ,'ACTIVITY'
)


# 4.3 assign the new names to the selectedSet

colnames(selectedSet) <-newNames

# 4.4 make sure now selectedSet has the modified names:

head (selectedSet)
colnames (selectedSet)

## 5 CREATE A SECOND, INDEPENDENT TIDY DATA SET WITH THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT

## 5.1 create AveragesByActivity

AveragesByActivity <- data.frame(0)
for (i in 1:ncol(selectedSet)-2){
     if (length(selectedSet[,i])==length(selectedSet[,ncol(selectedSet)])){
          r<-as.data.frame(tapply (selectedSet[,i], selectedSet[,ncol(selectedSet)], mean ))
          colnames(r)<-colnames(selectedSet[i])
          AveragesByActivity<-cbind(AveragesByActivity,r)
     }
}
AveragesByActivity<-AveragesByActivity[,-1]
## 5.2. Review Result 
AveragesByActivity

## 5.3 OutputResult
write.table(AveragesByActivity, "AveragesByActivity.txt")

## END
