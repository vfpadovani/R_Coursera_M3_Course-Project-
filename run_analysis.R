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

