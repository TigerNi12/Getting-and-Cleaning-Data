# CodeBook for UCI HAR Tidy Dataset  

## 1. Overview  
This CodeBook describes the dataset and transformations applied in the *Getting and Cleaning Data* project. The dataset is derived from the **Human Activity Recognition (HAR) dataset**, which contains data from smartphone accelerometers.  

Original dataset: [UCI HAR Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)  

---

## 2. Variables in the Tidy Dataset  
This dataset contains **subject identifiers**, **activity labels**, and **measurements** related to smartphone sensor data.  

### **Identifiers**  
| Variable | Description |
|----------|-------------|
| `subject` | ID of the person (range: 1-30) |
| `activity` | Type of activity performed (e.g., WALKING, SITTING) |

### **Sensor Measurements**  
Only **mean** and **standard deviation** measurements are included.  

| Variable Name | Description |
|--------------|-------------|
| `TimeBodyAccMeanX` | Mean of Body Acceleration (X-axis) |
| `TimeBodyAccMeanY` | Mean of Body Acceleration (Y-axis) |
| `TimeBodyAccMeanZ` | Mean of Body Acceleration (Z-axis) |
| `TimeBodyAccStdX` | Standard Deviation of Body Acceleration (X-axis) |
| `TimeBodyAccStdY` | Standard Deviation of Body Acceleration (Y-axis) |
| `TimeBodyAccStdZ` | Standard Deviation of Body Acceleration (Z-axis) |
| `FrequencyBodyAccMeanX` | Mean of Body Acceleration in Frequency Domain (X-axis) |
| `FrequencyBodyAccStdX` | Standard Deviation of Body Acceleration in Frequency Domain (X-axis) |
| ... | (Additional similar measurements for Gyroscope and other sensors) |

---

## 3. Data Transformations  
The following steps were applied to clean and process the data:  

1. **Merged Training and Test Data**  
   - Combined `X_train.txt` and `X_test.txt` into one dataset.  
   - Combined `y_train.txt` and `y_test.txt` into one dataset.  
   - Combined `subject_train.txt` and `subject_test.txt` into one dataset.  

2. **Extracted Only Mean and Standard Deviation Measurements**  
   - Selected only features containing `mean()` and `std()`.

3. **Assigned Descriptive Activity Names**  
   - Mapped numeric activity labels (`1-6`) to human-readable names (e.g., WALKING, SITTING).  

4. **Renamed Variables for Clarity**  
   - `"tBodyAcc-mean()-X"` → `"TimeBodyAccMeanX"`  
   - `"fBodyAcc-std()-Y"` → `"FrequencyBodyAccStdY"`  

5. **Created a Second Tidy Dataset**  
   - Grouped by `subject` and `activity`.  
   - Computed the average of each measurement per subject and activity.  
   - Saved the dataset as `tidy_dataset.txt`.

---

## 4. Activity Labels  
The activities are labeled as follows:  

| Activity ID | Activity Name |
|------------|--------------|
| 1 | WALKING |
| 2 | WALKING_UPSTAIRS |
| 3 | WALKING_DOWNSTAIRS |
| 4 | SITTING |
| 5 | STANDING |
| 6 | LAYING |

---

## 5. Repository Files  
- `run_analysis.R` – The R script for data cleaning and transformation.  
- `tidy_dataset.txt` – The final tidy dataset.  
- `README.md` – Instructions for running the project.  
- `CodeBook.md` – This document.  

---

## 6. License  
This dataset follows the [MIT License](LICENSE).  
