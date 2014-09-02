### CODEBOOK.md

The general approach is doing things directly with regular R tools 
and avoiding as much as possible any sophisticated or little-known R functions

### PART 1: MERGE TRAINING SET AND TEST SET INTO ONE DATA SET
## no special modifications were made to the data except the merge


### PART 2: EXTRACT ONLY MEAN AND STD DEV MEASUREMENTS
## colnames are read from the file features.txt
    to filter names with "mean" or "std" a regexpr function is used
    then this filtered list is used to subset the original merged set to create a selectedSet
    which is the one used on the rest of the project      

## PART 3 USE DESCRIPTIVE ACTIVITY NAMES TO NAME ACTIVITIES IN THE DATA SET
## subject are read from sub_ files and 
     activities are read from act_ files
     Two columns with subject and activity are added to the begining of the selectedSet
     Finally, all activities are converted from a number to its corresponding descriptive name


## 4 APPROPIATELY LABELS THE DATA SET WITH DESCRIPTIVE VARIABLE NAMES
## 4.1 first decide what the descrpitive variable names are. Names are quite descriptive but just a bit hard
##     to read so I decided that the names should be changed according to the following.
##     - loose the column number
#      - loose the parenthesis
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

First create the new set of names as described above
Then just assing them to the corresponding column in the selected set



## 5 CREATE A SECOND, INDEPENDENT TIDY DATA SET WITH THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT

Also it's pretty straight forward, a simple loop over the columns of selectedSet to calculate
the mean.
Then each result is added to an AveragesByActivity data frame
Finally AveragesByActivity is exported to a file 





More Detail for each part:
========================================================

PART 1: MERGE TRAINING SET AND TEST SET INTO ONE DATA SET
1.1 read both training and test data into one set using rbind function
1.2 make sure rows are the sum of both files 10299 rows, 561 columns

PART 2: EXTRACT ONLY MEAN AND STD DEV MEASUREMENTS
2 extract only the mean and the std dev of the measurements
2.1 first set names to those read in cn$N
2.2 selected Cols contains only the names with mean and std on it
2.3 selectedColNums is the list of column numbers with mean and std in its name
2.4 filter by col names names with "std()" and "mean()" on the name with a regular expression 
2.5 make sure selectedSet has only std() or mean() columns, should return only 79 column names
set colnames to colnames read from features.txt


3 USE DESCRIPTIVE ACTIVITY NAMES TO NAME ACTIVITIES IN THE DATA SET
3.1 include subject and activity columns read four files with subjects (sub_) and activities (act_)
3.2 add two columns with subjects and activities (_sub & _act)
3.3 add two columns with subjects and activities (_sub & _act) to the beginning of selected set of columns
3.4 read activity descriptions
3.5 set activity labels
3.6 Make sure the last column "ACTIVITY" has now a descriptive content instead off a number

4 APPROPIATELY LABELS THE DATA SET WITH DESCRIPTIVE VARIABLE NAMES
4.1 first decide what the descrpitive variable names are. 
    Names are quite descriptive but just a bit hard
    to read so i decided that the names should be changed according to the following.
    - loose the column number
     - loose the parenthesis
the new names will be:

4.2 create the newNames vector
4.3 assign the new names to the selectedSet
4.4 make sure now selectedSet has the modified names:


5 CREATE A SECOND, INDEPENDENT TIDY DATA SET WITH THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT
5.1 create AveragesByActivity
5.2. Review Result 
5.3 OutputResult

END