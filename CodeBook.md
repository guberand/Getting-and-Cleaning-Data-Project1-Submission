

==============================================================================
STUDY DESIGN
==============================================================================
The project need is to extract only the measurements on the mean and standard deviation for each measurements. 
For the below 17 measurements, variables that represent mean and standard deviation are extracted. 

1.	tBodyAcc-XYZ
2.	tGravityAcc-XYZ
3.	tBodyAccJerk-XYZ
4.	tBodyGyro-XYZ
5.	tBodyGyroJerk-XYZ
6.	tBodyAccMag
7.	tGravityAccMag
8.	tBodyAccJerkMag
9.	tBodyGyroMag
10.	tBodyGyroJerkMag
11.	fBodyAcc-XYZ
12.	fBodyAccJerk-XYZ
13.	fBodyGyro-XYZ
14.	fBodyAccMag
15.	fBodyAccJerkMag
16.	fBodyGyroMag
17.	fBodyGyroJerkMag


Definitions for mean(), std() and meanFreq() from features_info.txt document,
mean(): Mean value
std(): Standard deviation
meanFreq(): Weighted average of the frequency components to obtain a mean frequency

After some contemplation and some searches, I realized that weighted average is nothing but mean where instead of each of the data 
points contributing equally to the final average, some data points contribute more than others.
Reference: http://en.wikipedia.org/wiki/Weighted_arithmetic_mean

Going by the definitions for mean(), std() and meanFreq() any time domain or frequency domain variables with the column names having the wording mean(), std() and meanFreq() are pulled out
in order to create tidy dataset. 

Column names for the variables representing mean(), std() and meanFreq() are pulled out from features.txt document. Column names are modified to make it understandable, consistent
and easily useable for coding purpose.
Following rules are applied to create column names. 
1. Remove the following special characters "[()-+]" from column name
2. All letters in lower case
3. Format for column name "MeasuringVariable_axis_measurement". "Measurement" part of the variable name could be one of mean, stddev(standard deviation of the variable) or freqmean(mean of frequency of the variable)
      and  "Axis" could be one of xaxis, yaxis or xyzaxis(For 3-dimension variables).


There are a total of 79 columns that represent mean, standard deviation or mean of frequency in the provided raw dataset. 

================================================================================
TIDY DATASET 1/
================================================================================

Following steps were created in R script in order to create the tidy data set

1. Download file 
2. for test dataset - created data.frame seperate dataframe using "X_test.txt", "subject_test.txt" and "y_test.txt". First dataframe to read the accelerometer and gyroscope, second dataframe to get the subjects associated 
to each record in the signal dataframe and a third dataframe to get the activity codes associated to each record in the signal dataframe. 
3.for train dataset- created data.frame seperate dataframe using "X_train.txt", "subject_train.txt" and "y_train.txt". First dataframe to read the accelerometer and gyroscope, second dataframe to get the subjects associated 
to each record in the signal dataframe and a third dataframe to get the activity codes associated to each record in the signal dataframe. 
4. Activity codes are mapped to the corresponding activity names and the data is merged to test as well as train activity code dataframe
5. Activity description and subjects are merged using cbind function to the corresponding train and test data to create a test dataframe and train dataframe with 563 columns each. 
6. Using rbind function merged to merge testdataframe and train dataframe
7. Subset the dataframe from previous step to get create a new dataframe with only the columns subject, activity name and the columns for mean, stddev and meanfreq. There are a total of 81 columns in this dataframe. 
8. In this step TIDYDATASET1 is created by giving meaningful column names as per rules listed out under above section "Study Design". 

================================================================================
TIDY DATASET 2
================================================================================
9. Created TIDYDATASET2 using aggregate function in order to create a dataframe with 30*6= 180 rows with columns equal to 81 columns, first two for subject and activity. And the rest for average of each of the  79 variables. 
10.  Final step, exported TIDYDATASET2  as "tidydataset2.txt" file 

================================================================================
CODE BOOK
================================================================================


------------------------------------------------------------------------------------------------------------------------------------------
            			DATA DICTIONARY- TIDYDATASET
