# Getting and Cleaning Data

## Overview
The purpose of this project is to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

One of the most exciting areas in all of data science right now is wearable computing - see for example 
this article: http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Repository Contents
- `run_analysis.R` – R script for data cleaning and transformation.
- `tidy_dataset.txt` – The final tidy dataset.
- `CodeBook.md` – A code book that describes the variables, the data, and any transformations to clean the dataset.
  
## Data Processing Steps
The `run_analysis.R` script performs the following operations:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Instructions
To execute the script and generate the tidy dataset, run:
```r
source("run_analysis.R")
