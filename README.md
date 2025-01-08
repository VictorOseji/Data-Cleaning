################################################################################
### Summarising Human Activity Recognition Dataset
################################################################################

# README: run_analysis.R Script

## Overview

The `run_analysis.R` script processes the Human Activity Recognition Using Smartphones Dataset, downloaded from the UCI Machine Learning Repository, to produce a tidy dataset summarizing the mean of each measurement for each activity and each subject. The script performs several data processing steps to clean and organize the dataset according to the requirements.

---

## Dataset Description

The dataset used in this analysis represents data collected from the accelerometers and gyroscopes of smartphones carried by participants during various activities. The dataset includes the following components:

- **Train and Test Data**: Measurements split into `train` and `test` datasets.
- **Activity Labels**: Mapping of activity IDs to descriptive activity names.
- **Features**: Names of the recorded measurements.
- **Subject Data**: Identifiers of participants in the study.

The raw dataset can be downloaded from [this link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

---

## Steps Performed by the Script

1. **Download and Unzip the Dataset**:
   - The script downloads the dataset zip file from the given URL and extracts it into the working directory.

2. **Load the Data**:
   - Reads the activity labels and features metadata.
   - Loads the test and train datasets, including subject identifiers, activity IDs, and measurement data.

3. **Merge the Training and Test Sets**:
   - Combines the test and train datasets into one unified dataset.

4. **Extract Mean and Standard Deviation Measurements**:
   - Selects only the columns related to the mean (`mean()`) and standard deviation (`std()`) of each measurement.

5. **Use Descriptive Activity Names**:
   - Replaces numeric activity IDs with their descriptive names, such as "WALKING" or "SITTING."

6. **Label the Dataset with Descriptive Variable Names**:
   - Updates column names to make them more human-readable and descriptive (e.g., `tBodyAcc-mean()` becomes `TimeBodyAccelerometerMean`).

7. **Create a Second Independent Tidy Dataset**:
   - Groups the data by `Subject` and `Activity`.
   - Calculates the average of each variable for each activity and each subject.
   - Produces a tidy dataset with this summarized information.

8. **Save the Tidy Dataset**:
   - Writes the tidy dataset to a file named `tidy_data.txt` in the working directory.
   
---





