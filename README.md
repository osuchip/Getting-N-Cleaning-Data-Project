
Project for Getting and Cleaning Data Class

Here is a brief description on how to execute run_analysis.R and the resulting files generated.

	•	Place the run_analysis.R in your working directory.

	•	The compressed dataset will be downloaded and unpacked into the UCI HAR Dataset directory
		in your working directory.

	•	Source the script run_analysis.R

	•	Two files will be written out :
		o	clean_data.txt – combined dataset of both the test and train dataset
		o	tidy_data.txt – Contains dataset with the average of each variable for each activity
			and each subject
		
	•	Use data <- read.table(“tidy_data.txt) to read in the dataset for your analysis.
