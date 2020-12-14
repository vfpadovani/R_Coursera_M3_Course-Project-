# Course Project CodeBook

This CodeBook contains the steps I took to clean and tidy the **Human Activity Recognition Using Smartfones** data set. For a full description of the data visit [this link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).  

The data was downloaded from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>.  

1. First I've loaded the Tidyverse package, which contains the base data manipulation tools that I've used in this project.  
2. The `if()` functions allows to verify the existence of the files in the designated working directory, download the data and extract it from the zip file.  
3. Using the `read.table()` function I've loaded all the meaning *.txt* files into R (all Train/Test files, in addition to Features/Activity Labels files).  
4. With the `grep(".mean|.std")` function I was able to extract from the Features table only the values that I was interested, the ones that contain a mean or a standard deviation value and assigned it as a vector.  
5. 





