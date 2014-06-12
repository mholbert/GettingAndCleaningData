## read in the training and test datasets and merge them together
ReadData <- function() {
    ## OBJECTIVE 1
    ## read the test data and squish together
    TestData <- read.table("UCI HAR Dataset/test/X_test.txt", comment.char="", colClasses="numeric")
    TestSubject <- read.table("UCI HAR Dataset/test/subject_test.txt")
    TestY <- read.table("UCI HAR Dataset/test/y_test.txt")
    TestData <- cbind(TestSubject,TestY,TestData)
    
    ## read the training data and squish together
    TrainData <- read.table("UCI HAR Dataset/train/X_train.txt", comment.char="", colClasses="numeric")
    TrainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt")
    TrainY <- read.table("UCI HAR Dataset/train/y_train.txt")
    TrainData <- cbind(TrainSubject,TrainY,TrainData)
    
    ## squish the training data and testing data together
    MergedData <- rbind(TrainData,TestData)

    
    ## OBJECTIVE 2
    ## read in the feature table and improve the feature names
    FeatureData <- read.table("UCI HAR Dataset/features.txt")
    FeatureData[,2] = gsub('-mean', 'Mean', FeatureData[,2])
    FeatureData[,2] = gsub('-std', 'Std', FeatureData[,2])
    FeatureData[,2] = gsub('[-()]', '', FeatureData[,2])
    FeatureData[,2] = gsub('[-,]', '', FeatureData[,2])
    
    
    ## figure out what columns we want from the feature table
    ColsNeeded <- grep(".*Mean.*|.*Std.*", FeatureData[,2])
    FeatureData <- FeatureData[ColsNeeded,]
    
    ## now get the columns we want from the merged data
    ## we need to add space for the subject and activity identifiers
    ColsNeeded <- c(1,2,ColsNeeded+2)
    MergedData <- MergedData[,ColsNeeded]
    
    
    ## OBJECTIVE 3
    ## read the activity labels
    ActivityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
    
    ## loop thru the activity table and update the merged data table with the activity labels
    for(i in 1:nrow(ActivityLabels)) {
        MergedData[,2] <- gsub(ActivityLabels[i,1],ActivityLabels[i,2],MergedData[,2])
    } 
    
    
    ## OBJECTIVE 4
    ## add the columns names and return the data
    ## convert these to lower to match tidy data recommendations
    colnames(MergedData) <- c("Subject","Activity",as.vector(FeatureData[,2]))
    colnames(MergedData) <- tolower(colnames(MergedData))
    return (MergedData)
}

## we need this library in order to summarize the data
require(reshape2)

## read all the data in
## OBJECTIVE 1-4 ARE DONE IN THIS FUNCTION
MergedData <- ReadData()


## OBJECTIVE 5
## summarize the data
MeltedData <- melt(MergedData, id=c("subject","activity"))
TidyData <- dcast(MeltedData, formula = subject + activity ~ variable, mean)

## write out the table
write.table(TidyData, file="TidyData.txt", sep="\t", row.names=FALSE)

## uncomment below in order to read in the data file so you can examine
## TidyDataVerify <- read.table("TidyData.txt", header=TRUE)