#R: A first look course
#Sheet 3: Data analysis and visualisation
#IT Learning Centre, University of Oxford
#Srinivasa Rao, 2021

cars_dataset <- read.csv("Data/mtcars.csv")

#### SUMMARY STATS ####

summary(cars_dataset)


# What if we wanted the standard deviation of each column?  The function we need here is "sd",
# and we can use it column-by-column if we wish.

sd(cars_dataset$mpg)

# If we want to apply it to multiple columns, we can use the function "apply".

apply(cars_dataset, 2, sd)

# What does the warning message mean?

test_data <- c("car", "bus")
sd(test_data)

0/0

# Meanwhile "Inf" means infinity, and is what you get when you try to calculate:

1/0

# NA, NaN, Inf, -Inf

# We can remove the offending column to avoid the warning from earlier

cars_dataset.no.names <- cars_dataset[,-1] #Remove first column
apply(cars_dataset.no.names, 2, sd)

#### EXERCISE 7 ####
# Write R code to calculate the mean of each column of "df.no.names", using "apply".  (Sometimes
# it's more convenient to just have the vector of values you need, rather than the full "summary"
# output.)  The function to calculate the mean is called "mean", as you might expect!
# Check against the output of "summary" to make sure it's worked.





#### APPENDING DATA ####
# We can also make new columns by doing operations, just like we did with vectors.  For instance,
# suppose we wanted a new column that recorded each car's horsepower per cylinder.  (I don't
# know much about cars, but this probably isn't all that meaningful in real life!)  We can use
# the dollar operator to define a new column, like this:

cars_dataset$hp.per.cyl <- cars_dataset$hp/cars_dataset$cyl

# Type "head(cars_dataset)" into the console and you'll see (the start of) the new column.

# EXERCISE 8
# Add another new column to the table that displays the total number of gears and carburettors
# each car has.  Call it "gear.plus.carb".





#### VISUALISATION ####
# Simple plots help us to diagnose problems with our data
plot(cars_dataset$disp, cars_dataset$hp)

# You'll usually be plotting columns of a data frame against each other, but you can use
# this for any two vectors, in fact:

heights <- c(1.56, 1.62, 1.8, 1.75)
weights <- c(52, 65, 80, 78) #The values from sheet 1
plot(weights, heights)

# By default, R plots every point as a black circle.  We can change the colour using an additional
# parameter, or "argument", to the function plot.  We need to specify the names of these, like so:

plot(cars_dataset$disp, cars_dataset$hp, col="red") #Makes the points red

plot(cars_dataset$disp, cars_dataset$hp, col="blue", type="b", pch = 3, lty = 2, lwd = 1.5,
     xlab = "Displacement", ylab = 'Gross horsepower', main = "mtcars plot")

#### EXERCISE 8A (optional, trickier) ####
# The lines in the plot above create a jumbled mess.  What's determining the order in which the
# lines are drawn?  (Hint: try plotting the second and third points with
plot(cars_dataset$disp[2:3], cars_dataset$hp[2:3], type="b")
# and then add the fourth using
plot(cars_dataset$disp[2:4], cars_dataset$hp[2:4], type="b")
# and observe the difference.)






#### EXERCISE 9 ####
# Make a new plot of "wt" against "drat" from the data frame df, using green, and using the
# symbol encoded by 2 for each point.  Label the axes appropriately.  (Remember you can type
# "?mtcars" in the console to find out what the values represent.)






# What about other types of plot?
#### EXERCISE 10 ####
# Run each of the following lines of code.  Underneath each, write a comment saying what it
# does.
boxplot(cars_dataset$mpg, main = "Plot (a)", ylab= "MPG")
# (a)
boxplot(cars_dataset$drat, cars_dataset$wt, ylab = "Value", names = c("Displacement", "Weight"),
        main = "Plot (b)")
# (b)
hist(cars_dataset$disp, main = "Plot (c)", xlab= "Displacement")
# (c)

# Bar charts are a little harder.  Suppose we wanted to make a bar chart of the values of "gear".
# If you try
barplot(cars_dataset$gear)
# you'll notice it doesn't do what you want.  That's because the input to barplot has to be the
# heights of the bars - that is the number of values of each type.  To do this we use
(gear.tab <- table(cars_dataset$gear))
barplot(gear.tab, xlab = "Number of gears", ylab = "Frequency")
# The brackets around the first line force R to display the table, so you can see what the
# function "table" does.  You don't need to put the brackets around to make the chart.

#### EXERCISE 11 ####
# Statisticians hate pie charts with a passion, but you can make one using the function "pie" (if
# you really must) which works in the same way as "barplot".  Make a pie chart of the values of
# "carb", the number of carburettors of each car.






#3.3 (Optional) Linear models
# This bit is a bit statsy, but is a useful thing to know about.  In simple terms, a linear model
# between two "continuous" variables is a way of fitting a line of best fit on the graph 
# of those variables.  (A continuous variable is one where the values can be any
# number, including decimals, within a given range: like "disp", "hp", and "drat" in mtcars, but
# not "cyl", "vs".  ["Disp" and "hp" only have whole-number values as recorded: but that's 
# because they've been rounded to the nearest whole number, not because of anything intrinsic.])

# You can fit a linear model using the function "lm", and the symbol "~" (Shift+# on Windows;
# Shift+` [the key to the left of Z] on Mac):
mod.1 <- lm(cars_dataset$hp~cars_dataset$drat)
mod.2 <- lm(hp~drat, data = cars_dataset)
# mod.1 and mod.2 are the same thing, but the latter way of writing it is a little more elegant
# when you come to dealing with more complex models with more than two parameters.

# The convention here is the opposite way around from the one for plots: the thing you want on
# the y-axis comes FIRST, before the tilde, and the x-axis variable comes after the TILDE.

# There are two simple things we can do with a linear model, starting with
summary(mod.1)
# which gives summary statistics for the fit of the line of best fit, including the "R-squared",
# which is a measure of correlation between the variables.  (R-squared is between zero and one,
# with higher numbers representing better correlation.)  I won't explain all the other things
# in the summary output (feel free to ask me!), except to say that the two values under the word
# "Estimate" are the intercept and slope, in that order, of the line of best fit.

# We can also plot the line of best fit using the function "abline", which is a whole separate
# line of code after the one for the plot.  It will add the line of best fit to whatever plot
# you made most recently, even if it was a completely different plot!  So we want to run:
plot(cars_dataset$drat, cars_dataset$hp, xlab="Rear axle ratio", ylab = "Horsepower")
abline(mod.1, col = "red", lty = 2, lwd= 5)
# Notice that we can (optionally) use "col", "lty" and "lwd" to specify the colour, line type
# and width of the line - the other graphical parameters are for points, so don't make sense
# here.

#### EXERCISE 11A ####
# Make a plot of "qsec" against "wt", with "qsec" on the y-axis, showing a coral-coloured line
# of best fit.  (You can get a full list of the permitted colour names by entering "colours()"
# into the console.)






