The run_analysis R script imports data collected from the accelerometers from the Samsung Galaxy S smartphone.  It then cleans up the data by assigning column names and merging all of the files into one data set, keeping only the subject ID, activity and variables that refer to the mean or standard deviation of a measure.  It then outputs the tidy data set to a text file, summarizes all fo the data with the mean value for each activity by subject number (keeping NA values when the subject did not have data for that activity) and outputs this sumamry data set to a text file.

#code to input tidy data file and name it tidy.import
tidy.import <- read.table("./tidy.txt",sep = " ")

#code to input tidy data summary file and name it tidy_average.import
tidy_average.import <- read.table("./tidy_average.txt",sep = " ")

