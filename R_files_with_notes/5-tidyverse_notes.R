#R: A first look course
#Sheet 5: An introduction to the tidyverse
#IT Learning Centre, University of Oxford
#Srinivasa Rao, 2022

#5.1 Packages
# Packages are a way to reuse others' code that is publicly available

# If you're running this on your own computer, the command you need to run is
#install.packages("tidyverse")
# (uncomment it first before running it).  You only need to do this once per computer (unless
# you completely reinstall R or your operating system).

# Load a package
library(tidyverse)

#5.2 Pipes

sum(1:10)
1:10 %>% sum

# You might ask what the point of this is.  The idea is that the pipes clearly show from left to
# right the order of operations, which is convenient when you have long chains of operations.
# For instance, let's reload the iris dataset.

my.iris <- iris
my.iris.num <- my.iris[,-5] #Get rid of the species column

# Then the following are equivalent, but the latter is (I would argue) clearer.

round(mean(apply(my.iris.num, 2, sd)), digits=2)
my.iris.num %>% apply(2, sd) %>% mean %>% round(digits=2)

# especially so when written on separate lines like so
my.iris.num %>% 
  apply(2, sd) %>% 
  mean %>% 
  round(digits=2)

# (We haven't seen the round function yet, but it does what it says on the tin: it rounds things,
# by default to the nearest whole number and using the "digits" parameter to that number of decimal
# places.

# We can store the output of a pipe using the assignment operator, as before.

val <- my.iris.num %>% apply(2, sd) %>% mean %>% round(digits=2)

# If you prefer, you can also type the assignment operator the other way around, and put it at the
# end, like this.

my.iris.num %>% 
  apply(2, sd) %>% 
  mean %>% 
  round(digits=2) -> val

# This preserves the left-to-right ordering more neatly, but for some reason isn't conventional.

# The disadvantage of piping is that it only really works when the thing you want to pass between
# various functions always occurs as the functions' first argument.  The functions in the tidyverse
# are built so that the data frame (or rather, the equivalent to the data frame, as we will
# shortly see) is almost always the first argument.

# One last thing about pipes: if you end a line with a pipe, it's akin to ending a line with
# brackets still open: R will assume your instructions aren't complete.  This lets you break
# piped instructions across multiple lines of code, which is necessary for readability if
# they get really long.


#5.3 ggplot: prettier plots
# The package "ggplot2" is also part of the tidyverse, though it's also common to see this one
# used independently.  The main reason ggplot sees use is that the plots it makes are prettier,
# though in some ways (particularly choosing colours) they're harder to customise.  "gg", by the
# way, stands for "grammar of graphics".

# In ggplot, plots are defined as objects, like vectors and data frames.  This means it's easy
# to build up plots out of different elements, and return to and modify them.  (If you did the
# optional exercise on linear models, remember how you had to make sure that you'd just plotted
# the right graph, before using "abline"?  No more!)

cars_dataset <- read.csv("Data/mtcars.csv")

# The basic function is "ggplot" itself.  Let's initialise a plot object.

plot1 <- ggplot(data = cars_dataset, aes(x=disp, y=hp))

# Here we're telling R that any plots we make on that plot object will use data from "cars_dataset",
# that the x-axis will be "disp" and the y will be "hp".  The "aes" stands for "aesthetics": i.e.
# the visual characteristics of the plot.

plot1 + geom_point()

# Here we've added the points to plot1, and displayed it.  But notice that this hasn't stored
# the resulting plot anywhere: if you enter "plot1" now into the console, it will just display
# some empty axes.  To store it back under the name "plot1" for later use, we would write:

plot1 <- plot1 + geom_point()

# and then you could enter "plot1" into the console to see it.  Alternatively, you could write

(plot1 <- plot1 + geom_point())

# because brackets around an assignment tell R to then print whatever you've just defined.

# Let's set up the empty axes again, so we can try different types of plot.

plot2 <- ggplot(data = cars_dataset, aes(x=disp, y=hp))

# What if we wanted the points to be red, like before?

(plot2 <- plot2 + geom_point(colour="red"))

