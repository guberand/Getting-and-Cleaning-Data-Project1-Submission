fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!file.exists("wearcomp_data.zip")){
download.file(fileurl,destfile="wearcomp_data.zip")
}
unzip("wearcomp_data.zip")
##Reading test and train dataset X
raw_testdata<-read.table("UCI HAR Dataset/test/X_test.txt",
                         header=F,colClasses=(rep("numeric","561")))
raw_traindata<-read.table("UCI HAR Dataset/train/X_train.txt",
                          header=F,colClasses=(rep("numeric","561")))
##Reading test and train dataset subjects
train_subjectdata<-read.table("UCI HAR Dataset/train/subject_train.txt",header=F)
test_subjectdata<-read.table("UCI HAR Dataset/test/subject_test.txt",header=F)
##Reading test and train dataset activity codes
train_activity_codes<-read.table("UCI HAR Dataset/train/y_train.txt",header=F)
test_activity_codes<-read.table("UCI HAR Dataset/test/y_test.txt",header=F)

## Train data- R code to map activity code to activity description
i=0
for (i in 1:nrow(train_activity_codes)){
  if (train_activity_codes[i,1]==1){
    train_activity_codes[i,2]= "WALKING"
  }
  if (train_activity_codes[i,1]==2){
    train_activity_codes[i,2]= "WALKING_UPSTAIRS"
  }
  if (train_activity_codes[i,1]==3){
    train_activity_codes[i,2]= "WALKING_DOWNSTAIRS"
  }
  if (train_activity_codes[i,1]==4){
    train_activity_codes[i,2]= "SITTING"
  }
  if (train_activity_codes[i,1]==5){
    train_activity_codes[i,2]= "STANDING"
  }
  if (train_activity_codes[i,1]==6){
    train_activity_codes[i,2]= "LAYING"
  }
}


## Test data- Code to map activity code to activity description
i=0
for (i in 1:nrow(test_activity_codes)){
  if (test_activity_codes[i,1]==1){
    test_activity_codes[i,2]= "WALKING"
  }
  if (test_activity_codes[i,1]==2){
    test_activity_codes[i,2]= "WALKING_UPSTAIRS"
  }
  if (test_activity_codes[i,1]==3){
    test_activity_codes[i,2]= "WALKING_DOWNSTAIRS"
  }
  if (test_activity_codes[i,1]==4){
    test_activity_codes[i,2]= "SITTING"
  }
  if (test_activity_codes[i,1]==5){
    test_activity_codes[i,2]= "STANDING"
  }
  if (test_activity_codes[i,1]==6){
    test_activity_codes[i,2]= "LAYING"
  }
}



##merging test and train dataset with activity description and Subject column-wise
##to create 2 dataframes of 563 columns)
testdata<-cbind(test_subjectdata,test_activity_codes[2],raw_testdata)
traindata<-cbind(train_subjectdata,train_activity_codes[2],raw_traindata)

##merging test data and train data row-wise to create one dataset
all_raw_data<-rbind(testdata,traindata)

##Subsetting the raw data to create tidy data with columns representing mean, stddev and freqmean
tidydataset1<-all_raw_data[,c(1,2,3,4,5,6,7,8,43,44,45,46,47,48,
                                     83,84,85,86,87,88,123,124,125,126,127,128,
                                     163,164,165,166,167,168,203,204,216,
                                     217,229,230,242,243,255,256,268,269,
                                     270,271,272,273,296,297,298,347,
                                     348,349,350,351,352,375,376,377,
                                     426,427,428,429,430,431,454,455,456,
                                     505,506,515,518,519,528,531,
                                     532,541,544,545,554)]
