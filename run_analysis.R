## Packages used

library(tidyverse)

## Verify then download and unzip data    

HRA_URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
HRA_file <- "dataset.zip"

if (!file.exists(HRA_file)) {
    download.file(HRA_URL, HRA_file)
}

if (!file.exists("UCI HAR Dataset")) {
    unzip(HRA_file)
}

## Load data

actv_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
feat <- read.table("UCI HAR Dataset/features.txt")

Test_set <- read.table("UCI HAR Dataset/test/X_test.txt")
Test_labs <- read.table("UCI HAR Dataset/test/y_test.txt")
Test_subs <- read.table("UCI HAR Dataset/test/subject_test.txt")

Train_set <- read.table("UCI HAR Dataset/train/X_train.txt")
Train_labs <- read.table("UCI HAR Dataset/train/y_train.txt")
Train_subs <- read.table("UCI HAR Dataset/train/subject_train.txt")

## Extract mean and standard deviation for each measurement

mean_std <- grep(".mean|.std", feat[,2])

## Combine Test set and Train set

Train <- cbind(Train_labs, Train_subs, Train_set[mean_std])
Test <- cbind(Test_labs, Test_subs, Test_set[mean_std])

## Name the variables

mean_std_labs <- grep(".mean|.std", feat[,2], value = T)
mean_std_labs <- gsub("[()]", "", mean_std_labs)
mean_std_labs <- gsub("-", "", mean_std_labs)
mean_std_labs <- gsub("mean", "Mean", mean_std_labs)
mean_std_labs <- gsub("std", "Std", mean_std_labs)

names(Train) <- c("Activities", "Subjects", mean_std_labs)
names(Test) <- c("Activities", "Subjects", mean_std_labs)

## Merge Test and Train data

full_ds <- 
    rbind(Test, Train) %>%
    select(Subjects, everything()) %>%
    arrange(Subjects)

## Set up "Activities" values

full_ds[,2] <- gsub("1", "Walking", full_ds[,2])
full_ds[,2] <- gsub("2", "Walking_Upstairs", full_ds[,2])
full_ds[,2] <- gsub("3", "Walking_Downstairs", full_ds[,2])
full_ds[,2] <- gsub("4", "Sitting", full_ds[,2])
full_ds[,2] <- gsub("5", "Standing", full_ds[,2])
full_ds[,2] <- gsub("6", "Laying", full_ds[,2])

## Tidy up data and calculate the averages 

tidy_ds <- 
    full_ds %>%
    select(everything()) %>%
    group_by(
        Subjects,
        Activities
    ) %>%
    summarise(
        across("tBodyAccMeanX":"fBodyBodyGyroJerkMagMeanFreq", mean)
    )

## Save the tidy data set and load it 

write.table(tidy_ds, "tidy_data.txt", row.names = F)

Tidy_data <- as_tibble(read.table("tidy_data.txt"))







