#R: A first look course
#Sheet 3: Data analysis and visualisation
#IT Services, University of Oxford
#Srinivasa Rao, 2021

#3.1 Simple analysis
# This isn't a statistics course, and it doesn't assume any knowledge of statistics, so there's
# a limit to how much data analysis I can teach you.  But we're going to cover some basic
# techniques, particularly of what's known as "exploratory data analysis": the initial things
# you do when you first have a dataset.

# The following line reloads the mtcars dataset.  You don't need to run it if "cars_dataset" is still
# loaded from the last worksheet (you can check in the Environment pane at top-right); however,
# re-running it won't do any harm.

cars_dataset <- read.csv("Data/mtcars.csv")

# So what kind of analysis can we do?  Let's start with getting some summary statistics.

summary(cars_dataset)

# "summary" is an R function that can be applied to all sorts of different things.  It's worth
# trying it when you see a new type of object: it's likely that someone's coded an interpretation
# for the summary function.

# Here, it's giving us summary statistics for each of the columns: the minimum, lower quartile,
# median, mean, upper quartile and maximum.  That is, except for the column of characters,
# where it just tells us what we already know: that it's a column of characters.

# What if we wanted the standard deviation of each column?  The function we need here is "sd",
# and we can use it column-by-column if we wish.

sd(cars_dataset$mpg)

# If we want to apply it to multiple columns, we can use the function "apply".

apply(cars_dataset, 2, sd)

# Here "cars_dataset" is the data frame, "2" indicates that we want to apply the function to each column
# (it's less likely, but if you wanted to apply something to each row you'd put a "1" there
# instead) and "sd" is the function we want to apply.

# You'll probably get a warning message when you run this: although it looks like an error,
# a warning is subtly different.  It doesn't necessarily mean anything's gone wrong, but there
# is something that R wants you to pay attention to.  In this case, it's telling you that it
# doesn't know how to calculate the standard deviation of one of the columns: the one with the
# names of the cars.  That makes sense!  So R has replaced it with "NA", which R uses to
# represent a missing value.  (It stands for "not available" in this context.)

# (An aside, while we're on the subject: two similar things you'll see in R are "NaN" and "Inf".
# "NaN" means "not a number", and is what you get when you try to calculate:

0/0

# Meanwhile "Inf" means infinity, and is what you get when you try to calculate:

1/0

# These cases are slightly different from just "no data", and you might want to deal with them
# separately, which is why R gives them alternative names to "NA".  You don't need to worry
# too much about this, though.)

# You might not want the ugly red text, though, especially if you were outputting the results
# of your code into a document automatically (more on that later).  To get rid of it, we just
# need to get rid of the problematic column.

cars_dataset.no.names <- cars_dataset[,-1] #Remove first column
apply(cars_dataset.no.names, 2, sd)

# EXERCISE 7
# Write R code to calculate the mean of each column of "cars_dataset.no.names", using "apply".  (Sometimes
# it's more convenient to just have the vector of values you need, rather than the full "summary"
# output.)  The function to calculate the mean is called "mean", as you might expect!
# Check against the output of "summary" to make sure it's worked.






# We can also make new columns by doing operations, just like we did with vectors.  For instance,
# suppose we wanted a new column that recorded each car's horsepower per cylinder.  (I don't
# know much about cars, but this probably isn't all that meaningful in real life!)  We can use
# the dollar operator to define a new column, like this:

cars_dataset$hp.per.cyl <- cars_dataset$hp/cars_dataset$cyl

# Type "head(cars_dataset)" into the console and you'll see (the start of) the new column.

# EXERCISE 8
# Add another new column to the table that displays the total number of gears and carburettors
# each car has.  Call it "gear.plus.carb".





#3.2 Plots
# We can't hope to cover all the different types of plot that R can do in one course.  But
# we'll cover a few of the most common types.  Let's start with a scatter plot, for which
# the command is "plot".

plot(cars_dataset$disp, cars_dataset$hp)

# You'll usually be plotting columns of a data frame against each other, but you can use
# this for any two vectors, in fact:

heights <- c(1.56, 1.62, 1.8, 1.75)
weights <- c(52, 65, 80, 78) #The values from sheet 1
plot(weights, heights)

# By default, R plots every point as a black circle.  We can change this using additional
# inputs, or "arguments", to the function plot.  We need to specify the names of these, like so:

plot(cars_dataset$disp, cars_dataset$hp, col="red") #Makes the points red

# This is what we use a single "=" sign for!  The reasons for this are a little bit
# too technical to write here without going into a long digression, but feel free to ask
# me what's going on here!  Otherwise, just note that sometimes our inputs have this "="
# structure and sometimes they don't; also note that the ones without the "=" always come first
# and their order matters, whereas the order of inputs with "=" doesn't matter (just the
# names).

# We can use these names to specify graphical features of the plot:
# - "col", as we've seen, takes a text string (enclosed in quotes) determining the colour
#   of the points; it can also take a number, with the numbers being assigned to different
#   colours
# - "pch" is a number which determines the type of symbol used for each point (the default
#   being a circle)
# - "type" takes a text string which tells R what type of plot to do: "p" for points (the
#   default), "l" for lines", "b" for both, and more (type "?base::plot" into the console
#   to see a full list).
# - "lty" takes a number that determines what kind of line to draw (e.g. a dotted line)
# - "lwd" takes a number that determines how wide the lines should be
# - "xlab" and "ylab" take text strings for the axis labels (the default being the names
#   of the vectors/columns that you're plotting)
# - "main" takes a text string for the chart title (the default being to have no title)
# So, putting these together:

plot(cars_dataset$disp, cars_dataset$hp, col="blue", type="b", pch = 3, lty = 2, lwd = 1.5,
     xlab = "Displacement", ylab = 'Gross horsepower', main = "mtcars plot")

# Notice that we've split this command across multiple lines of code.  That's fine, because
# the open bracket, not matched by a close bracket, tells R after seeing the first line that
# there's more to come, and R acknowledges this in the console by displaying a "+" instead of
# a ">" at the start of the line.  Something similar happens if you open a character string
# with a quotation mark and don't close it.  This can lead to an error if you forget to close
# your brackets or your quotes!
     
# EXERCISE 8A (optional, trickier)
# The lines in the plot above create a jumbled mess.  What's determining the order in which the
# lines are drawn?  (Hint: try plotting the second and third points with
plot(cars_dataset$disp[2:3], cars_dataset$hp[2:3], type="b")
# and then add the fourth using
plot(cars_dataset$disp[2:4], cars_dataset$hp[2:4], type="b")
# and observe the difference.)






# EXERCISE 9
# Make a new plot of "wt" against "drat" from the data frame cars_dataset, using green, and using the
# symbol encoded by 2 for each point.  Label the axes appropriately.  (Remember you can type
# "?mtcars" in the console to find out what the values represent.)






# What about other types of plot?
# EXERCISE 10
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

# EXERCISE 11
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

# EXERCISE 11A
# Make a plot of "qsec" against "wt", with "qsec" on the y-axis, showing a coral-coloured line
# of best fit.  (You can get a full list of the permitted colour names by entering "colours()"
# into the console.)