------------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------
RAW DATA VARIABLE NAME  VS   TIDY DATA VARIABLE NAME  MAPPING
-----------------------------------------------------------------------------------------------------------------
				subject
				activity
1 tBodyAcc-mean()-X    =   tbodyacc_xaxis_mean

2 tBodyAcc-mean()-Y    =   tbodyacc_yaxis_mean 

3 tBodyAcc-mean()-Z    =   tbodyacc_zaxis_mean 

4 tBodyAcc-std()-X    =    tbodyacc_xaxis_stddev 

5 tBodyAcc-std()-Y    =   tbodyacc_yaxis_stddev

6 tBodyAcc-std()-Z    =    tbodyacc_zaxis_stddev

41 tGravityAcc-mean()-X    =   tgravityacc_xaxis_mean

42 tGravityAcc-mean()-Y    =    tgravityacc_yaxis_mean

43 tGravityAcc-mean()-Z    =   tgravityacc_zaxis_mean

44 tGravityAcc-std()-X     =   tgravityacc_xaxis_stddev

45 tGravityAcc-std()-Y    =   tgravityacc_yaxis_stddev

46 tGravityAcc-std()-Z    =    tgravityacc_zaxis_stddev

81 tBodyAccJerk-mean()-X    =   tbodyaccjerk_xaxis_mean

82 tBodyAccJerk-mean()-Y    =   tbodyaccjerk_yaxis_mean

83 tBodyAccJerk-mean()-Z     =   tbodyaccjerk_zaxis_mean

84 tBodyAccJerk-std()-X    =    tbodyaccjerk_xaxis_stddev

85 tBodyAccJerk-std()-Y    =   tbodyaccjerk_yaxis_stddev

86 tBodyAccJerk-std()-Z    =   tbodyaccjerk_zaxis_stddev

121 tBodyGyro-mean()-X    =   tbodygyro_xaxis_mean

122 tBodyGyro-mean()-Y    =    tbodygyro_yaxis_mean

123 tBodyGyro-mean()-Z     =    tbodygyro_zaxis_mean

124 tBodyGyro-std()-X    =   tbodygyro_xaxis_stddev

125 tBodyGyro-std()-Y    =    tbodygyro_yaxis_stddev

126 tBodyGyro-std()-Z    =    tbodygyro_zaxis_stddev

161 tBodyGyroJerk-mean()-X    =   tbodygyrojerk_xaxis_mean

162 tBodyGyroJerk-mean()-Y    =    tbodygyrojerk_yaxis_mean

163 tBodyGyroJerk-mean()-Z    =   tbodygyrojerk_zaxis_mean

164 tBodyGyroJerk-std()-X     =   tbodygyrojerk_xaxis_stddev

165 tBodyGyroJerk-std()-Y    =   tbodygyrojerk_yaxis_stddev

166 tBodyGyroJerk-std()-Z    =    tbodygyrojerk_zaxis_stddev

201 tBodyAccMag-mean()    =   tbodyaccmag_xyzaxis_mean 

202 tBodyAccMag-std()    =   tbodyaccmag_xyzaxis_stddev

214 tGravityAccMag-mean()    =   tgravityaccmag_xyzaxis_mean

215 tGravityAccMag-std()    =   tgravityaccmag_xyzaxis_stddev

227 tBodyAccJerkMag-mean()    =    tbodyaccjerkmag_xyzaxis_mean

228 tBodyAccJerkMag-std()    =   tbodyaccjerkmag_xyzaxis_stddev

240 tBodyGyroMag-mean()    =   tbodygyromag_xyzaxis_mean	
		
241 tBodyGyroMag-std()    =   tbodygyromag_xyzaxis_stddev

253 tBodyGyroJerkMag-mean()    =   tbodygyrojerkmag_xyzaxis_mean

254 tBodyGyroJerkMag-std()    =    tbodygyrojerkmag_xyzaxis_stddev

266 fBodyAcc-mean()-X    =   fbodyacc_xaxis_mean

267 fBodyAcc-mean()-Y    =   fbodyacc_yaxis_mean

268 fBodyAcc-mean()-Z    =   fbodyacc_zaxis_mean

