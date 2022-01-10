#R: A first look course
#Sheet 5: An introduction to the tidyverse
#IT Learning Centre, University of Oxford
#Srinivasa Rao, 2022

#### PACKAGES ####
# Packages are a way to reuse others' code that is publicly available

# If you're running this on your own computer, the command you need to run is
#install.packages("tidyverse")
# (uncomment it first before running it).  You only need to do this once per computer (unless
# you completely reinstall R or your operating system).

# Load a package
library(tidyverse)

#### PIPES ####

sum(1:10)
1:10 %>% sum

# Pipes clearly show from left to right the order of operations
# which is convenient when you have long chains of operations.
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

# The round() function rounds decimal numbers by default to the nearest whole number 
# and using the "digits" parameter to that number of decimal places.

# We can store the output of a pipe using the assignment operator, as before.

val <- my.iris.num %>% apply(2, sd) %>% mean %>% round(digits=2)

# If you prefer, you can also type the assignment operator the other way around, and put it at the
# end, like this.

my.iris.num %>% 
  apply(2, sd) %>% 
  mean %>% 
  round(digits=2) -> val

#### GGPLOT2: prettier plots ####

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

# What if we wanted axis labels, and maybe also lines between the points?

(plot3 <- ggplot(data = cars_dataset, aes(x=disp, y=hp)) +
            geom_point() + geom_path() + #Add points, then lines
            labs(x = "Displacement", y= "Gross horsepower", title = "mtcars plot"))

# ggplot actually has a function which automatically joins the points in left-to-right order:
# it's called "geom_line".

# Let's round up the other types of plot.  We'll just provide the sample code here, without
# much commentary.

#### EXERCISE 13 ####
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



























