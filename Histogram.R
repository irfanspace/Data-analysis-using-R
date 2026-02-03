#package install
install.packages(c("ggplot2", "gcookbook", "MASS", "dplyr"))
library(ggplot2)

library(gcookbook)  # Load gcookbook for the pg_mean data set
#1 Histogram
ggplot(faithful, aes(x = waiting)) +
  geom_histogram()

faithful

#If you just want to get a quick look at some data that isn’t in a data frame, 
#you can get the same result by passing in NULL for the data frame and giving ggplot() a vector of values. 
#This would have the same result as the previous code
# Store the values in a simple vector
w <- faithful$waiting

ggplot(NULL, aes(x = w)) +
  geom_histogram()

# Set the width of each bin to 5 (each bin will span 5 x-axis units)
ggplot(faithful, aes(x = waiting)) +
  geom_histogram(binwidth = 5, fill = "white", colour = "black")

# Divide the x range into 15 bins
binsize <- diff(range(faithful$waiting))/15

ggplot(faithful, aes(x = waiting)) +
  geom_histogram(binwidth = binsize, fill = "white", colour = "black")

# Save a base plot
faithful_p <- ggplot(faithful, aes(x = waiting))

faithful_p +
  geom_histogram(binwidth = 8, fill = "white", colour = "black", boundary = 31)

faithful_p +
  geom_histogram(binwidth = 8, fill = "white", colour = "black", boundary = 35)

#Multiple Histograms from Grouped Data
#Use geom_histogram() and use facets for each group
library(MASS) # Load MASS for the birthwt data set

# Use smoke as the faceting variable
ggplot(birthwt, aes(x = bwt)) +
  geom_histogram(fill = "white", colour = "black") +
  facet_grid(smoke ~ .)

birthwt

birthwt_mod <- birthwt
# Convert smoke to a factor and reassign new names
birthwt_mod$smoke <- recode_factor(birthwt_mod$smoke, '0' = 'No Smoke', '1' = 'Smoke')
ggplot(birthwt_mod, aes(x = bwt)) +
  geom_histogram(fill = "white", colour = "black") +
  facet_grid(smoke ~ .)

ggplot(birthwt, aes(x = bwt)) +
  geom_histogram(fill = "white", colour = "black") +
  facet_grid(race ~ .)

ggplot(birthwt, aes(x = bwt)) +
  geom_histogram(fill = "white", colour = "black") +
  facet_grid(race ~ ., scales = "free")

# Map smoke to fill, make the bars NOT stacked, and make them semitransparent
ggplot(birthwt_mod, aes(x = bwt, fill = smoke)) +
  geom_histogram(position = "identity", alpha = 0.4)

