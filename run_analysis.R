train=read.table("UCI HAR Dataset/train/X_train.txt")
train_activities=read.table("UCI HAR Dataset/train/y_train.txt")
subject_train=read.table("UCI HAR Dataset/train/subject_train.txt")
train=cbind(train, train_activities, subject_train)
test=read.table("UCI HAR Dataset/test/X_test.txt")
test_activities=read.table("UCI HAR Dataset/test/y_test.txt")
subject_test=read.table("UCI HAR Dataset/test/subject_test.txt")
test=cbind(test, test_activities, subject_test)
data=rbind(test, train)
features=read.table("UCI HAR Dataset/features.txt")
features=c(as.character(features$V2), "activity_labels", "subject")
colnames(data)=features
means=data[,grep("mean", names(data), value=TRUE)]
stds=data[,grep("std", names(data), value=TRUE)]
newdata=cbind(means, stds, data$activity_labels, data$subject)
colnames(newdata)[80]="activity_labels"
colnames(newdata)[81]="subject"
activity_labels=read.table("UCI HAR Dataset/activity_labels.txt")
newdata$activity_labels=activity_labels$V2[match( newdata$activity_labels, activity_labels$V1)]
newdata$subject=as.factor(newdata$subject)
tidydata=NULL
for(i in 1:length(levels(newdata$subject))){
  subject=i
  x=newdata[newdata$subject==subject,]
  x$activity_labels=as.factor(x$activity_labels)
  v=NULL
  for(i in 1:length(levels(x$activity_labels))){
    activity=levels(x$activity_labels)[i]
    y=x[x$activity_labels==activity,]
    w=data.frame(subject=subject, activity=activity)
    for(i in 1:79){
      variable=names(y[i])
      avg=mean(y[,i])
      z=data.frame(number=avg)
      colnames(z)[1]=variable
      w=cbind(w, z)
    }
    v=rbind(v, w)
  }
  tidydata=rbind(tidydata, v)
}
tidydatawide=tidydata
tidydatanarrow=melt(tidydata, id.vars=c("subject", "activity"))
colnames(tidydatanarrow)=c("subject", "activity", "feature", "average")