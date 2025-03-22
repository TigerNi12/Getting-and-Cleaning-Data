# Install and load dplyr
if (!require("dplyr")) install.packages("dplyr")
library(dplyr)

# Download and extract dataset
dataset_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dataset_zip <- "UCI_HAR_Dataset.zip"

if (!file.exists(dataset_zip)) {
  download.file(dataset_url, destfile = dataset_zip, mode = "wb")
}

if (!file.exists("UCI HAR Dataset")) {
  unzip(dataset_zip)
}

# Load features and activity labels
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("index", "feature"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("activity_id", "activity"))

# Load training data
x_training <- read.table("UCI HAR Dataset/train/X_train.txt")
y_training <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activity_id")
subject_training <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")

# Load test data
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activity_id")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")

# Merge datasets with rbind()
x_data <- rbind(x_training, x_test)
y_data <- rbind(y_training, y_test)
subject_data <- rbind(subject_training, subject_test)

colnames(x_data) <- features$feature
merged_data <- cbind(subject_data, y_data, x_data)

# Extract mean and std measurements
mean_std_columns <- grepl("mean\\(\\)|std\\(\\)", features$feature)
selected_data <- merged_data[, c(TRUE, TRUE, mean_std_columns)]

# Use descriptive activity names from activity labels
selected_data <- merge(selected_data, activities, by = "activity_id", all.x = TRUE)
selected_data <- selected_data %>% select(subject, activity, everything(), -activity_id)

# Label data with descriptive variable names using gsub()
colnames(selected_data) <- gsub("^t", "Time", colnames(selected_data))
colnames(selected_data) <- gsub("^f", "Frequency", colnames(selected_data))
colnames(selected_data) <- gsub("Acc", "Accelerometer", colnames(selected_data))
colnames(selected_data) <- gsub("Gyro", "Gyroscope", colnames(selected_data))
colnames(selected_data) <- gsub("Mag", "Magnitude", colnames(selected_data))
colnames(selected_data) <- gsub("BodyBody", "Body", colnames(selected_data))

# Create a tidy dataset with averages
tidy_data <- selected_data %>%
  group_by(subject, activity) %>%
  summarise(across(everything(), mean), .groups = "drop")

# Save tidy dataset
write.table(tidy_data, "tidy_dataset.txt", row.name = FALSE)
