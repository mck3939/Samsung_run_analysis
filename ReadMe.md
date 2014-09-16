==================================================================
Data Source:

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.   
Smartlab - Non Linear Complex Systems Laboratory  
DITEN - Università degli Studi di Genova.  
Via Opera Pia 11A, I-16145, Genoa, Italy.  
activityrecognition@smartlab.ws  
www.smartlab.ws   

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

==================================================================

Description of experiment (source README file in data set):

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' in the data set for more details. 

==================================================================

Description of data set produced with this script:

The goal of this script is to provide a tidy data set that includes the data for all of the participants in the experiment described above. It will return the average for each member per activity completed.

The data selected within this script is only those columns mean() and std() in the column name because, per the features_info document provided with the data, these are the only items that show the mean and standard deviation.

The data is tidy because each row contains one activity per row and the columns only contain one piece of data each. Column names have also been updated to all lower case and only alphanumeric characters.  

==================================================================

Method:

These are the section followed in the function to get the tiny data set.

1: Download the data from the zip file on the web, if needed. Then the data is
        imported into 8 data.frames in R.

2: Translate the codes in the train_activityID and test_activityID to be able to provide
        descriptive activity names to name the activities in the data set (PART 3 of project
        requirements). Data.frames created here test_activitynames and train_activitynames
        will be merged with the data in SECTION 4.

3: Convert the features data.frame into a vector that can be used to appropriately labels
        the data set with descriptive variable names (PART 4 of project requirements). Also
        it will add column headers for the activity column (created in section 2) and the ID
        for the study subject. features will be merged with the data in SECTION 4.

4: Combine the data the test and train into separate data set with the subject ID
        and activity name columns (SECTION 2) and set the column header to those in the
        features vector (SECTION 3). Finally, it will merge the training and the test sets
        to create one data set (PART 1 of project requirements).

5: Extracts only the measurements on the mean and standard deviation for each measurement
        from data into a new vector called subdata. Then it will create and return a 
        data.frame showing the average of each variable in subdata for each activity and
        each subject.

==================================================================

Information provided in the data set are as follows:

- Character variable describing one of six actions that were tracked during the study. The
  activities are:
  
  1. WALKING
  2. WALKING_UPSTAIRS
  3. WALKING_DOWNSTAIRS
  4. SITTING
  5. STANDING
  6. LAYING

- An identifier between 1 and 30 that is a unique identifier for each participant in the 
  study.    
- The mean and standard deviation for the triaxial acceleration from the accelerometer
(total acceleration) and the estimated body acceleration.    
- The mean and standard deviation for the Triaxial Angular velocity from the gyroscope. 


The columns provided are:

activity   
subjectid   
tbodyaccmeanx  
tbodyaccmeany  
tbodyaccmeanz   
tbodyaccstdx   
tbodyaccstdy   
tbodyaccstdz   
tgravityaccmeanx  
tgravityaccmeany   
tgravityaccmeanz   
tgravityaccstdx   
tgravityaccstdy   
tgravityaccstdz   
tbodyaccjerkmeanx   
tbodyaccjerkmeany   
tbodyaccjerkmeanz   
tbodyaccjerkstdx   
tbodyaccjerkstdy   
tbodyaccjerkstdz  
tbodygyromeanx   
tbodygyromeany  
tbodygyromeanz  
tbodygyrostdx  
tbodygyrostdy  
tbodygyrostdz  
tbodygyrojerkmeanx   
tbodygyrojerkmeany  
tbodygyrojerkmeanz  
tbodygyrojerkstdx  
tbodygyrojerkstdy  
tbodygyrojerkstdz  
tbodyaccmagmean   
tbodyaccmagstd  
tgravityaccmagmean  
tgravityaccmagstd  
tbodyaccjerkmagmean  
tbodyaccjerkmagstd  
tbodygyromagmean  
tbodygyromagstd  
tbodygyrojerkmagmean  
tbodygyrojerkmagstd  
fbodyaccmeanx  
fbodyaccmeany   
fbodyaccmeanz   
fbodyaccstdx  
fbodyaccstdy  
fbodyaccstdz   
fbodyaccjerkmeanx  
fbodyaccjerkmeany  
fbodyaccjerkmeanz  
fbodyaccjerkstdx  
fbodyaccjerkstdy   
fbodyaccjerkstdz   
fbodygyromeanx  
fbodygyromeany  
fbodygyromeanz  
fbodygyrostdx  
fbodygyrostdy  
fbodygyrostdz  
fbodyaccmagmean  
fbodyaccmagstd  
fbodybodyaccjerkmagmean  
fbodybodyaccjerkmagstd  
fbodybodygyromagmean  
fbodybodygyromagstd  
fbodybodygyrojerkmagmean  
fbodybodygyrojerkmagstd  