##renaming column names for tidydataset1 with 81 columns including subject and activity
colnames(tidydataset1)<-c("subject","activity",
                                  "tbodyacc_xaxis_mean","tbodyacc_yaxis_mean",
                                  "tbodyacc_zaxis_mean","tbodyacc_xaxis_stddev",
                                  "tbodyacc_yaxis_stddev","tbodyacc_zaxis_stddev",
                                  "tgravityacc_xaxis_mean","tgravityacc_yaxis_mean",
                                  "tgravityacc_zaxis_mean","tgravityacc_xaxis_stddev",
                                  "tgravityacc_yaxis_stddev","tgravityacc_zaxis_stddev",
                                  "tbodyaccjerk_xaxis_mean","tbodyaccjerk_yaxis_mean",
                                  "tbodyaccjerk_zaxis_mean","tbodyaccjerk_xaxis_stddev",
                                  "tbodyaccjerk_yaxis_stddev","tbodyaccjerk_zaxis_stddev",
                                  "tbodygyro_xaxis_mean","tbodygyro_yaxis_mean",
                                  "tbodygyro_zaxis_mean","tbodygyro_xaxis_stddev",
                                  "tbodygyro_yaxis_stddev","tbodygyro_zaxis_stddev",
                                  "tbodygyrojerk_xaxis_mean","tbodygyrojerk_yaxis_mean",
                                  "tbodygyrojerk_zaxis_mean","tbodygyrojerk_xaxis_stddev",
                                  "tbodygyrojerk_yaxis_stddev","tbodygyrojerk_zaxis_stddev",
                                  "tbodyaccmag_xyzaxis_mean","tbodyaccmag_xyzaxis_stddev",
                                  "tgravityaccmag_xyzaxis_mean","tgravityaccmag_xyzaxis_stddev",
                                  "tbodyaccjerkmag_xyzaxis_mean","tbodyaccjerkmag_xyzaxis_stddev",
                                  "tbodygyromag_xyzaxis_mean","tbodygyromag_xyzaxis_stddev",
                                  "tbodygyrojerkmag_xyzaxis_mean","tbodygyrojerkmag_xyzaxis_stddev",
                                  "fbodyacc_xaxis_mean","fbodyacc_yaxis_mean",
                                  "fbodyacc_zaxis_mean","fbodyacc_xaxis_stddev",
                                  "fbodyacc_yaxis_stddev","fbodyacc_zaxis_stddev",
                                  "fbodyacc_xaxis_freqmean","fbodyacc_yaxis_freqmean",
                                  "fbodyacc_zaxis_freqmean","fbodyaccjerk_xaxis_mean",
                                  "fbodyaccjerk_yaxis_mean","fbodyaccjerk_zaxis_mean",
                                  "fbodyaccjerk_xaxis_stddev","fbodyaccjerk_yaxis_stddev",
                                  "fbodyaccjerk_zaxis_stddev","fbodyaccjerk_xaxis_freqmean",
                                  "fbodyaccjerk_yaxis_freqmean","fbodyaccjerk_zaxis_freqmean",
                                  "fbodygyro_xaxis_mean","fbodygyro_yaxis_mean",
                                  "fbodygyro_zaxis_mean","fbodygyro_xaxis_stddev",
                                  "fbodygyro_yaxis_stddev","fbodygyro_zaxis_stddev",
                                  "fbodygyro_xaxis_freqmean","fbodygyro_yaxis_freqmean",
                                  "fbodygyro_zaxis_freqmean","fbodyaccmag_xyzaxis_mean",
                                  "fbodyaccmag_xyzaxis_stddev","fbodyaccmag_xyzaxis_freqmean",
                                  "fbodyaccjerkmag_xyzaxis_mean","fbodyaccjerkmag_xyzaxis_stddev",
                                  "fbodyaccjerkmag_xyzaxis_freqmean","fbodygyromag_xyzaxis_mean",
                                  "fbodygyromag_xyzaxis_stddev","fbodygyromag_xyzaxis_freqmean",
                                  "fbodygyrojerkmag_xyzaxis_mean","fbodygyrojerkmag_xyzaxis_stddev",
                                  "fbodygyrojerkmag_xyzaxis_freqmean")


## Aggregate function to create a second tidy dataset. 
##Each row comprise of 79 average variables for each of subject/activity combination. 
##81 columns in total and 30 subjects * 6 activity=180 rows in total
tidydataset2<-aggregate(x=tidydataset1[,c(-1,-2)],by=list(tidydataset1$subject,
                      tidydataset1$activity),FUN=mean, na.rm=TRUE,simplify=T)
## Modifying Column names for the tidydataset2
colnames(tidydataset2)[c(1,2)]<-c("subject","activity") 
##creating the output files tidydataset1 & tidydataset2 in the home directory
write.table(tidydataset1,file="tidydataset1.txt")
write.table(tidydataset2,file="tidydataset2.txt")




