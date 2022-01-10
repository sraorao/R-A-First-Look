#R: A first look course
#Sheet 1: Introduction and basics
#IT Learning Centre, University of Oxford
#Srinivasa Rao, 2022

#### MOTIVATION ####
# Why do you need R?
## What type of data do you have?
## What kind of analyses do you need to perform?

#### PRINTING ####
# Ask R to print something 
print("Hello, World!")
# run the above line by placing the cursor anywhere on that line and pressing CTRL+Enter

# If the line starts with a #, it doesn't get executed
# print("Hello, World!")

# RStudio helps you to identify incorrect code
This line doesn't start with a hash: if you try CTRL+Enter on it you'll get an error.

# R is a calculator!
1+2 #Add one and two together
3-4 #Subtract four from three
3*5 #Multiplication
6/3 #Division
2^3 #Powers

# We can also run mathematical functions: we saw one above, "print".  Here are a few more.
sqrt(2) #Square root
sum(1,4,5,100) #Sum
prod(2,3,5,6) #Product (multiply together)

# A function is written as a line of text, then round brackets, then zero or more "arguments",
# separated by commas.  

citation()

#### VARIABLES ####

a <- 3 #Define a
a^2 #Square it

# The "<-" is the "assignment operator"
# You can also use "=" for this purpose, but "<-" is more conventional in R

bee <- a^3

# How to find out what value is stored in bee
# 1. Type the name of the variable in the console and press ENTER
bee
# 2. Use the print() function
print(bee)

#### EXERCISE 1 ####
# Write R code in the space below that defines a variable called "lucky.number" whose value
# is your lucky number, then prints the value of half your lucky number.








#### VECTORS ####
# The most basic data structure is a vector.  We can input vectors to R using a special function,
# "c" (which stands for "combine").  Let's try it.

vec.1 <- c(1,4,3)
vec.2 <- c(4,2,2)

vec.1 + vec.2 #Element-wise addition
vec.2^vec.1 #Element-wise powers

# This is convenient for dealing with data.
# For instance, if your data were heights and weights of people:

heights <- c(1.56, 1.62, 1.8, 1.75) #heights in metres
weights <- c(52, 65, 80, 78) #weights in kg

# we could calculate BMI using

weights/heights^2

# However, if your vectors have different lengths, R might exhibit some strange behaviour, and it
# won't necessarily give an error, so be careful!

a <- 3
vec.1 <- c(1,4,3)
a*vec.1

# a vector of text strings:

text <- c("This", "is", "a", 'vector')

# A special kind of vector you might use is a list of numbers in sequence.  We can get that
# using a colon:

naturals <- 1:50
naturals


n <- 5
1:n-1
1:(n-1)
# In the first line, R generates the sequence "1, 2, 3, 4, 5", and then subtracts the constant
# 1 from the whole sequence.  In the second, R does n-1 first, and then generates the sequence
# from 1 to 4.

#### EXERCISE 2 ####
# Write R code that outputs the sequence from square numbers from 1^2 = 1 to 20^2 = 400.  (Hint:
# first generate the sequence 1:20.)





# EXERCISE 2A (optional, involves maths)
# Do the same with the first 20 triangle numbers: the kth triangle number is k(k+1)/2.




#### SUBSETTING ####
# You can select part of a vector by using square brackets.  For instance,
vec.1[2]
# returns the second entry in "vec.1".  To select a range of entries, we can put another vector
# inside the square brackets.  For instance:
heights[2:4]
# selects the second, third and fourth entries of "heights", and
weights[c(1,4)]
# selects the first and fourth entries of weights.  We'll see more of this sort of thing on
# the next worksheet.