
**Getting and cleaning data course project**

**Data Source**

Data was downloaded from the following location:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Description of the dataset is located here:

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

**Data Set description**

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data.

**Record description**

For each record in the dataset the following information is included:

-   Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.

-   Triaxial Angular velocity from the gyroscope.

-   A 561-feature vector with time and frequency domain variables.

-   It’s activity label.

-   An identifier of the subject who carried out the experiment.

**Run Analysis description**

***Step 1:***

-   Read the compresses dataset from the source.

-   Uncompress the dataset into the UCI HAR Dataset directory.

-   Read the following datasets into as data tables:

    -   X\_train.txt

    -   y\_train.txt

    -   subject\_train.txt

    -   X\_test.txt

    -   y\_test.txt

    -   subject\_test.txt

    -   features.txt

    -   activity\_labels.txt

***Step 2:***

-   Get the list of features and create a list of measurement needed, by filtering out the other measurements (we need only mean and standard deviation of all measurements).

-   Remove the unwanted measurements from train and test datasets.

***Step 3:***

-   Combine the subjects and activities list with the data for both train and test.

-   Combine train and test datasets in to the clean dataset and label the columns.

-   Write out the complete ‘clean dataset’, into the working directory.

***Step 4:***

-   Create a tidy dataset with the average of each variable for each activity and each subject.

-   The tidy dataset has a dimension of 180 \* 66 ; 30 subjects participated in 6 different activities, and hence 180 rows of data ; Std deviation and mean values of 33 different measurements are included for each data row, and hence 66 columns.

-   Write out the tidy dataset ‘tidy\_data.txt’ into the working directory.