269 fBodyAcc-std()-X	    =   fbodyacc_xaxis_stddev

270 fBodyAcc-std()-Y	    =   fbodyacc_yaxis_stddev

271 fBodyAcc-std()-Z	    =   fbodyacc_zaxis_stddev

294 fBodyAcc-meanFreq()-X    =   fbodyacc_xaxis_freqmean

295 fBodyAcc-meanFreq()-Y    =   fbodyacc_yaxis_freqmean

296 fBodyAcc-meanFreq()-Z    =   fbodyacc_zaxis_freqmean

345 fBodyAccJerk-mean()-X    =   fbodyaccjerk_xaxis_mean
		
346 fBodyAccJerk-mean()-Y    =   fbodyaccjerk_yaxis_mean

347 fBodyAccJerk-mean()-Z    =   fbodyaccjerk_zaxis_mean

348 fBodyAccJerk-std()-X    =   fbodyaccjerk_xaxis_stddev 

349 fBodyAccJerk-std()-Y    =   fbodyaccjerk_yaxis_stddev 

350 fBodyAccJerk-std()-Z    =   fbodyaccjerk_zaxis_stddev 

373 fBodyAccJerk-meanFreq()-X	    =   fbodyaccjerk_xaxis_freqmean

374 fBodyAccJerk-meanFreq()-Y	    =   fbodyaccjerk_yaxis_freqmean

375 fBodyAccJerk-meanFreq()-Z	    =   fbodyaccjerk_zaxis_freqmean

424 fBodyGyro-mean()-X    =   fbodygyro_xaxis_mean

425 fBodyGyro-mean()-Y    =   fbodygyro_yaxis_mean

426 fBodyGyro-mean()-Z    =   fbodygyro_zaxis_mean

427 fBodyGyro-std()-X    =   fbodygyro_xaxis_stddev

428 fBodyGyro-std()-Y    =   fbodygyro_yaxis_stddev

429 fBodyGyro-std()-Z    =   fbodygyro_zaxis_stddev

452 fBodyGyro-meanFreq()-X    =   fbodygyro_xaxis_freqmean

453 fBodyGyro-meanFreq()-Y    =   fbodygyro_yaxis_freqmean

454 fBodyGyro-meanFreq()-Z    =   fbodygyro_zaxis_freqmean

503 fBodyAccMag-mean()    =   fbodyaccmag_xyzaxis_mean

504 fBodyAccMag-std()    =   fbodyaccmag_xyzaxis_stddev

513 fBodyAccMag-meanFreq()    =   fbodyaccmag_xyzaxis_freqmean

516 fBodyBodyAccJerkMag-mean()    =   fbodyaccjerkmag_xyzaxis_mean		

517 fBodyBodyAccJerkMag-std()    =   fbodyaccjerkmag_xyzaxis_stddev

526 fBodyBodyAccJerkMag-meanFreq()    =   fbodyaccjerkmag_xyzaxis_freqmean

529 fBodyBodyGyroMag-mean()    =   fbodygyromag_xyzaxis_mean	

530 fBodyBodyGyroMag-std()    =   fbodygyromag_xyzaxis_stddev

539 fBodyBodyGyroMag-meanFreq()    =   fbodygyromag_xyzaxis_freqmean

542 fBodyBodyGyroJerkMag-mean()    =   fbodygyrojerkmag_xyzaxis_mean

543 fBodyBodyGyroJerkMag-std()    =   fbodygyrojerkmag_xyzaxis_stddev

552 fBodyBodyGyroJerkMag-meanFreq()    =   fbodygyrojerkmag_xyzaxis_freqmean

		
-------------------------------------------------------------------------------------------------------------------------------------------
TIDY DATA VARIABLE NAME AND ITS DESCRIPTION                                                            
----------------------------------------------------------------------------------------------------------------------------------------------

1.	Subject    :- Represents in number the 30 volunteers within an age bracket of 19-48 years
                                      	1.....30 . Integer 
