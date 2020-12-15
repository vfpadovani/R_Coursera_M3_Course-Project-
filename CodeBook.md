# Course Project CodeBook

This CodeBook contains the steps I took to clean and tidy the **Human Activity Recognition Using Smartfones** data set. For a full description of the data visit [this link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).  

The data was downloaded from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>.  

## The 'run_analisys.R' script

1. First I've loaded the Tidyverse package, which contains the base data manipulation tools that I've used in this project.  
2. The `if()` functions allows to verify the existence of the files in the designated working directory, download the data and extract it from the zip file.  
3. Using the `read.table()` function I've loaded all the meaning *.txt* files into R (all Train/Test files, in addition to Features/Activity Labels files).  
4. With the `grep(".mean|.std")` function I was able to extract from the *Features* table only the values that I was interested in, the ones that contain a mean or a standard deviation value, and assigned it as the vector *mean_std*.  
5. Then I've worked with `cbind()` to combine all the *Test* tables into one data frame, and did the same to the *Train* tables. within this instruction I've extracted the *mean_std* vector from *Train_set* and from *Test_set*. By now I have two data frames *Train* and *Test* containing all values for mean & std of all subjects and activities (but the variables need appropriate names).  
6. In this step I've set the variables names in both data frames, setting "Subjects" for subject and "Activities" for activity. Also I have extracted, using the same base `grep()` command with the '*value*' argument set as *TRUE*, the names for the rest of the variables, applied them, removed the "()" and switched "-" for "_" using the `gsub()` function.  
7. After setting the variables names in both data frames, used `rbind()` to combine both Train and Test data frames together into one almost complete but messy data frame called *full_ds*, which with a dplyr code I've selected the order of the columns setting *Subjects* as the first one.  
8. Set up the values for the "Activities" variable using `gsub()` changing the numbers for the correspondent activity names from *actv_labels*.    
9. With the `group_by()` command from the dplyr package I've grouped the *full_ds* data frame by Subjects and Activities, then applied the mean over each column for each subject and activity using the `across()` function within `summarise()`. Then I've assigned the tidy data frame as *tidy_ds* .   
10. With the work complete, I've saved the second independent data frame as a *.txt* file called "**tidy_data.txt**" in the working directory. Set a load code for this file.  

## The variables names 

All the variables names (except from "Activities" and "Subjects") are descripted in the '*features_info.txt*' file. Wth adapted removal of "()" and switch of separation from "-" to "_".  






