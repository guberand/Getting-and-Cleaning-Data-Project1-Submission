
========================================================================================
GETTING AND CLEANING DATA- PROJECT 1 SUBMISSION

=========================================================================================

The goal is to prepare tidy data that can be used for later analysis. 
Dataset is downloaded from site: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Following files are used in order to achieve the goal of creating two tidy datasets

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


=========================================
tidydataset1
=========================================
tidydataset1 comprise of 79 columns that represent mean, standard deviation and meanfreq columns from the merged data of test and train raw dataset. 

=========================================
tidydataset2
=========================================
tidydataset1 comprise of total of 81 columns: 79 columns that represent average of each of the columns that represent mean, standard deviation and meanfreq from the merged data of test and train raw dataset. 
In addition the first two columns are subject and activity names. In total it has a total of 30*6=180 rows representing each combination of subject& activity name.


The project submission includes the following files:
=========================================


1.  'README.md'
2.  'CodeBook.md'- Shows the list of variables and its description
3.  'run_analysis.R' - R script to read the raw dataset and create tidy dataset. And using the tidy dataset create another dataset with the average of the 79 variables
4. 'tidydataset2.txt'-  Independent tidy data set with the average of each variable for each activity and each subject.