2.	Activity    :- Represents activities performed by subjects
                        		WALKING
                        		WALKING_UPSTAIRS
                        		WALKING_DOWNSTAIRS
                        		 SITTING
                         		STANDING
                         		LAYING
3.	tbodyacc_xaxis_mean     :- time domain body acceleration mean data for X-axis dimension 
                                                               	numeric value with exponential notation
4.	tbodyacc_yaxis_mean     :- time domain body acceleration mean data for Y-axis dimension
				numeric value with exponential notation
5.	tbodyacc_zaxis_mean     :- time domain body acceleration mean data for Y-axis dimension
				numeric value with exponential notation
6.	tbodyacc_xaxis_stddev   :- time domain body acceleration standard deviation data for X-axis dimension 
				numeric value with exponential notation	
7.	tbodyacc_yaxis_stddev   :- time domain body acceleration standard deviation data for Y-axis dimension 
				numeric value with exponential notation
8.	tbodyacc_zaxis_stddev   :- time domain body acceleration standard deviation data for Z-axis dimension 
				numeric value with exponential notation

9.	tgravityacc_xaxis_mean  :- time domain gravity acceleration mean data for X-axis dimension 
				numeric value with exponential notation
10.	tgravityacc_yaxis_mean  :- time domain gravity acceleration mean data for Y-axis dimension
				numeric value with exponential notation
11.	tgravityacc_zaxis_mean  :- time domain gravity acceleration mean data for Y-axis dimension
				numeric value with exponential notation
12.	tgravityacc_xaxis_stddev :- time domain gravity acceleration standard deviation data for X-axis dimension 
				numeric value with exponential notation
13.	tgravityacc_yaxis_stddev :- time domain gravity acceleration standard deviation data for Y-axis dimension 
				numeric value with exponential notation
14.	tgravityacc_zaxis_stddev :- time domain gravity acceleration standard deviation data for Z-axis dimension 
				numeric value with exponential notation

15.	tbodyaccjerk_xaxis_mean  :- time domain jerk body acceleration mean data for X-axis dimension
				numeric value with exponential notation
16.	tbodyaccjerk_yaxis_mean  :- time domain jerk body acceleration mean data for Y-axis dimension
				numeric value with exponential notation
17.	tbodyaccjerk_zaxis_mean  :- time domain jerk body acceleration mean data for Z-axis dimension
				numeric value with exponential notation
18.	tbodyaccjerk_xaxis_stddev :- time domain jerk body acceleration standard deviation data for X-axis dimension
				numeric value with exponential notation
19.	tbodyaccjerk_yaxis_stddev :- time domain jerk body acceleration standard deviation data for Y-axis dimension
				numeric value with exponential notation
20.	tbodyaccjerk_zaxis_stddev :- time domain jerk body acceleration standard deviation data for Z-axis dimension
				numeric value with exponential notation

21.	tbodygyro_xaxis_mean   :- time domain body angular velocity mean data for X-axis dimension
				numeric value with exponential notation
22.	tbodygyro_yaxis_mean   :- time domain body angular velocity mean data for Y-axis dimension
				numeric value with exponential notation
23.	tbodygyro_zaxis_mean   :- time domain body angular velocity mean data for Z-axis dimension
				numeric value with exponential notation
24.	tbodygyro_xaxis_stddev  :- time domain body angular velocity standard deviation data for X-axis dimension
				numeric value with exponential notation
25.	tbodygyro_yaxis_stddev  :- time domain body angular velocity standard deviation data for Y-axis dimension
				numeric value with exponential notation
26.	tbodygyro_zaxis_stddev  :- time domain body angular velocity standard deviation data for Z-axis dimension
				numeric value with exponential notation


27.	tbodygyrojerk_xaxis_mean :- time domain jerk body angular velocity mean data for X-axis dimension
				numeric value with exponential notation
28.	tbodygyrojerk_yaxis_mean :- time domain jerk body angular velocity mean data for Y-axis dimension
				numeric value with exponential notation
29.	tbodygyrojerk_zaxis_mean :- time domain jerk body angular velocity mean data for Z-axis dimension
				numeric value with exponential notation
