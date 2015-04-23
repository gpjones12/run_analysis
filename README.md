# run_analysis - r script that runs data analysis on UCI HAR Dataset. This dataset must first be downloaded and saved in working directory in order for script to run properly. tidydata can be converted to either the wide tidy data set (tidydatawide) or the narrow data set (tidydatanarrow - this is the data set described in the code book for each of the four variables).

train: reads X_train.txt from UCI HAR Dataset. All UCI HAR Dataset files must be in working directory in order for script to run correctly. train_activities: reads y_train.txt file from dataset. subject_train: reads subject_train.txt from dataset. train: binds the train data and the activities and the subject so that there is a table of all data for the train data.

test: reads X_test.txt from UCI HAR Dataset. All UCI HAR Dataset files must be in working directory in order for script to run correctly. test_activities: reads y_test.txt file from dataset. subject_test: reads subject_test.txt from dataset. test: binds the test data and the activities and the subject so that there is a table of all data for the test data.

data: combines train and test data into one dataset. this is the data that will be turned into tidy data.

features: reads table of features from the dataset. these will be added as the column names.

means: the data that has the word "mean" in the dataset will be pulled out as a table and set to this variable.

stds: the data that has the word "std" in the dataset will be pulled out as a table and set to this variable.

newdata: new data that is now the means and standard deviations of the overall dataset.

activity_labels: reads in table of activity labels. these will be converted to the values in the activities in newdata so that there are descriptions of the
activities.

tidydata: 3 for loops (2 within 1 for loop) are ran to take the averages for each variable for the subject and the activity. this data is set to tidydata as the table which has the tidy data in it (the data that is an average for each of the subjects and activities). this is the data to be sent to coursera.
