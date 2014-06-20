
Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

VARIABLES:
The data set contains 68 variables.  The subject number (1-30), the activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) and 66 separate measurements collected on the means and standard deviations of the data described above.

DATA CLEANING:
The run_analysis R script imports data collected from the accelerometers from the Samsung Galaxy S smartphone.  It then cleans up the data by assigning column names and merging all of the files into one data set, keeping only the subject ID, activity and variables that refer to the mean or standard deviation of a measure.  It then outputs the tidy data set to a text file, summarizes all fo the data with the mean value for each activity by subject number (keeping NA values when the subject did not have data for that activity) and outputs this sumamry data set to a text file.