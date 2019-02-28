# DK-Coding-Challenge

# What I've learned from building this project:
- Working with hash tables can be rewarding!
- Converting .csv files to .plist format
- Looping through arrays
- Comparing indices of arrays for common values, above threshold values & below threshold values
- Big O Notation - Time Complexity or a High Level Overview of Performance (Examples: Logarithmic Time, Quasilinear Time, Constant Time, Linear Time, Quadratic Time)

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

# Strategy
1. Above Value
- Our Iterable would iterate over data[indexBegin..indexEnd]. Pretty simple.
- The Predicate could take x as a paramerter and return x > threshold.
2. Back Search, Within Range
- data[indexEnd .. indexBegin] could be an Iterable. This could be constructed efficiently, without copying our data.
- thresholdLo < x < thresholdHi could be our Predicate.
3. Above Value, Two Signals
- zip(data1[begin..end], data2[begin..end]), where zip turns two arrays into one, each element a pair.
- Our Predicate would essentially take the pair (x,y), and it could return x > threshold1 and y > threshold2.
4. Multi-Continuity, Within Range
- data[lastWinner..indexEnd] where lastWinner will be explained shortly.
- thresholdLo < x < thresholdHi.
