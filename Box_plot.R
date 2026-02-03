#package install
install.packages(c("ggplot2", "gcookbook", "MASS", "dplyr"))
library(ggplot2)

#library(gcookbook)  # Load gcookbook for the pg_mean data set
library(MASS) # Load MASS for the birthwt data set

# Use factor() to convert a numeric variable into a discrete variable
ggplot(birthwt, aes(x = factor(race), y = bwt)) +
  geom_boxplot()

birthwt
#to change the width of boxes
ggplot(birthwt, aes(x = factor(race), y = bwt)) +
  geom_boxplot(width = .5)
#If there are many outliers and there is overplotting, 
#you can change the size and shape of the outlier points with outlier.size and outlier.shape. 
#The default size is 2 and the default shape is 16. This will use smaller points, and hollow circles
ggplot(birthwt, aes(x = factor(race), y = bwt)) +
  geom_boxplot(outlier.size = 1.5, outlier.shape = 21)

#To make a box plot of just a single group, we have to provide some arbitrary value for x; 
 #otherwise, ggplot won’t know what x coordinate to use for the box plot. 
 #In this case, we’ll set it to 1 and remove the x-axis tick markers and label
ggplot(birthwt, aes(x = 1, y = bwt)) +
  geom_boxplot() +
  scale_x_continuous(breaks = NULL) +
  theme(axis.title.x = element_blank())

##Adding Notches to a Box Plot
#Use geom_boxplot() and set notch = TRUE 
  
  
library(MASS) # Load MASS for the birthwt data set

ggplot(birthwt, aes(x = factor(race), y = bwt)) +
  geom_boxplot(notch = TRUE)

##Adding Means to a Box Plot
library(MASS) # Load MASS for the birthwt data set

ggplot(birthwt, aes(x = factor(race), y = bwt)) +
  geom_boxplot() +
  stat_summary(fun.y = "mean", geom = "point", shape = 23, size = 3, fill = "white")



