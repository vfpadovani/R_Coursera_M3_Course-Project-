## Packages used

library(reshape2)
library(tidyverse)

## Verify then download and unzip data    

HRA_URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
HRA_file <- "dataset.zip"

if (!file.exists(HRA_file)) {
    download.file(HRA_URL, HRA_file, method = 'curl')
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

## Extract mean and standard deviation for each measurement in labels

mean_std <- grep(".mean|.std", feat[,2], value = T)
mean_std <- gsub("[()]", "", mean_std)
mean_std

