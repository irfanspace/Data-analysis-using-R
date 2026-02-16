#Violin Plot
#package install
install.packages(c("ggplot2", "gcookbook", "MASS", "dplyr"))
library(ggplot2)

library(gcookbook) # Load gcookbook for the heightweight data set

# Create a base plot using the heightweight data set
hw_p <- ggplot(heightweight, aes(x = sex, y = heightIn))

hw_p +
  geom_violin()
#
hw_p +
  geom_violin() +
  geom_boxplot(width = .1, fill = "black", outlier.colour = NA) +
  stat_summary(fun.y = median, geom = "point", fill = "white", shape = 21, size = 2.5)

hw_p +
  geom_violin(trim = FALSE)

# Scaled area proportional to number of observations
hw_p +
  geom_violin(scale = "count")

#To change the amount of smoothing, use the adjust parameter. The default value is 1; 
#use larger values for more smoothing and smaller values for less smoothing
# for More smoothing
hw_p +
  geom_violin(adjust = 2)

# Less smoothing
hw_p +
  geom_violin(adjust = .5)








