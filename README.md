# DK-Coding-Challenge

<div align="center">
    <img src="https://github.com/dlr4life/DK-Coding-Challenge/blob/master/DK%20Challenge/mainImage.png" width="400px"</img> 
</div>

# Plan 1
- Download the provided .csv file 
- Convert .csv file into a plist file (XML format)
- Import the plist file
- Sort the plist file with Timestamp predicate
- Loop through the array to get rows
- Set variable to hold row to compare
- Compare 1 row for matches for searchContinuityAboveValue
- Compare 1 row for matches for backSearchContinuityWithinRange
- Compare 2 rows for matches for searchContinuityAboveValueTwoSignals
- Compare 1 row for matches for searchMultiContinuityWithinRange

# Plan 2
- Download the provided .csv file 
- Convert .csv file into a plist file (XML format)
- Import the plist file
- Employ a hash table to check if an element is in an array
- Compare 1 row for matches for searchContinuityAboveValue
- Compare 1 row for matches for backSearchContinuityWithinRange
- Compare 2 rows for matches for searchContinuityAboveValueTwoSignals
- Compare 1 row for matches for searchMultiContinuityWithinRange

# What I've learned from building this project:
- Working with hash tables can be rewarding!
- Converting .csv files to .plist format
- Looping through arrays
- Comparing indices of arrays for common values, above threshold values & below threshold values

# Features:
- Caluclation of searchContinuityAboveValue operation value. (From indexBegin to indexEnd , search data for values that are higher than
threshold.)
- Caluclation of backSearchContinuityWithinRange operation value. (From indexBegin to indexEnd (where
indexBegin is larger than indexEnd), search data for values that are higher than
thresholdLo and lower than thresholdHi.)
- Caluclation of searchContinuityAboveValueTwoSignals operation value. (From indexBegin to indexEnd ,
search data1 for values that are higher than threshold1 and also search data2 for values
that are higher than threshold2.)
- Caluclation of searchMultiContinuityWithinRange operation value. (From indexBegin to indexEnd , search data
for values that are higher than thresholdLo and lower than thresholdHi.)
- Calculation of the point at which impact happens in this data file

# Some challenges I encountered:
- Comparing the rows with the columns, vs breaking up the operations into smaller bits, remaining manageable.

# Questions:
- Would it be safe to say that columns B, C, & D in the ".csv" are the accelerometer values (ax, ay, az)?
- Would it be safe to say that columns E, F, & G in the ".csv" are the gyroscope values (wx, wy, & wz)?
- Would it be safe to say that "thresholdHi" is the highest value in each column?
- Would it be safe to say that "thresholdLo" is the lowest value in each column?
- Would it be safe to say that I am setting row 0 as the "indexBegin"?
- Would it be safe to say that I am setting row 1276 as the "indexEnd"?
- Would it be safe to say that finding row "?" as the impact point in the ".csv"?
- "winLength" is a mystery, unless it corresponds to the number of rows in the ".csv" (1276).
- Would it be safe to say that "data" is all the fields of ax, ay, az, wx, wy, & wz?
- Would it be safe to say that "data" is all the fields of ax, ay, az?
- Would it be safe to say that "data" is all the fields of wx, wy, & wz?
- Would it be safe to say that "data1" is all the fields of ax, ay, az?
- Would it be safe to say that "data2" is all the fields of wx, wy, & wz?
- Would it be safe to say that "timestamp" is the predicate to be used?
