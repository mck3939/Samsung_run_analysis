run_analysis <- function (){

#### SECTION 1: We will download the data from the zip file on the web,if needed.
####            Then the data is imported into data.frames in R.

if(!file.exists("./UCI HAR Dataset")){
        ## Data will to be downloaded the file to a temp directory.
        DateDownloaded <- as.Date(Sys.time(), "MST" )
        url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        td <- tempdir()
        temp <- tempfile(tmpdir=td, fileext=".zip")
        download.file(url, temp)

        ##unzip the zip folder to the wd and delete temp data
        unzip(temp)
        unlink(temp)
        rm(temp,td,url)
}


#Import data into r in 8 data.frames
features <- read.table("./UCI HAR Dataset/features.txt", header = FALSE,
                       stringsAsFactors = FALSE)
activity <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE,
                       stringsAsFactors = FALSE)

traindata <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
train_subjectID <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
train_activityID <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)

testdata <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
test_subjectID <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
test_activityID <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)


#### SECTION 2: We translate the codes in the train_activityID and test_activityID to
####            be able to provide descriptive activity names to name the activities 
####            in the data set (PART 3 of project requirements). Data.frames created
####            here test_activitynames and train_activitynames will be merged with 
####            the data in SECTION 4.

# Create test_activitynames
temp <- c(1:nrow(test_activityID))
test_activitynames <- data.frame()
for(i in temp){
        if(test_activityID[i,1] == activity[1,1]){
                test_activitynames[i,1] <- activity[1,2] 
        }else if(test_activityID[i,1] == activity[2,1]){
                test_activitynames[i,1] <- activity[2,2] 
        }else if(test_activityID[i,1] == activity[3,1]){
                test_activitynames[i,1] <- activity[3,2]
        }else if(test_activityID[i,1] == activity[4,1]){
                test_activitynames[i,1] <- activity[4,2]
        }else if(test_activityID[i,1] == activity[5,1]){
                test_activitynames[i,1] <- activity[5,2]
        }else if(test_activityID[i,1] == activity[6,1]){
                test_activitynames[i,1] <- activity[6,2]
        }
}

# Create train_activitynames
temp <- c(1:nrow(train_activityID))
train_activitynames <- data.frame()
for(i in temp){
        if(train_activityID[i,1] == activity[1,1]){
                # set all 1 to WALKING
                train_activitynames[i,1] <- activity[1,2]
        }else if(train_activityID[i,1] == activity[2,1]){
                train_activitynames[i,1] <- activity[2,2]
        }else if(train_activityID[i,1] == activity[3,1]){
                train_activitynames[i,1] <- activity[3,2]
        }else if(train_activityID[i,1] == activity[4,1]){
                train_activitynames[i,1] <- activity[4,2]
        }else if(train_activityID[i,1] == activity[5,1]){
                train_activitynames[i,1] <- activity[5,2]
        }else if(train_activityID[i,1] == activity[6,1]){
                train_activitynames[i,1] <- activity[6,2]
        }
}



#### SECTION 3: We convert the features data.frame into a vector that can be used to
####            appropriately labels the data set with descriptive variable names 
####            (PART 4 of project requirements). Also, we will add column headers for
####            the activity column (created in section 2) and the ID for the study 
####            subject. features will be merged with the data in SECTION 4. 

headers <- features[,2] #convert features df to vector to be used for headers
headers <- tolower(headers)
headers <- gsub("-","",headers)
headers <- gsub(",","",headers)
headers <- gsub("\\()","",headers)
headers <- c("activity", "subjectid",headers) 

#### SECTION 4: We will combine the data the test and train into seperate data sets
####            with the subject ID and activity name columns (SECTION 2) and set the 
####            column header to those in the features vector (SECTION 3). Finally,
####            we will merge the training and the test sets to create one data set
####            (PART 1 of project requirements)

# create tidy test data.frame
test <- cbind(test_activitynames,test_subjectID,testdata)
colnames(test) <- headers

# create tidy train data.frame
train <- cbind(train_activitynames,train_subjectID,traindata)
colnames(train) <- headers

# combine into one data data.frame
data <- rbind(test,train)


#### SECTION 5: Extracts only the measurements on the mean and standard deviation for 
####            each measurement from data into a new vector called subdata.Create and
####            return a data.frame showing the average of each variable in subdata 
####            for each activity and each subject.

# determine which columns are mean in the features data.frame and add 2 to account 
# for the activity and subjectid columns that were added in data.
mean <- grep("mean\\()",features[,2]) + 2 

# determine which columns are mean in the features data.frame and add 2 to account 
# for the activity and subjectid columns that were added in data.
std <- grep("std\\()",features[,2]) + 2  

# combine the vectors above and reorder them acending
ms <- sort(c(mean,std), decreasing = FALSE) 

# subset data
subdata <- data[,c(1,2,ms)]

#creates the mean of each data column by activity and subjectid
out <- aggregate( subdata[,3:length(subdata)], subdata[,1:2], FUN = mean )

return(out)
}