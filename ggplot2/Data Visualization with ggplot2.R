library(ggplot2)

str(mtcars)

ggplot(mtcars, aes(cyl, mpg)) +
  geom_point()

ggplot(mtcars, aes(x= factor(cyl), y= mpg)) +
  geom_point()

# Edit to add a color aesthetic mapped to disp
ggplot(mtcars, aes(wt, mpg, color=disp)) +
  geom_point()
## Edit to add a color aesthetic mapped to disp
ggplot(mtcars, aes(wt, mpg, size=disp)) +
  geom_point()

##ADDING GEOMETRIES
#The diamonds dataset contains details of 1,000 diamonds. Among the variables included are carat (a measurement of the diamond's size) and price.

#You'll use two common geom layer functions:
                                                                                                   
#geom_point() adds points (as in a scatter plot).
#geom_smooth() adds a smooth trend curve.
#As you saw previously, these are added using the + operator.
                                                                                                 
#ggplot(data, aes(x, y)) +
#geom_*()
#Where * is the specific geometry needed.

#Diamonds
str(diamonds)

# Add geom_point() with +
ggplot(diamonds, aes(carat, price)) +
  geom_point()

# Add geom_smooth() with +
ggplot(diamonds, aes(carat, price)) +
  geom_point()+
  geom_smooth()
  
#Changing one geom or every geom
#If you have multiple geoms, then mapping an aesthetic to data variable inside the call to ggplot() will change all the geoms. 
   #It is also possible to make changes to individual geoms by passing arguments to the geom_*() functions.

#geom_point() has an alpha argument that controls the opacity of the points. 
  #A value of 1 (the default) means that the points are totally opaque; a value of 0 means the points are totally transparent (and therefore invisible). 
   #Values in between specify transparency.
#The plot you drew last time is provided in the script

# Map the color aesthetic to clarity
ggplot(diamonds, aes(carat, price, color=clarity)) +
  geom_point() +
  geom_smooth()
#Add alpha
ggplot(diamonds, aes(carat, price, color=clarity)) +
  geom_point(alpha=0.4) +
  geom_smooth()


## Draw a ggplot
plt_price_vs_carat <- ggplot(
  # Use the diamonds dataset
  diamonds,
  # For the aesthetics, map x to carat and y to price
  aes(carat, price)
)

# Add a point layer to plt_price_vs_carat
plt_price_vs_carat + geom_point()

# From previous step
plt_price_vs_carat <- ggplot(diamonds, aes(carat, price))

# Edit this to make points 20% opaque: plt_price_vs_carat_transparent
plt_price_vs_carat_transparent <- plt_price_vs_carat + geom_point(alpha = 0.2)

# See the plot
plt_price_vs_carat_transparent


# From previous step
plt_price_vs_carat <- ggplot(diamonds, aes(carat, price))

# Edit this to map color to clarity,
# Assign the updated plot to a new object
plt_price_vs_carat_by_clarity <- plt_price_vs_carat + geom_point(aes(color=clarity))

# See the plot
plt_price_vs_carat_by_clarity

##Aesthetics
# edited/added
library(tidyverse)
mtcars <- mtcars %>% 
  mutate(fcyl = as.factor(cyl),
         fam = as.factor(am)) %>% 
  mutate(fam = fct_recode(fam,
                          "manual" = "1",
                          "automatic" = "0"))

# Map x to mpg and y to fcyl
ggplot(mtcars, aes(mpg, fcyl)) +
  geom_point()

# Swap mpg and fcyl
ggplot(mtcars, aes(fcyl, mpg)) +
  geom_point()

# Map x to wt, y to mpg and color to fcyl
ggplot(mtcars, aes(wt, mpg, color = fcyl)) +
  geom_point()

ggplot(mtcars, aes(wt, mpg, color = fcyl)) +
  # Set the shape and size of the points
  geom_point(shape = 1, size = 4)

# Map fcyl to fill
ggplot(mtcars, aes(wt, mpg, fill = fcyl)) +
  geom_point(shape = 1, size = 4)