# Notice we could have made this plot using one long set of instructions:

plot2 <- ggplot(data = cars_dataset, aes(x=disp, y=hp)) +
            geom_point(colour="red") + theme(legend.position = "none")

# Here we've ended a line with a "+", which is much like ending a line with a pipe: R knows to
# expect further instructions on the next line.

# What if we wanted axis labels, and maybe also lines between the points?

(plot3 <- ggplot(data = cars_dataset, aes(x=disp, y=hp)) +
            geom_point() + geom_path() + #Add points, then lines
            labs(x = "Displacement", y= "Gross horsepower", title = "mtcars plot"))

# ggplot actually has a function which automatically joins the points in left-to-right order:
# it's called "geom_line".

# Let's round up the other types of plot.  We'll just provide the sample code here, without
# much commentary.

# EXERCISE 13
# Run the code below to see what it does.  Add any comments you feel are necessary.
(box_plot <- ggplot(data = cars_dataset, aes(y=mpg)) + geom_boxplot() +
              labs(y = "Miles per gallon", title = "Box plot") +
              theme(axis.text.x=element_blank(), axis.ticks.x = element_blank())
                                  #Remove meaningless x-axis
)
(hist <- ggplot(data= cars_dataset, aes(x=disp)) + geom_histogram() +
              labs(x = "Displacement", title = "Histogram") )

(bar_chart <- ggplot(data = cars_dataset, aes(x=gear)) + geom_bar() +
              labs(y = "Number of gears", title = "Bar chart"))
      #Notice we don't have to make a frequency table first any more!

# I've not provided the sample code for making a pie chart because ggplot REALLY doesn't want
# you to make pie charts: you have to make a stacked bar chart first, and then wrap one of the axes
# around into a circle.  I told you statisticians hated pie charts with a passion!

#5.4 Tibbles
# Instead of data frames, the tidyverse uses "tibbles".  The details between them are complex and
# technical; the upshot is that you use a different function to load your data from a CSV file:
# instead of read.csv, we use read_csv.  (There is a convention that tidyverse functions use
# underscores - obtained by pressing Shift+-, the hyphen key to the right of 0 - where base R
# would use dots.)

# Let's try it with our mtcars CSV file.

cars_tib <- read_csv("Data/mtcars.csv")

# Notice that we do actually get printed output this time, which tells us about the columns.
# We can check this worked properly by viewing the top few rows, as before:

head(cars_tib)

# The function has correctly parsed the column headers, and doesn't seem to have incorrectly
# parsed any data-separating commas, so we can go on.

# (Note we could have written the above as

cars_tib <- "Data/mtcars.csv" %>% read_csv
cars_tib %>% head

# if we'd wanted to.)

#5.5 dplyr: manipulating data
# We're now going to go through the commands from sheets 2 and 3, but using the tidyverse.  We'll
# start with the portions concerning manipulating data, where we use the part of the tidyverse
# called dplyr (pronounced "dee-plier").  (The different parts can be loaded as separate packages,
# instead of all together.)

#5.5.1 select
# We can select rows and columns of a tibble by number in the same way as for a data frame.

cars_tib[3,4]
cars_tib[c(1,4,6),]
cars_tib[,-c(1,5)]

# To choose columns by name, we use the select function.

cars_tib %>% select(cyl)
cars_tib %>% select(mpg, disp)

# (These are the same as:

select(cars_tib, cyl)
select(cars_tib, mpg, disp)

# From now on, we will only show the piped method in the cases where that's conventional.)

# There are a few things we can do easily with "select" that we didn't do with base R, because
# they're trickier to achieve in base R.  For instance, we can easily select that we don't want
# a particular column.

cars_no_name <- cars_tib %>% select(!Car) #Remove the car column
head(cars_no_name)

# Here the "!" means "not", like how we used "!=" for "not equal to".

# We can also select columns by properties of the column names:

# EXERCISE 14
# Run the following code.  In a comment after each pair of lines, write what the code does.
cars_starts_d <- cars_tib %>% select(starts_with("d"))
head(cars_starts_d)
#

