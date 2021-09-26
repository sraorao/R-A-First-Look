##################################################
##################################################
#R: A first look course
#Sheet 1: Introduction and basics
#IT Services, University of Oxford
#Srinivasa Rao, 2021
##################################################
##################################################

#1.1 Welcome
# Welcome to the R: A First Look course!  You're viewing this file on RStudio Cloud,
# where we'll do all of the exercises for this course.
#
# You have to pay for more than a certain amount of use of this platform per month
# (though you will not hit this limit during this course).  However, you can download
# a program/app called "RStudio", which provides you with a near-identical setup on your
# computer.  The desktop version is free.
#
# These worksheets are meant to be used in conjunction with the slides, and so they don't
# repeat all of the material from those slides.

#1.2 RStudio
# I'm going to talk through this section, so you don't need to sit and read it yourself before
# moving on to the next one!  But it's included here for your reference.

#1.2.1 The editor
# You'll notice there are four panes in the RStudio window.  You're viewing this file
# in the top-left pane, which is for editing code.
# In general, when you write R code, you'll want to write it in here.
# You can run a line of code by positioning the cursor in that line, and pressing CTRL+Enter
# on your keyboard.
# Try it on this next line, which is our first line of R code.

print("Hello, World!")

# You should see the line of code appear in blue in the pane below, followed by
# '[1] "Hello, World!"'
# We'll come back to that pane in a moment.
# Note that most of the text in this document is on lines that start with a hash symbol.
# That denotes that these are "comments", and tells the computer not to interpret them as
# R code.  If you try CTRL+Enter nothing happens.
This line doesn't start with a hash: if you try CTRL+Enter on it you'll get an error.
# In a normal R document, most lines would be lines of code, but you can use comments
# to annotate your code like this:

1+2 #Add one and two together
3-4 #Subtract four from three

# The computer ignores everything after the # symbol.
# If you want to run multiple lines of code at once, you can highlight them all by clicking and
# dragging, and then pressing CTRL+Enter.  But beware!  If you incompletely highlight a line,
# you'll get an error.  The easiest way to avoid this is to drag down the numbers on the
# left-hand side, so you'll always get complete lines of code.  Try this with the lines above.

# This panel has tabs at the top for different documents.  You can switch between documents
# and R will remember the code that's already been run: opening a new document doesn't start
# a new session.

#1.2.2 The console
# When you ran code above, it was sent down to the console below.  Any line that starts with
# a ">" or a "+" is the code that you've input.  These lines are usually in blue.
# The output from the computer is in black, and often starts with "[1]".  Don't worry too much
# yet about what the [1] means.

# You can type code directly into the console, by clicking on it, typing your code, and pressing
# Enter.  Normally you don't want to do this, because it's a pain to re-run code, and if you
# make a mistake when typing complex code over multiple lines, you have to start typing the
# whole thing again.  However, for simple things like quick calculations or looking up help,
# you might want to do this.  (We'll come on to how to do those things shortly!)

# This panel has tabs at the top, but we won't be using any of the others: just "Console".

#1.2.3 The bottom-right panel
# This panel has various tabs at the top, which do quite different things.  The ones we'll be
# using are:
# * Files, which, on RStudio Cloud, shows the uploaded files.  (On your computer, it replicates
#   Windows Explorer/Finder [on Mac].)
# * Plots, which shows plots that we've made.
# * Help, which shows you help files.

#1.2.4 The top-right panel
# This last panel also has tabs.  We won't really use any of them, but the Environment tab is most
# useful.  However, I can't explain what it does until we've got a bit further!  For now, just note
# that it says "Environment is empty".

#1.2.5 Resizing panels
# You can resize the panels if you need to.  Hover your mouse over the division between them, and
# it will turn into a four-pointed arrrow.  You can then click and drag to change the sizes.

#1.2.6 Working directory
# Before we go any further, we need to set the working directory.  I'll talk through what this
# means and how to do it.

#1.3 The basics
# We've already seen a couple of basic R functions: printing text, addition and subtraction.
# To complete the set of R-ithmetical functions, let's do multiplication, division and raising
# a number to a power.  Try running the following lines of code.

3*5 #Multiplication
6/3 #Division
2^3 #Powers

# We can also run mathematical functions: we saw one above, "print".  Here are a few more.

sqrt(2) #Square root
sum(1,4,5,100) #Sum
prod(2,3,5,6) #Product (multiply together)

# A function is written as a line of text, then round brackets, then zero or more "arguments",
# separated by commas.  (Yes, I said "zero or more!".  Some functions don't have arguments, 
# or have arguments all of which are optional.  But you still have to put the brackets in,
# or they don't work.  For instance:

citation()

# which tells you how to cite R in your work.  [Please do: the authors of R were mostly
# volunteers, so citations are the only reward they get!])

