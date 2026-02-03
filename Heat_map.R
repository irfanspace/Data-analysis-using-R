#Heat Map
#package install
install.packages(c("ggplot2", "gcookbook", "MASS", "dplyr"))
library(ggplot2)

library(gcookbook)

presidents

str(presidents)

#We’ll first convert it to a format that is usable by ggplot: a data frame with columns that are numeric:
  
  pres_rating <- data.frame(
    rating = as.numeric(presidents),
    year = as.numeric(floor(time(presidents))),
    quarter = as.numeric(cycle(presidents))
  )
pres_rating

#Now we can make the plot using geom_tile() or geom_raster(). 
#Simply map one variable to x, one to y, and one to fill

# Base plot
p <- ggplot(pres_rating, aes(x = year, y = quarter, fill = rating))

# Using geom_tile()
p + geom_tile()

# Using geom_raster() - looks the same, but a little more efficient
p + geom_raster()

#To better convey useful information, you may want to customize the appearance of the heat map.
p +
  geom_tile() +
  scale_x_continuous(breaks = seq(1940, 1976, by = 4), expand = c(0, 0)) +
  scale_y_reverse(expand = c(0, 0)) +
  scale_fill_gradient2(midpoint = 50, mid = "grey70", limits = c(0, 100))