cars_contains_p <- cars_tib %>% select(contains("p"))
head(cars_contains_p)
#


#5.5.2 filter
# "filter" is the function for selecting rows by their properties.  The syntax for this is a
# little cleaner than the base-R syntax, in some cases!.  We write the code that does the same as
# the filtrations on sheet 2.

# EXERCISE 15
# Check that these do what you'd expect.  (There's no need to write anything!)  Compare with
# the code on Sheet 2.  Which method do you prefer?
cars_tib %>% filter(gear == 4)
cars_tib %>% filter(mpg < 15)
cars_tib %>% filter(carb >= 6)
cars_tib %>% filter(am != 1)
cars_tib %>% filter(str_detect(Car, "^Merc"))
# For "ends with 0", say, you use 'str_detect(Car, "0$")' instead
cars_tib %>% filter(Car >= "T")

#5.5.3 summarise
# We can still run "summary" from base R on tibbles.

cars_tib %>% summary

# What if we wanted the standard deviation of a column, or of several?  We'd use the function
# "summarise" for this.  In the second example, we make sure we remove the column with text first -
# this lets us chain up some pipes.

cars_tib %>% summarise(sd(mpg))
cars_tib %>% select(!Car) %>% summarise(across(everything(),sd)) #(*)

# Compare the second of these to

apply(cars_tib[,-1], 2, sd)

# the non-tidyverse way of doing the same thing.  Sometimes the tidyverse is less tidy!

# (If you prefer the American/Oxford spelling of this word, "summarize" does the same thing!)

# EXERCISE 16
# How would you change the second line marked with (*) above to get the mean of each numeric
# column?




#5.5.4 mutate
# If we want to create new columns as functions of other columns, we use "mutate".  So if we
# wanted the horsepower per cylinder, like before, we'd do:

cars_tib <- cars_tib %>% mutate(hp_per_cyl = hp/cyl)

# (This sort of statement is common in programming, where the same object, in this case "cars_tib",
# appears on both sides of an assignment: it means "take cars_tib, do the appropriate operation on
# it, and then store the result back as 'cars_tib' again, overwriting the previous value".  If we
# don't do the assignment, the new column gets calculated and the result printed, but it doesn't
# get stored anywhere for later use.)

# EXERCISE 17
# Create a column called "gear_plus_carb" that is the sum of the gear and carb columns, like on
# exercise 8.





# EXERCISE 18 (for the bold)
# This is the code from Exercise 12, but rewritten to use tidyverse methods.  I've skipped many
# of the lines, replacing them with a lettered comment saying what they should do.  Can you
# fill in the blanks?

my_iris <- as_tibble(iris) #Loads the dataset "iris"
head(my_iris) #Displays the first few lines of the data
summary(my_iris) #Displays summary statistics for the columns.
# We'll skip the pairs plot entirely: it's a little tricky to do in ggplot

#(a) Make a bar chart of Species
#(b) Find the standard deviations of the numerical columns
#(c) Create new columns called "Sepal.Ratio", which is Sepal.Length/Sepal.Width, and
#    "Petal.Ratio", the equivalent for petals.

long_form <- my_iris %>% pivot_longer(cols = contains("Ratio"), names_to = "type") %>%
  select(Species, type, value)
(box_plot <- ggplot(data = long_form, aes(x=type, y=value)) + geom_boxplot())
#Makes a box plot of the two ratios on one plot

#(d) Make a scatter plot with Sepal.Ratio on the x-axis and Petal.Ratio on the y-axis,
#    with axes labelled

(with_colour <- ggplot(data = my_iris, aes(x=Sepal.Ratio, y=Petal.Ratio)) +
    geom_point(aes(colour = Species)) +
    labs(x="Sepal ratio", y="Petal ratio"))
#Remakes previous plot but with points colour-coded by species

#(e) Create a new tibble with just the virginica irises
#(f) Make a scatter plot of just the virginica ratios, with axes labelled and with the
#    main title "Virginica only"; store it as "pvs_vir".

pvs_vir + geom_smooth(method = 'lm')
#Adds trend line using a linear model (as discussed in optional Section 3.3)




