# If you don't know what a function does, you can type "?", then it's name.  This is the sort
# of line you would normally just type into the console: you don't want to keep a permanent
# record of your request for help!  Try typing "?sqrt" into the console below, and seeing what
# happens.

# So far we've not seen much that R can do that a scientific calculator can't.  Let's start now,
# by running the following lines of code.

a <- 3 #Define a
a^2 #Square it

# What's going on here?  The "<-" is the "assignment operator".  (You can also use "=" for this
# purpose, but "<-" is more conventional in R.)  It creates a variable called "a", to which
# the value "3" is assigned.  Notice that the top-right pane isn't empty any more: it shows
# a, and its value.  Then in the next line, we squared it, and returned the result: 9.

# (There's no special key for "<-".  You just type it as two symbols: a left angle bracket
# (usually Shift+comma, on UK Windows and Mac keyboards), then a hyphen (on UK keyboards,
# usually the key to the right of 0).

# The name "a" was arbitrary: we can choose almost anything we like as a variable name.  But
# it's best to avoid things that are (or might be) names of functions, like "mean" or
# "sum".  It's also best to avoid things like "if" and "for": we're not going to talk
# about what these do in this course, but they also have special meanings.

# When R is assigning a value, its default behaviour is not to print anything.  For instance

bee <- a^3

# (try running it!) assigns the value of a^3 (27) to the variable bee, but doesn't print anything.
# To assign and print at the same time, you can put brackets around the whole expression, like so:

(bee <- a^3)

# You can also find out the value of a variable by typing its name into the console, and pressing
# Enter.  Try that now with a and bee.

# EXERCISE 1
# Write R code in the space below that defines a variable called "lucky.number" whose value
# is your lucky number, then prints the value of half your lucky number.








#1.4 Vectors
# We said R was a "statistical programming language".  That means it's built to deal well with
# data.  But we've just dealt with individual numbers so far.

# The most basic data structure is a vector.  We can input vectors to R using a special function,
# "c" (which stands for "concatenate").  Let's try it.

vec.1 <- c(1,4,3)
vec.2 <- c(4,2,2)

# You'll see them appear top-right.

# When you do any of the arithmetic operations on two vectors together, R does the operation
# element by element.  Try:

vec.1 + vec.2 #Element-wise addition
vec.2^vec.1 #Element-wise powers

# (Note that R ignores spaces when processing code.)  This is convenient for dealing with data.
# For instance, if your data were heights and weights of people:

heights <- c(1.56, 1.62, 1.8, 1.75) #heights in metres
weights <- c(52, 65, 80, 78) #weights in kg

# we could calculate BMI using

weights/heights^2

# However, if your vectors have different lengths, R might exhibit some strange behaviour, and it
# won't necessarily give an error, so be careful!

# You can also do operations with vectors and constants:

a <- 3
vec.1 <- c(1,4,3)
a*vec.1

# We can have vectors of any type of data: for instance, by using quotation marks, we can make
# a vector of text strings:

text <- c("This", "is", "a", 'vector')

# (There's no difference between using single and double quotes, as long as you close the 
# text with the same type that you used to open it!)

# A special kind of vector you might use is a list of numbers in sequence.  We can get that
# using a colon, like so:

(naturals <- 1:50)

# This vector probably doesn't fit on one line (if it does, change "50" to "100" and run the line
# again).  Notice that the second line starts with a number other than 1 (on my computer, 34, but
# it will depend on the width of your screen): that's telling me that the first entry
# on the second line is the 34th entry overall.  This explains why you kept seeing "[1]" before:
# R technically treats numbers as vectors of length 1, and is telling you that it's displaying
# the first (and only!) entry.

# One last note on colons: be careful when operations are involved.  For instance, notice the
# difference between the second and third lines below:
n <- 5
1:n-1
1:(n-1)
# In the first line, R generates the sequence "1, 2, 3, 4, 5", and then subtracts the constant
# 1 from the whole sequence.  In the second, R does n-1 first, and then generates the sequence
# from 1 to 4.

# EXERCISE 2
# Write R code that outputs the sequence from square numbers from 1^2 = 1 to 20^2 = 400.  (Hint:
# first generate the sequence 1:20.)





# EXERCISE 2A (optional, involves maths)
# Do the same with the first 20 triangle numbers: the kth triangle number is k(k+1)/2.





# One final thing: you can select part of a vector by using square brackets.  For instance,
vec.1[2]
# returns the second entry in "vec.1".  To select a range of entries, we can put another vector
# inside the square brackets.  For instance:
heights[2:4]
# selects the second, third and fourth entries of "heights", and
weights[c(1,4)]
# selects the first and fourth entries of weights.  We'll see more of this sort of thing on
# the next worksheet.