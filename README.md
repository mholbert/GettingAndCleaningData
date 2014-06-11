Getting and Cleaning Data - Course Project
========================================================


Introduction
--------------------------------------------------------
This contains the coursework for the Coursera class "Getting and Cleaning Data" that started June, 2014


Stated Goal
-------------------------------------------------------
"The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected."


Data Requirements
-------------------------------------------------------
In order to run this project, you will need the raw data as provided.  The .zip file should unzipped in the working directory, giving you a directory "UCI HAR Dataset".  You can download the zip file from the following link.  However, I have also included the unzipped directory in this reposiory.

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


Script
-------------------------------------------------------
The only script that is needed is run_analysis.R.  This does have a dependecy on the reshape2 package.  This should be standard on your R installation.  However, if you do not have this pacakge it can be installed by:

```
install.package("reshape2")
```


Output
-------------------------------------------------------
The output file is named TidyData.txt.  The script includes a portion that is commented out that you can run in order to reload the file at the end of the unit test.  This is a tab-delimited file.

Please reference the CodeBook.md file for a more in-depth discussion of the input and output files and the transformations between the two.