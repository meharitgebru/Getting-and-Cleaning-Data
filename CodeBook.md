## Code Book
This describes the variables, the data, and any transformations or work that you performed to clean up the data.The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist

### How the data gets cleaned
1. The variable/column names of test and training data updated from features and activity text files
2. Merge the columns of x, Y and subject to create individual table for test and Training
3. Merge Test and Training rows tables into one table
4. Filter only columns that containes std and mean[ including actity and subject]
5. Appropriately update column names accordingly (e.g. acc into Acceleration)

#### Variables
The variables of the data is defined in features.txt and activity_lables.txt
##### features.txt - has list of varibales used for the experment  <br />
  tBodyAcc-XYZ  <br />
  tGravityAcc-XYZ <br />
  tBodyAccJerk-XYZ <br />
  tBodyGyro-XYZ <br />
  tBodyGyroJerk-XYZ <br />
  tBodyAccMag <br />
  tGravityAccMag <br />
  tBodyAccJerkMag <br />
  tBodyGyroMag <br />
  tBodyGyroJerkMag <br />
  fBodyAcc-XYZ <br />
  fBodyAccJerk-XYZ <br />
  fBodyGyro-XYZ <br />
  fBodyAccMag <br />
  fBodyAccJerkMag <br />
  fBodyGyroMag <br />
  fBodyGyroJerkMag <br />
  '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.<br />
<br />
 The set of variables that were estimated from these signals are: <br />
  mean(): Mean value<br />
  std(): Standard deviation<br />
  mad(): Median absolute deviation <br />
  max(): Largest value in array<br />
  min(): Smallest value in array<br />
  sma(): Signal magnitude area<br />
  energy(): Energy measure. Sum of the squares divided by the number of values. <br />
  iqr(): Interquartile range <br />
  entropy(): Signal entropy<br />
  arCoeff(): Autorregresion coefficients with Burg order equal to 4<br />
  correlation(): correlation coefficient between two signals<br />
  maxInds(): index of the frequency component with largest magnitude<br />
  meanFreq(): Weighted average of the frequency components to obtain a mean frequency<br />
  skewness(): skewness of the frequency domain signal <br />
  kurtosis(): kurtosis of the frequency domain signal <br />
  bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.<br />
  angle(): Angle between to vectors.<br />
  <br />
  Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
<br />
  gravityMean<br />
  tBodyAccMean<br />
  tBodyAccJerkMean<br />
  tBodyGyroMean<br />
  tBodyGyroJerkMean<br />
 ### activity_labels.txt has list of activity types
  WALKING<br />
  WALKING_UPSTAIRS<br />
  WALKING_DOWNSTAIRS<br />
  SITTING<br />
  STANDING<br />
  LAYING<br />
