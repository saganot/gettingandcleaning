library(dplyr)
library(stringr)
library(reshape2)
merge.files <- function (dir) {
  # Reads the data files from one directory and merges them into one matrix.
  list_files <- list.files(dir,recursive=TRUE)
  len <- length(readLines(paste0(dir,"/",list_files[1])))
  a <- c(1:len)
  for (i in list_files) {
    a <- cbind(a,trimws(readLines(paste0(dir,"/",i))))
  }
  a
}
split.column <- function (orig,index,len) {
  # Splits the long character vector containing measurements into discrete measurements.
  add <- str_split_fixed(gsub(" +"," ",orig[,index])," ",len)
  new <- cbind(orig,add)
  new
}
fix.var.name <- function (var.name) {
  # Fixes variable names (removes parentheses etc.)
  fixed <- as.character(gsub("[\\(\\)]","",gsub("[,-]","_",var.name)))
  fixed
}
test <- merge.files("test")
train <- merge.files("train")
merged <- rbind(test,train)[,-1] # Merges the two directories and removes dummy variable I used at the beginning
dm <- merged
remove(test)
remove(train)
for (i in 1:9) {
  # For each of the files in the Inertial Signals dir, splits into discrete measurements
  dm <- split.column(dm,i,128)
}
dm <- split.column(dm,11,561) # Splits X_test/train into discrete features
dm <- dm[,-c(1:9,11)] # Discards raw data
features <- fix.var.name(read.table("features.txt",sep=" ")[,2]) # Reads feature labels
class(features)
ds <- data.frame(dm,stringsAsFactors=FALSE) # Converts matrix into dataframe
filenames <- c("body_acc_x_","body_acc_y_","body_acc_z_","body_gyro_x_","body_gyro_y_","body_gyro_z_","total_acc_x_","total_acc_y_","total_acc_z_")
cols <- c()
for (i in filenames) {
  for (j in 1:128) {
    # Generates column name from filename and a running index
    cols <- c(cols,paste0(i,j))
  }
}
colnames(ds) <- c("subject_id","activity_id",cols,features) # Sets column names
write.csv(ds,file="cleaned_data.csv")

# The following code executes Steps 2-5 of the exercise

# for_select <- c(grep("[Mm]ean|std|activity|subject",names(ds))) # Selects columns for Step 2
# selected <- ds[,for_select]
# activities <- read.table("activity_labels.txt")[,2]
# selected$activity_id <- activities[as.numeric(selected$activity_id)] # Replaces numeric activity id's with text
# for (i in 3:88) {
#   selected[,i] <- as.numeric(selected[,i]) # Changes measurements to numeric
# }
# selectedMelt <- melt(selected,id=c("subject_id","activity_id"),measure.vars=names(selected)[3:88])
# selectedCast <- dcast(selectedMelt, subject_id + activity_id ~ variable,mean)
# write.table(selectedCast,file="accel_avgs.txt",row.names=FALSE)