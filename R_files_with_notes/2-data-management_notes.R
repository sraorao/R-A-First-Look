#R: A first look course
#Sheet 2: Data management
#IT Services, University of Oxford
#Srinivasa Rao, 2022


#2.1 Data frames
# Apologies if the first worksheet seemed like a load of abstract nonsense.  Partly, that's 
# because it was!  But we needed some theoretical grounding so that the rest of this made
# sense.  From now on, we're going to be dealing exclusively with data.

# We're going to use a dataset called "mtcars", which is a standard sample dataset about cars.

cars_dataset <- read.csv("Data/mtcars.csv")

# We're loading a "csv" file, where "csv" stands for "comma-separated value".  You can look at it
# if you like by clicking on the Data folder in the "files" pane at bottom-right, then going to
# "mtcars.csv".  If you do that, you'll see that it's made of of data values separated by commas,
# as the name suggests.  CSV are a common way to share data so multiple apps and languages
# can use it.  However, you have to be a little bit careful when you import them that they import
# correctly.  We'll talk a bit about that later.

# We've given that the name "cars_dataset", which is a "data frame", which essentially means "table" - but in the
# context of R a "table" is something else (that we won't see much of today).  mtcars is an 
# example of a data frame, and we've stored it under the name "cars_dataset".  As ever, "cars_dataset" is arbitrary:
# we could have called it "sheep" if we wanted to, but that wouldn't be very wise... your future self would 
# be really confused when they see a cars dataset named 'sheep'!

# EXERCISE 2B (optional)
# Why can't we just run the following to import the data?  What does it do?
read.csv("Data/mtcars.csv")
# No need to write down your answer!  (And don't worry too much if you're not sure, just move on;
# we'll discuss the answer on the slides.)

# Data frames are typically quite long, so we don't usually want to display all of them at once.
# To see the top six lines, we can use the function "head".  This is also sensible after importing
# data, to check that it's imported correctly.

head(cars_dataset)

# Now we can see the structure of a data frame.  It has columns corresponding to variables, and
# rows corresponding to observations.  They should ALWAYS be this way around!  (It's good practice
# to do this in other applications too, like Excel, though it's less-strictly enforced there.)
# One reason they have to be this way around in R is that a data frame must (apart from possibly
# its header) contain the same type of data all the way down: so all integers (whole numbers), or
# "characters" (text) or "doubles" (numbers with decimal points in them), or whatever.
# Rows, meanwhile, can contain different types of data, as shown in our data frame.

# (You can skip this paragraph if you like, but to explain where the names come from: "integer" is
# a term from maths, from the Latin word "integer" meaning "whole".  "Character" can normally mean
# a letter or number, so the term is reused to represent strings of text.  "Double" is short for 
# "double-precision floating-point number", and refers to how R stores numbers like this "under
# the hood" - there is also a single-precision version, but it's rare that you'd need to use
# those in R.)

# In fact, mtcars is a standard sample dataset - you can access it by using the command mtcars,
# but for slightly technical reasons we're loading it from a CSV file (feel free to ask me why,
# if you like!).  This means that, if you want to find out more about it, you can type
# "?mtcars" into the console below.  This doesn't work for just any dataset, though!

#2.2 Subsetting
# There are various basic operations you may like to do with data.  For instance, you may
# like to take only a certain row, or a certain column.  You can do this with square brackets,
# to select the number(s) of the row(s) or column(s) you want.  Let's take a few examples.

cars_dataset[3,]
cars_dataset[,4]
cars_dataset[3,4]

# So cars_dataset[3,] selects the third row, cars_dataset[,4] selects the fourth column, and cars_dataset[3,4] selects the
# fourth entry in the third row (or, equivalently, the third entry in the fourth column).  Notice
# that "cars_dataset[,4]" doesn't appear as a column: when you select a single column from a data frame,
# R converts it into a vector for you.

# We can also select multiple rows, by giving R a vector of the row numbers we want.  For instance

cars_dataset[c(1,4,6),]

# will return the 1st, 4th and 6th rows.  (Notice that you still need to type the comma, even
# if you're not selecting any columns - otherwise R doesn't know whether you're trying to 
# select columns or rows, and will give an error.)

# EXERCISE 3
# Write R code to select only the 3rd, 9th and 10th rows, and only the 4th, 5th and 6th columns,
# and store it as a new data frame called "my.cars".





# You can also select columns by name, using the headers.  To do this we use the "dollar operator".

cars_dataset$cyl
cars_dataset$disp[16]
cars_dataset[16,]$disp

# The first operation returns the "cyl" column; the second returns the 16th entry in the "disp"
# column.  The third is another way of writing the second.

# EXERCISE 4 (slightly trickier!)
# Write R code to select the 10th to 12th, and 14th, entries from the column "mpg".





# Hopefully, when you typed "cars_dataset$" in the above space, it should have provided you with a list of
# columns to choose from.  This is a feature of RStudio that you don't get by using R alone.

# What if you wanted to select multiple columns by name?  R can do this too.

cars_dataset[, c("mpg", "disp")]

# How about if you wanted to select everything EXCEPT a certain row or column?  You can do that
# using the minus sign, but only with the numbers method:

cars_dataset[-4,]
cars_dataset[,-c(1,5)]

# EXERCISE 5
# Write R code to select all but the 16th row, and all but the first three columns, of cars_dataset.
# Hint: "-1:3" represents the vector (-1, 0, 1, 2, 3).  "-(1:3)" represents the vector
# (-1, -2, -3).  Which one do you need?








# Note that you can use all of these subsetting operations on vectors instead of data frames.
# In that case, you omit the comma and just select one collection of entries, since vectors
# only have one dimension.

#2.3 Filtering data
# A useful thing to be able to do with R is to select data of a particular type.  This is
# typically referred to as "filtering" the data.  For instance,
# we might like to select all the cars with four gears in our mtcars dataset.  To do this,
# we will first need to be able to answer a slightly more fundamental question: which are the
# numbers of the rows where "gear" equals 4?

which(cars_dataset$gear == 4)
cars_dataset$gear == 4

# Note the "==".  Using only a single equals sign for this is one of the easiest mistakes to
# make in R (and indeed many other programming languages).  The single "=" is used for two
# things: firstly, as an alternative to "<-", and secondly, as a way to specify arguments of
# functions (we haven't seen any examples of this latter case yet).  The doubled version,
# "==", means "equal to".  I apologise for this!

# Anyway, both of the above lines answer the question in slightly different ways.  The first
# tells you the numbers of the rows; the second gives a vector of "Boolean" values, TRUE or
# FALSE, where (say) the sixth value in the vector is FALSE because in the sixth row the car
# does not have four gears.  ("Boolean" is from George Boole (1815-1864) - he developed
# Boolean algebra, a way of dealing with True/False values that underpins how computers work.)

# Anyway, we can use these to select the rows where the condition is true.

cars_dataset[which(cars_dataset$gear == 4),]
cars_dataset[cars_dataset$gear == 4,]

# These two rows do the same thing, with the latter being a little more concise.  Both, though
# are a bit clunky!  Later we'll see an alternate way of subsetting data.

# There are other conditions we can use.

# EXERCISE 6
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

