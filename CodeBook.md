################################################################################
### CodeBook for Tidy Dataset
################################################################################

This code book describes the variables, data, and transformations performed to create the tidy dataset 
`tidy_data.txt` using the `run_analysis.R` script.

---
## Source Data

The dataset originates from the Human Activity Recognition Using Smartphones Dataset, available at the UCI Machine Learning Repository. 
The raw dataset can be downloaded [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

### Original Dataset Structure

- **Activity Labels (`activity_labels.txt`)**: A mapping of activity IDs to descriptive activity names.
- **Features (`features.txt`)**: A list of 561 features recorded in the dataset.
- **Test Data**:
  - `X_test.txt`: Feature measurements for the test set.
  - `Y_test.txt`: Activity IDs corresponding to each row in `X_test.txt`.
  - `subject_test.txt`: Subject IDs corresponding to each row in `X_test.txt`.
- **Train Data**:
  - `X_train.txt`: Feature measurements for the train set.
  - `Y_train.txt`: Activity IDs corresponding to each row in `X_train.txt`.
  - `subject_train.txt`: Subject IDs corresponding to each row in `X_train.txt`.
---

## Tidy Dataset Description

The final dataset, `tidy_data.txt`, is a tidy dataset summarizing the mean of each measurement for each activity and each subject.

### Variables

1. **`Subject`**:
   - Type: Integer
   - Description: Identifier for the subject who performed the activity (ranges from 1 to 30).

2. **`Activity`**:
   - Type: Factor
   - Description: Descriptive name of the activity performed. Possible values:
     - `WALKING`
     - `WALKING_UPSTAIRS`
     - `WALKING_DOWNSTAIRS`
     - `SITTING`
     - `STANDING`
     - `LAYING`

3. **Feature Variables**:
   - Type: Numeric
   - Description: Mean of each measurement for a specific combination of subject and activity. 
   - Variable Names: Each variable represents a feature from the original dataset with descriptive naming conventions applied. Examples include:
     - `TimeBodyAccelerometerMeanX`: Mean of the time-domain body acceleration signal along the X-axis.
     - `TimeBodyAccelerometerSTDY`: Standard deviation of the time-domain body acceleration signal along the Y-axis.
     - `FrequencyBodyGyroscopeMagnitudeSTD`: Standard deviation of the frequency-domain gyroscope magnitude.
   - A total of 88 feature variables were retained, focusing on measurements of mean (`mean()`) and standard deviation (`std()`).

---

## Transformations Performed

The following steps were performed to clean and tidy the dataset:

1. **Merge Training and Test Sets**:
   - The `X_test` and `X_train` datasets were combined into one dataset for feature measurements.
   - The `Y_test` and `Y_train` datasets were combined into one dataset for activity labels.
   - The `subject_test` and `subject_train` datasets were combined into one dataset for subject IDs.

2. **Extract Mean and Standard Deviation Measurements**:
   - Selected only the columns from the feature dataset that contained `mean()` or `std()` in their names.

3. **Use Descriptive Activity Names**:
   - Replaced numeric activity IDs in the `Y_data` dataset with their corresponding descriptive names using the `activity_labels.txt` file.

4. **Label Variables with Descriptive Names**:
   - Applied the following transformations to improve variable names:
     - Prefix `t` was replaced with `Time` to indicate time-domain signals.
     - Prefix `f` was replaced with `Frequency` to indicate frequency-domain signals.
     - `Acc` was replaced with `Accelerometer`.
     - `Gyro` was replaced with `Gyroscope`.
     - `Mag` was replaced with `Magnitude`.
     - `-mean()` was replaced with `Mean`.
     - `-std()` was replaced with `STD`.
     - Removed special characters such as `-` and `()`.

5. **Create a Tidy Dataset**:
   - Grouped the dataset by `Subject` and `Activity`.
   - Calculated the mean of each feature variable for each combination of `Subject` and `Activity`.

6. **Save the Tidy Dataset**:
   - The resulting dataset was written to a file named `tidy_data.txt` in the working directory.

---

## Notes

- The tidy dataset follows the principles of tidy data:
  - Each variable is in its own column.
  - Each observation (activity by subject) is in its own row.
  - Each value is stored in a single cell.
- Only mean and standard deviation measurements were retained as per the project requirements.

---

## License

This code book is provided for the `tidy_data.txt` dataset created from the UCI HAR Dataset. The original 
dataset is licensed under its respective terms by the UCI Machine Learning Repository.
