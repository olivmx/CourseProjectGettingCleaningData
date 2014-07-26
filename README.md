CourseProjectGettingCleaningData
================================

Course Project for getting and cleaning data


The run_analysis.R contains the code explaining what is performed in each step

All code documentation is organized in the Question.part format so its
easier to read.

CODEBOOK:


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
3.3 add two columns with subjects and activities (_sub & _act) to the selected set of columns
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
tBodyAcc-mean()-X     tBodyAcc-mean-X
tBodyAcc-mean()-Y     tBodyAcc-mean-Y
tBodyAcc-mean()-Z	tBodyAcc-mean-Z
tBodyAcc-std()-X	tBodyAcc-std-X
tBodyAcc-std()-Y	tBodyAcc-std-Y
tBodyAcc-std()-Z	tBodyAcc-std-Z
tGravityAcc-mean()-X	tGravityAcc-mean-X
tGravityAcc-mean()-Y	tGravityAcc-mean-Y
tGravityAcc-mean()-Z	tGravityAcc-mean-Z
tGravityAcc-std()-X	tGravityAcc-std-X
tGravityAcc-std()-Y	tGravityAcc-std-Y
tGravityAcc-std()-Z	tGravityAcc-std-Z
tBodyAccJerk-mean()-X	tBodyAccJerk-mean-X
tBodyAccJerk-mean()-Y	tBodyAccJerk-mean-Y
tBodyAccJerk-mean()-Z	tBodyAccJerk-mean-Z
tBodyAccJerk-std()-X	tBodyAccJerk-std-X
tBodyAccJerk-std()-Y	tBodyAccJerk-std-Y
tBodyAccJerk-std()-Z	tBodyAccJerk-std-Z
tBodyGyro-mean()-X	tBodyGyro-mean-X
tBodyGyro-mean()-Y	tBodyGyro-mean-Y
tBodyGyro-mean()-Z	tBodyGyro-mean-Z
tBodyGyro-std()-X	tBodyGyro-std-X
tBodyGyro-std()-Y	tBodyGyro-std-Y
tBodyGyro-std()-Z	tBodyGyro-std-Z
tBodyGyroJerk-mean()-X	tBodyGyroJerk-mean-X
tBodyGyroJerk-mean()-Y	tBodyGyroJerk-mean-Y
tBodyGyroJerk-mean()-Z	tBodyGyroJerk-mean-Z
tBodyGyroJerk-std()-X	tBodyGyroJerk-std-X
tBodyGyroJerk-std()-Y	tBodyGyroJerk-std-Y
tBodyGyroJerk-std()-Z	tBodyGyroJerk-std-Z
tBodyAccMag-mean()	tBodyAccMag-mean
tBodyAccMag-std()	tBodyAccMag-std
tGravityAccMag-mean()	tGravityAccMag-mean
tGravityAccMag-std()	tGravityAccMag-std
tBodyAccJerkMag-mean()	tBodyAccJerkMag-mean
tBodyAccJerkMag-std()	tBodyAccJerkMag-std
tBodyGyroMag-mean()	tBodyGyroMag-mean
tBodyGyroMag-std()	tBodyGyroMag-std
tBodyGyroJerkMag-mean()	tBodyGyroJerkMag-mean
tBodyGyroJerkMag-std()	tBodyGyroJerkMag-std
fBodyAcc-mean()-X	fBodyAcc-mean-X
fBodyAcc-mean()-Y	fBodyAcc-mean-Y
fBodyAcc-mean()-Z	fBodyAcc-mean-Z
fBodyAcc-std()-X	fBodyAcc-std-X
fBodyAcc-std()-Y	fBodyAcc-std-Y
fBodyAcc-std()-Z	fBodyAcc-std-Z
fBodyAcc-meanFreq()-X	fBodyAcc-meanFreq-X
fBodyAcc-meanFreq()-Y	fBodyAcc-meanFreq-Y
fBodyAcc-meanFreq()-Z	fBodyAcc-meanFreq-Z
fBodyAccJerk-mean()-X	fBodyAccJerk-mean-X
fBodyAccJerk-mean()-Y	fBodyAccJerk-mean-Y
fBodyAccJerk-mean()-Z	fBodyAccJerk-mean-Z
fBodyAccJerk-std()-X	fBodyAccJerk-std-X
fBodyAccJerk-std()-Y	fBodyAccJerk-std-Y
fBodyAccJerk-std()-Z	fBodyAccJerk-std-Z
fBodyAccJerk-meanFreq()-X	fBodyAccJerk-meanFreq-X
fBodyAccJerk-meanFreq()-Y	fBodyAccJerk-meanFreq-Y
fBodyAccJerk-meanFreq()-Z	fBodyAccJerk-meanFreq-Z
fBodyGyro-mean()-X	fBodyGyro-mean-X
fBodyGyro-mean()-Y	fBodyGyro-mean-Y
fBodyGyro-mean()-Z	fBodyGyro-mean-Z
fBodyGyro-std()-X	fBodyGyro-std-X
fBodyGyro-std()-Y	fBodyGyro-std-Y
fBodyGyro-std()-Z	fBodyGyro-std-Z
fBodyGyro-meanFreq()-X	fBodyGyro-meanFreq-X
fBodyGyro-meanFreq()-Y	fBodyGyro-meanFreq-Y
fBodyGyro-meanFreq()-Z	fBodyGyro-meanFreq-Z
fBodyAccMag-mean()	fBodyAccMag-mean
fBodyAccMag-std()	fBodyAccMag-std
fBodyAccMag-meanFreq()	fBodyAccMag-meanFreq
fBodyBodyAccJerkMag-mean()	fBodyBodyAccJerkMag-mean
fBodyBodyAccJerkMag-std()	fBodyBodyAccJerkMag-std
fBodyBodyAccJerkMag-meanFreq()	fBodyBodyAccJerkMag-meanFreq
fBodyBodyGyroMag-mean()	fBodyBodyGyroMag-mean
fBodyBodyGyroMag-std()	fBodyBodyGyroMag-std
fBodyBodyGyroMag-meanFreq()	fBodyBodyGyroMag-meanFreq
fBodyBodyGyroJerkMag-mean()	fBodyBodyGyroJerkMag-mean
fBodyBodyGyroJerkMag-std()	fBodyBodyGyroJerkMag-std
fBodyBodyGyroJerkMag-meanFreq()	fBodyBodyGyroJerkMag-meanFreq

4.2 create the newNames vector
4.3 assign the new names to the selectedSet
4.4 make sure now selectedSet has the modified names:


5 CREATE A SECOND, INDEPENDENT TIDY DATA SET WITH THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT
5.1 create AveragesByActivity
5.2. Review Result 
5.3 OutputResult

END

Bellow is a description of the information taken in the project copied from 
the readme.file



==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