30.	tbodygyrojerk_xaxis_stddev :- time domain jerk body angular velocity standard deviation data for X-axis dimension
				numeric value with exponential notation
31.	tbodygyrojerk_yaxis_stddev :- time domain jerk body angular velocity standard deviation data for Y-axis dimension
				numeric value with exponential notation
32.	tbodygyrojerk_zaxis_stddev :- time domain jerk body angular velocity standard deviation data for Z-axis dimension
				numeric value with exponential notation


33.	tbodyaccmag_xyzaxis_mean   :- time domain body acceleration magnitude mean data for XYZ-axis
				numeric value with exponential notation
34.	tbodyaccmag_xyzaxis_stddev :- time domain body acceleration magnitude standard deviation data for XYZ-axis
				numeric value with exponential notation


35.	tgravityaccmag_xyzaxis_mean   :- time domain gravity acceleration magnitude mean data for XYZ-axis
					numeric value with exponential notation
36.	tgravityaccmag_xyzaxis_stddev :- time domain gravity acceleration magnitude standard deviation data for XYZ-axis
					numeric value with exponential notation


37.	tbodyaccjerkmag_xyzaxis_mean  :- time domain jerk body acceleration magnitude mean data for XYZ-axis
					numeric value with exponential notation
38.	tbodyaccjerkmag_xyzaxis_stddev :- time domain jerk body acceleration magnitude standard deviation data for XYZ-axis
					numeric value with exponential notation


39.	tbodygyromag_xyzaxis_mean    :- time domain body angular velocity mean data for XYZ-axis 
					numeric value with exponential notation
40.	tbodygyromag_xyzaxis_stddev  :- time domain body angular velocity standard deviation data for XYZ-axis 
					numeric value with exponential notation


41.	tbodygyrojerkmag_xyzaxis_mean    :-time domain jerk body angular velocity mean data for XYZ-axis 
					numeric value with exponential notation
42.	tbodygyrojerkmag_xyzaxis_stddev  :- time domain jerk body angular velocity standard deviation data for XYZ-axis 
					numeric value with exponential notation


43.	fbodyacc_xaxis_mean  :- frequency domain body acceleration mean data for X-axis dimension
					numeric value with exponential notation
44.	fbodyacc_yaxis_mean  :-frequency domain body acceleration mean data for Y-axis dimension
					numeric value with exponential notation
45.	fbodyacc_zaxis_mean  :-frequency domain body acceleration mean data for Y-axis dimension
					numeric value with exponential notation
46.	fbodyacc_xaxis_stddev  :-frequency domain body acceleration standard deviation data for X-axis dimension 
					numeric value with exponential notation
47.	fbodyacc_yaxis_stddev  :-frequency domain body acceleration standard deviation data for Y-axis dimension 
					numeric value with exponential notation
48.	fbodyacc_zaxis_stddev  :-frequency domain body acceleration standard deviation data for Z-axis dimension 
					numeric value with exponential notation
49.	fbodyacc_xaxis_freqmean  :-frequency domain body acceleration mean of frequency data for X-axis dimension
					numeric value with exponential notation
50.	fbodyacc_yaxis_freqmean  :-frequency domain body acceleration mean of frequency data for Y-axis dimension
					numeric value with exponential notation
51.	fbodyacc_zaxis_freqmean  :-frequency domain body acceleration mean of frequency data for Z-axis dimension
					numeric value with exponential notation


52.	fbodyaccjerk_xaxis_mean  :-frequency domain jerk body acceleration mean data for X-axis dimension
					numeric value with exponential notation
53.	fbodyaccjerk_yaxis_mean  :-frequency domain jerk body acceleration mean data for Y-axis dimension
					numeric value with exponential notation
54.	fbodyaccjerk_zaxis_mean  :-frequency domain jerk body acceleration mean data for Y-axis dimension
					numeric value with exponential notation
55.	fbodyaccjerk_xaxis_stddev   :-frequency domain jerk body acceleration standard deviation data for X-axis dimension 
					numeric value with exponential notation
56.	fbodyaccjerk_yaxis_stddev   :-frequency domain jerk body acceleration standard deviation data for Y-axis dimension 
					numeric value with exponential notation
