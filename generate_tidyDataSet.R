harusds <- function() {
  
  # 1. Input file name definition and working directory
  wd <- "C://Users//bellechr//Downloads//RStudio//_OnWork//Getting and Cleaning data//Project"
  f1_features <-"features.txt"
  f2_X_train <-"train//X_train.txt"
  f3_X_test <-"test//X_test.txt"
  f4_subject_train <-"train//subject_train.txt"
  f5_subject_test <-"test//subject_test.txt"
  f6_Y_train <-"train//y_train.txt"
  f7_Y_test <-"test//y_test.txt"
  f8_activity_Label <-"activity_labels.txt"
  
  foutput <- "tidy.txt"
  
  # 2. Set working dir and load files 
  setwd(wd)
  
  # 3. Load DataSet from files
  ds1 <- read.csv(f1_features, header=FALSE, sep=" ")
  ds11 <- read.csv(f1_features, header=FALSE, sep="-")
  ds2 <- read.table(f2_X_train)
  ds3 <- read.table(f3_X_test)
  ds4 <- read.csv(f4_subject_train, header=FALSE, sep=" ")
  ds5 <- read.csv(f5_subject_test, header=FALSE, sep=" ")
  ds6 <- read.csv(f6_Y_train, header=FALSE, sep=" ")
  ds7 <- read.csv(f7_Y_test, header=FALSE, sep=" ")
  ds8 <- read.csv(f8_activity_Label, header=FALSE, sep=" ")
  
  # 5. calculate nrows for each dataset uploaded
  n_ds1 <- nrow(ds1)
  n_ds2 <- nrow(ds2)
  n_ds3 <- nrow(ds3)
  n_ds4 <- nrow(ds4)
  n_ds5 <- nrow(ds5)
  n_ds6 <- nrow(ds6)
  n_ds7 <- nrow(ds7)
  n_ds8 <- nrow(ds8)

  # 6. calculate dim for each dataset uploaded
  d_ds1 <- dim(ds1)
  d_ds2 <- dim(ds2)
  d_ds3 <- dim(ds3)
  d_ds4 <- dim(ds4)
  d_ds5 <- dim(ds5)
  d_ds6 <- dim(ds6)
  d_ds7 <- dim(ds7)
  d_ds8 <- dim(ds8)

  # 7.- Merge ActivityID <-> ActivityName
  ds68 <- merge(ds6, ds8, by.x="V1",by.y="V1", all=TRUE)
  names(ds68) <-c("ActivityID","ActivityName")  
  
  ds78 <- merge(ds7, ds8, by.x="V1",by.y="V1", all=TRUE)
  names(ds78) <-c("ActivityID","ActivityName")  
  
  # 8. - Generate new column Session having TRAINING or TEST value
  r2 <- rep("TRAINING",n_ds2)
  names(r2) <- c("Session")

  r3 <- rep("TEST",n_ds3)
  names(r3) <- c("Session")
  
  # 9. - Join Session, SubjectID, ActivityID, ActivityName
  dsr468 <- cbind(r2, ds4, ds68)
  names(dsr468) <-c("Session","SubjectID", "ActivityID","ActivityName")  
  ds2468 <- cbind(dsr468, ds2)
  
  dsr578 <- cbind(r3, ds5, ds78)
  names(dsr578) <-c("Session","SubjectID", "ActivityID","ActivityName")  
  ds3578 <- cbind(dsr578, ds3)
  
  # 10.- determine mean and Std column index
  xID <-subset(ds11,ds11$V2=="mean()" | ds11$V2=="std()")
  fColIndex <- gsub(" ","",paste("V",row.names(xID)))
  fColNames <- gsub(" ","",paste("V",xID$V1))
  cColIndex <- c("Session","SubjectID","ActivityID","ActivityName",fColIndex)
  cColNames <- c("Session","SubjectID","ActivityID","ActivityName",fColNames)
  
  # 11.- select mean and std column from Training dataset
  ds2468_colSel <- ds2468[,cColIndex]
  names(ds2468_colSel) <- cColNames
  
  # 12.- select mean and std column from test dataset
  ds3578_colSel <- ds3578[,cColIndex]
  names(ds3578_colSel) <- cColNames

  # 13.- Merger Traing and Test dataset to generate tidy table
  z<-rbind(ds2468_colSel, ds3578_colSel)
  View(z)
  print(paste("ROWS =",nrow(z)))
  
  #14.- Write tidy table to file
  write.table(z, file=foutput, sep=",", col.names =FALSE) 
  
  
}
