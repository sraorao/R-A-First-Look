#R: A first look course
#Sheet 4: Data reporting
#IT Learning Centre, University of Oxford
#Srinivasa Rao, 2022


#### EXERCISE 12 ####
# This is code using a dataset called "iris", which is another of the sample datasets.  This time
# we are just going to load it from the built-in datasets, instead of a CSV file.  Type "?iris" into
# the console to learn more about it.*

# The code does several things using the techniques you've learnt in the previous sheets, as well
# as some things you haven't seen.  Run the code and write a comment, starting with "#", about each
# line saying what that line does.  (The first line, and the lines that do something novel,
# are completed for you.)
my.iris <- iris #Loads the dataset "iris"
head(my.iris)
summary(my.iris)
plot(my.iris[,-5]) #Creates a "pairs plot" across the continuous variables, omitting the "species"
                   #column
spec.tab <- table(my.iris$Species)
barplot(spec.tab, xlab="Species", ylab = "Frequency")
apply(my.iris[,-5], 2, sd)
my.iris$Sepal.Ratio <- my.iris$Sepal.Length/my.iris$Sepal.Width
my.iris$Petal.Ratio <- my.iris$Petal.Length/my.iris$Petal.Width
boxplot(my.iris$Sepal.Ratio, my.iris$Petal.Ratio,
        names = c("Sepal ratio", "Petal ratio"))
plot(my.iris$Sepal.Ratio, my.iris$Petal.Ratio, xlab= "Sepal ratio",
     ylab = "Petal ratio")
plot(my.iris$Sepal.Ratio, my.iris$Petal.Ratio, xlab= "Sepal ratio",
     ylab = "Petal ratio", col = my.iris$Species)
#Changes the previous plot so that points are coloured according to their species
legend("topright", legend = c("setosa", "versicolor", "virginica"), col = 1:3, pch=1)
#Adds a legend for the colours: the colours used are colours 1, 2 and 3, colouring the
#species in the order that they first appear in the data frame
my.iris.vir <- my.iris[my.iris$Species == "virginica",]
plot(my.iris.vir$Sepal.Ratio, my.iris.vir$Petal.Ratio, xlab= "Sepal ratio",
     ylab = "Petal ratio", main = "Virginica only")
#For people who looked at optional section 3.3 on linear models:
mod.rat <- lm(Petal.Ratio~Sepal.Ratio, data = my.iris.vir)
summary(mod.rat)
abline(mod.rat, col="hotpink", lty=4)


#### R MARKDOWN ####
# R Markdown is a way of writing R code and text together in one document, so that it can be output
# into a nice format.  This course isn't going to attempt to teach you R Markdown, but it's a useful
# thing to know exists!  (I knew R for many years before I'd heard of it, and it would have made
# my life much easier in several settings.)

#### EXERCISE 12A ####
# Open the slides.Rmd file.  Have a look at the code and see if you can understand what's going on.
# (You don't have to write anything.)