ggplot(mtcars, aes(wt, mpg, fill = fcyl)) +
  # Change point shape; set alpha
  geom_point(shape = 21, size = 4, alpha = 0.6)

# Map color to fam
ggplot(mtcars, aes(wt, mpg, fill = fcyl, color = fam)+
         geom_point(shape = 21, size = 4, alpha = 0.6)


                            
# Establish the base layer
plt_mpg_vs_wt <- ggplot(mtcars, aes(wt, mpg))

# Map fcyl to size
plt_mpg_vs_wt +
  geom_point(aes(size = fcyl))

# Base layer
plt_mpg_vs_wt <- ggplot(mtcars, aes(wt, mpg))

# Map fcyl to alpha, not size
plt_mpg_vs_wt +
  geom_point(aes(alpha = fcyl))

# Base layer
plt_mpg_vs_wt <- ggplot(mtcars, aes(wt, mpg))

# Map fcyl to shape, not alpha
plt_mpg_vs_wt +
  geom_point(aes(shape = fcyl))

# Base layer
plt_mpg_vs_wt <- ggplot(mtcars, aes(wt, mpg))

# Use text layer and map fcyl to label
plt_mpg_vs_wt +
  geom_text(aes(label = fcyl))

##Attributes
# A hexadecimal color_1
my_blue <- "#4ABEFF"

ggplot(mtcars, aes(wt, mpg)) +
  # Set the point color to my_blue
  geom_point(color = my_blue, alpha = 0.6)

# A hexadecimal color_2
my_blue <- "#4ABEFF"

# Change the color mapping to a fill mapping
ggplot(mtcars, aes(wt, mpg, fill = fcyl)) +
  # Set point size to 10; shape to 1
  geom_point(color = my_blue, size = 10, shape = 1)


ggplot(mtcars, aes(wt, mpg, color = fcyl)) +
  # Add point layer with alpha 0.5
  geom_point(alpha = 0.5)

ggplot(mtcars, aes(wt, mpg, color = fcyl)) +
  # Add text layer with label rownames(mtcars) and color red
  geom_text(label = rownames(mtcars), color = 'red')

ggplot(mtcars, aes(wt, mpg, color = fcyl)) +
  # Add points layer with shape 24 and color yellow
  geom_point(shape = 24, color = 'yellow')


# 3 aesthetics: qsec vs. mpg, colored by fcyl
ggplot(mtcars, aes(mpg, qsec, color = fcyl)) +
  geom_point()

# 4 aesthetics: add a mapping of shape to fam
ggplot(mtcars, aes(mpg, qsec, color = fcyl, shape = fam)) +
  geom_point()

# 5 aesthetics: add a mapping of size to hp / wt
ggplot(mtcars, aes(mpg, qsec, color = fcyl, shape = fam, size = hp / wt)) +
  geom_point()

#Modifying aesthetics
ggplot(mtcars, aes(fcyl, fill = fam)) +
  geom_bar() +
  # Set the axis labels
  labs(x = "Number of Cylinders", y = "Count")

palette <- c(automatic = "#377EB8", manual = "#E41A1C")

ggplot(mtcars, aes(fcyl, fill = fam)) +
  geom_bar() +
  labs(x = "Number of Cylinders", y = "Count")
# Set the fill color scale
scale_fill_manual("Transmission", values = palette)

palette <- c(automatic = "#377EB8", manual = "#E41A1C")

# Set the position
ggplot(mtcars, aes(fcyl, fill = fam)) +
  geom_bar(position = 'dodge') +
  labs(x = "Number of Cylinders", y = "Count")
scale_fill_manual("Transmission", values = palette)

#Setting a dummy aesthetic
# Plot 0 vs. mpg
ggplot(mtcars, aes(mpg, 0)) +
  # Add jitter
  geom_point(position="jitter")

ggplot(mtcars, aes(mpg, 0)) +
  geom_jitter() +
  # Set the y-axis limits from -2 to 2
  ylim(-2, 2)

