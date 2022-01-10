#R: A first look course
#Sheet 2: Data management
#IT Learning Centre, University of Oxford
#Srinivasa Rao, 2022

##### Load data from file ####
cars_dataset <- read.csv("Data/mtcars.csv")

# We're loading a "csv" file, where "csv" stands for "comma-separated value".  

#### EXERCISE 2B (optional) ####
# Why can't we just run the following to import the data?  What does it do?
read.csv("Data/mtcars.csv")

#### PEEKING ####
head(cars_dataset)

tail(cars_dataset)

View(cars_dataset)

#### SUBSETTING ####
# There are various basic operations you may like to do with data.  For instance, you may
# like to take only a certain row, or a certain column.  You can do this with square brackets,
# to select the number(s) of the row(s) or column(s) you want.  Let's take a few examples.

cars_dataset[3,]
cars_dataset[,4]
cars_dataset[3,4]

# So df[3,] selects the third row, df[,4] selects the fourth column, and df[3,4] selects the
# fourth entry in the third row (or, equivalently, the third entry in the fourth column).  Notice
# that "df[,4]" doesn't appear as a column: when you select a single column from a data frame,
# R converts it into a vector for you.

# We can also select multiple rows, by giving R a vector of the row numbers we want.  For instance

cars_dataset[c(1,4,6),]

# will return the 1st, 4th and 6th rows.  (Notice that you still need to type the comma, even
# if you're not selecting any columns - otherwise R doesn't know whether you're trying to 
# select columns or rows, and will give an error.)

#### EXERCISE 3 ####
# Write R code to select only the 3rd, 9th and 10th rows, and only the 4th, 5th and 6th columns,
# and store it as a new data frame called "my.cars".





# You can also select columns by name, using the headers.  To do this we use the "dollar operator".

cars_dataset$cyl
cars_dataset$disp[16]
cars_dataset[16,]$disp

# The first operation returns the "cyl" column; the second returns the 16th entry in the "disp"
# column.  The third is another way of writing the second.

#### EXERCISE 4 (slightly trickier!) ####
# Write R code to select the 10th to 12th, and 14th, entries from the column "mpg".





# What if you wanted to select multiple columns by name?  R can do this too.

cars_dataset[, c("mpg", "disp")]

# How about if you wanted to select everything EXCEPT a certain row or column?  You can do that
# using the minus sign, but only with the numbers method:

cars_dataset[-4,]
cars_dataset[,-c(1,5)]

#### EXERCISE 5 ####
# Write R code to select all but the 16th row, and all but the first three columns, of df.
# Hint: "-1:3" represents the vector (-1, 0, 1, 2, 3).  "-(1:3)" represents the vector
# (-1, -2, -3).  Which one do you need?








# Note that you can use all of these subsetting operations on vectors instead of data frames.
# In that case, you omit the comma and just select one collection of entries, since vectors
# only have one dimension.

#### FILTERING ####
# A useful thing to be able to do with R is to select data of a particular type.  This is
# typically referred to as "filtering" the data.  For instance,
# we might like to select all the cars with four gears in our mtcars dataset.  To do this,
# we will first need to be able to answer a slightly more fundamental question: which are the
# numbers of the rows where "gear" equals 4?

which(cars_dataset$gear == 4)
cars_dataset$gear == 4

# Note that the "==" is different from "="
# "==" is a test for equality, and better read as a question; 
# in plain English, you are asking the question
# "In the 'gear' column of the data.frame 'df', which elements are equal to 4?"

# Anyway, both of the above lines answer the question in slightly different ways.  The first
# tells you the numbers of the rows; the second gives a vector of "Boolean" values, TRUE or
# FALSE, where (say) the sixth value in the vector is FALSE because in the sixth row the car
# does not have four gears.  

# Anyway, we can use these to select the rows where the condition is true.

cars_dataset[which(cars_dataset$gear == 4),]
cars_dataset[cars_dataset$gear == 4,]

# These two rows do the same thing, with the latter being a little more concise.  Both, though
# are a bit clunky!  Later we'll see an alternate way of subsetting data.

# Other tests can be
# > greater than
# < less than
# >= greater than or equal to
# <= less than or equal to




#### EXERCISE 6 ####
# Run each of the commands below.  What do they do?  Type your answer as a comment underneath
# each line.  (Hint: type "?mtcars" into the console to see what the columns represent.)

cars_dataset[cars_dataset$mpg<15,]
#
cars_dataset[cars_dataset$carb>=6,]
#
cars_dataset[cars_dataset$vs!=0,]
#
cars_dataset[startsWith(cars_dataset$Car, "Merc"),]
#
cars_dataset[cars_dataset$Car >= "T",] #Trickier!
#

