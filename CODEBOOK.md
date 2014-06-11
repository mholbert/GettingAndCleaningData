CODEBOOK
=============================
This data is from the Human Activity Recognition Using Smartphones Dataset (version 1.0).  This can be obtained directly from the source at:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Description
-----------------------------
From their attached README.txt:

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

#### For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

#### The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

#### The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. "

Transformation
-----------------------------
1. The first step was to read in the data, subject, y files for both training and test data and merge those together.
2. Next, we read in the feature table and made the measurement variables easier to read.
3. Next, we limited the columns, per the project requirements, to only those columns that contained identifiers marking them as mean or standard deviation columns.
4. Next, we read in the activity table which allows us to convert the numeric activity indentifier into an easier to read format
    * 1:Walking
    * 2:Walking upstairs
    * 3:Walking downstairs
    * 4:Sitting
    * 5:Standing
    * 6:Laying
5. Finally, we summarized the data by subject and activity by finding the means and generated a tidy output file.  This file is a tab-delimited text file

Output File
-----------------------------
The output file contains one row for each subject-activity pair.  There were a total of 30 subject with 6 activity categories for each.  Thus, the output file contains 180 observations.  We have included the means of all 86 variables that contained identifiers that they held mean or standard deviation identifiers (std or mean) in the column names.  We have converted these to lowercase in order to improve ease of use.

Verification
-----------------------------
Finally, we have included a commented line to read in the output file so that it can be easily viewed.  This is at the end of the script file, run_analysis.R

```
TidyDataVerify <- read.table("TidyData.txt", header=TRUE)
```
