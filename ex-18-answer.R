# Here's my answer to Exercise 18.  Your code may not be exactly the same!

my_iris <- as_tibble(iris) #Loads the dataset "iris"
head(my_iris)
summary(my_iris)
# We'll skip the pairs plot entirely: it's a little tricky to do in ggplot
(bar_plot <- ggplot(data = my_iris, aes(x=Species)) + geom_bar()) #Bar chart
my_iris %>% select(!Species) %>% summarise(across(everything(),sd)) #SDs of columns
my_iris <- my_iris %>% mutate(Sepal.Ratio = Sepal.Length/Sepal.Width) %>%
                mutate(Petal.Ratio = Petal.Length/Petal.Width) #Ratio columns

long_form <- my_iris %>% pivot_longer(cols = contains("Ratio"), names_to = "type") %>%
  select(Species, type, value)
(box_plot <- ggplot(data = long_form, aes(x=type, y=value)) + geom_boxplot())
#Box plot of the two ratios on one plot

(petal_vs_sepal <- ggplot(data = my_iris, aes(x=Sepal.Ratio, y=Petal.Ratio)) +
                    geom_point() + labs(x="Sepal ratio", y="Petal ratio"))
#Plot of ratios against each other
(with_colour <- ggplot(data = my_iris, aes(x=Sepal.Ratio, y=Petal.Ratio)) +
                    geom_point(aes(colour = Species)) +
                    labs(x="Sepal ratio", y="Petal ratio"))
#Remake previous plot but with points colour-coded by species

my_iris_vir <- my_iris %>% filter(Species == "virginica") #Filter to just virginica
(pvs_vir <- ggplot(data = my_iris_vir, aes(x=Sepal.Ratio, y=Petal.Ratio)) +
                  geom_point() +
                  labs(x="Sepal ratio", y="Petal ratio", title = "Virginica only"))
#Plot ratios but just for virginicas
=======
# Here's my answer to Exercise 18.  Your code may not be exactly the same!

my_iris <- as_tibble(iris) #Loads the dataset "iris"
head(my_iris)
summary(my_iris)
# We'll skip the pairs plot entirely: it's a little tricky to do in ggplot
(bar_plot <- ggplot(data = my_iris, aes(x=Species)) + geom_bar()) #Bar chart
my_iris %>% select(!Species) %>% summarise(across(everything(),sd)) #SDs of columns
my_iris <- my_iris %>% mutate(Sepal.Ratio = Sepal.Length/Sepal.Width) %>%
                mutate(Petal.Ratio = Petal.Length/Petal.Width) #Ratio columns

long_form <- my_iris %>% pivot_longer(cols = contains("Ratio"), names_to = "type") %>%
  select(Species, type, value)
(box_plot <- ggplot(data = long_form, aes(x=type, y=value)) + geom_boxplot())
#Box plot of the two ratios on one plot

(petal_vs_sepal <- ggplot(data = my_iris, aes(x=Sepal.Ratio, y=Petal.Ratio)) +
                    geom_point() + labs(x="Sepal ratio", y="Petal ratio"))
#Plot of ratios against each other
(with_colour <- ggplot(data = my_iris, aes(x=Sepal.Ratio, y=Petal.Ratio)) +
                    geom_point(aes(colour = Species)) +
                    labs(x="Sepal ratio", y="Petal ratio"))
#Remake previous plot but with points colour-coded by species

my_iris_vir <- my_iris %>% filter(Species == "virginica") #Filter to just virginica
(pvs_vir <- ggplot(data = my_iris_vir, aes(x=Sepal.Ratio, y=Petal.Ratio)) +
                  geom_point() +
                  labs(x="Sepal ratio", y="Petal ratio", title = "Virginica only"))
#Plot ratios but just for virginicas
pvs_vir + geom_smooth(method = 'lm') #Add trend line