57.	fbodyaccjerk_zaxis_stddev   :-frequency domain jerk body acceleration standard deviation data for Z-axis dimension 
					numeric value with exponential notation
58.	fbodyaccjerk_xaxis_freqmean   :-frequency domain jerk body acceleration mean of frequency data for X-axis dimension
					numeric value with exponential notation
59.	fbodyaccjerk_yaxis_freqmean   :-frequency domain jerk body acceleration mean of frequency data for Y-axis dimension
					numeric value with exponential notation
60.	fbodyaccjerk_zaxis_freqmean   :-frequency domain jerk body acceleration mean of frequency data for Z-axis dimension
					numeric value with exponential notation


61.	fbodygyro_xaxis_mean  :-frequency domain body angular velocity mean data for X-axis dimension
					numeric value with exponential notation
62.	fbodygyro_yaxis_mean  :-frequency domain body angular velocity mean data for Y-axis dimension
					numeric value with exponential notation
63.	fbodygyro_zaxis_mean  :- frequency domain body angular velocity mean data for Z-axis dimension
					numeric value with exponential notation
64.	fbodygyro_xaxis_stddev :-frequency domain body angular velocity standard deviation data for X-axis dimension
					numeric value with exponential notation
65.	fbodygyro_yaxis_stddev :- frequency domain body angular velocity standard deviation data for Y-axis dimension
					numeric value with exponential notation
66.	fbodygyro_zaxis_stddev :-frequency domain body angular velocity standard deviation data for Z-axis dimension
					numeric value with exponential notation
67.	fbodygyro_xaxis_freqmean  :- frequency domain body angular velocity mean of frequency data for X-axis dimension
					numeric value with exponential notation
68.	fbodygyro_yaxis_freqmean  :- frequency domain body angular velocity mean of frequency data for Y-axis dimension
					numeric value with exponential notation
69.	fbodygyro_zaxis_freqmean  :-frequency domain body angular velocity mean of frequency data for Z-axis dimension
					numeric value with exponential notation


70.	fbodyaccmag_xyzaxis_mean    :- frequency domain body acceleration magnitude mean data for XYZ-axis
					numeric value with exponential notation
71.	fbodyaccmag_xyzaxis_stddev  :-frequency domain body acceleration magnitude standard deviation data for XYZ-axis
					numeric value with exponential notation
72.	fbodyaccmag_xyzaxis_freqmean  :- frequency domain body acceleration magnitude mean of frequency data for XYZ-axis
					numeric value with exponential notation


73.	fbodyaccjerkmag_xyzaxis_mean  :- frequency domain jerk body acceleration magnitude mean data for XYZ-axis
					numeric value with exponential notation
74.	fbodyaccjerkmag_xyzaxis_stddev  :- frequency domain jerk body acceleration magnitude standard deviation data for XYZ-axis
					numeric value with exponential notation
75.	fbodyaccjerkmag_xyzaxis_freqmean  :-frequency domain jerk body acceleration magnitude mean of frequency data for XYZ-axis
					numeric value with exponential notation


76.	fbodygyromag_xyzaxis_mean         :-frequency domain body angular velocity magnitude mean data for XYZ-axis
					numeric value with exponential notation
77.	fbodygyromag_xyzaxis_stddev       :-frequency domain body angular velocity magnitude standard deviation data for XYZ-axis
					numeric value with exponential notation
78.	fbodygyromag_xyzaxis_freqmean  :- frequency domain body angular velocity magnitude mean of frequency data for XYZ-axis
					numeric value with exponential notation


79.	fbodygyrojerkmag_xyzaxis_mean        :- frequency domain jerk body angular velocity magnitude mean data for XYZ-axis
					numeric value with exponential notation
80.	fbodygyrojerkmag_xyzaxis_stddev       :- frequency domain jerk body angular velocity magnitude standard deviation data for XYZ-axis
					numeric value with exponential notation
81.	fbodygyrojerkmag_xyzaxis_freqmean  :-frequency domain jerk body angular velocity magnitude mean of frequency data for XYZ-axis
					numeric value with exponential notation







