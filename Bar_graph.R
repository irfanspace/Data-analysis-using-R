#package install
install.packages(c("ggplot2", "gcookbook", "MASS", "dplyr"))
library(ggplot2)

library(gcookbook)  # Load gcookbook for the pg_mean data set
ggplot(pg_mean, aes(x = group, y = weight)) +
  geom_col()

# There's no entry for Time == 6
BOD
# Time is numeric (continuous)
str(BOD)

ggplot(BOD, aes(x = Time, y = demand)) +
  geom_col()
# Convert Time to a discrete (categorical) variable with factor()
ggplot(BOD, aes(x = factor(Time), y = demand)) +
  geom_col()

ggplot(pg_mean, aes(x = group, y = weight)) +
  geom_col(fill = "lightblue", colour = "black")

##3.2 Grouping Bars Together
library(gcookbook)  # Load gcookbook for the cabbage_exp data set
cabbage_exp

ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col(position = "dodge")

ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col(position = "dodge", colour = "black") +
  scale_fill_brewer(palette = "Pastel1")

ce <- cabbage_exp[1:5, ]
ce

ggplot(ce, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col(position = "dodge", colour = "black") +
  scale_fill_brewer(palette = "Pastel1")

##Making a Bar Graph of Counts
# Equivalent to using geom_bar(stat = "bin")
ggplot(diamonds, aes(x = cut)) +
  geom_bar()

diamonds

##Using Colors in a Bar Graph
library(gcookbook) # Load gcookbook for the uspopchange data set
library(dplyr)

upc <- uspopchange %>%
  arrange(desc(Change)) %>%
  slice(1:10)

upc

ggplot(upc, aes(x = Abb, y = Change, fill = Region)) +
  geom_col()

ggplot(upc, aes(x = reorder(Abb, Change), y = Change, fill = Region)) +
  geom_col(colour = "black") +
  scale_fill_manual(values = c("#669933", "#FFCC66")) +
  xlab("State")

# 3.5 Coloring Negative and Positive Bars Differently
library(gcookbook) # Load gcookbook for the climate data set
library(dplyr)

climate_sub <- climate %>%
  filter(Source == "Berkeley" & Year >= 1900) %>%
  mutate(pos = Anomaly10y >= 0)

climate_sub

ggplot(climate_sub, aes(x = Year, y = Anomaly10y, fill = pos)) +
  geom_col(position = "identity")

ggplot(climate_sub, aes(x = Year, y = Anomaly10y, fill = pos)) +
  geom_col(position = "identity", colour = "black", size = 0.25) +
  scale_fill_manual(values = c("#CCEEFF", "#FFDDDD"), guide = FALSE)

#3.6 Adjusting Bar Width and Spacing
library(gcookbook) # Load gcookbook for the pg_mean data set

ggplot(pg_mean, aes(x = group, y = weight)) +
  geom_col()
#for narrower bars
ggplot(pg_mean, aes(x = group, y = weight)) +
  geom_col(width = 0.5)
#And for wider bars (these have the maximum width of 1)
  
ggplot(pg_mean, aes(x = group, y = weight)) +
  geom_col(width = 1)

#For a grouped bar graph with narrow bars
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col(width = 0.5, position = "dodge")
#some space with the bars
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col(width = 0.5, position = position_dodge(0.7))

#All of these will have the same result
geom_bar(position = "dodge")
geom_bar(width = 0.9, position = position_dodge())
geom_bar(position = position_dodge(0.9))
geom_bar(width = 0.9, position = position_dodge(width=0.9))

##Stacked Bar Graph
library(gcookbook) # Load gcookbook for the cabbage_exp data set

ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col()

cabbage_exp

ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col() +
  guides(fill = guide_legend(reverse = TRUE))

#If you’d like to reverse the stacking order of the bars,use position_stack(reverse = TRUE). 
#You’ll also need to reverse the order of the legend for it to match the order of the bars
  
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
geom_col(position = position_stack(reverse = TRUE)) +
guides(fill = guide_legend(reverse = TRUE))

#For a more polished graph, we’ll use scale_fill_brewer() to get a different color palette, 
#and use colour="black" to get a black outline (Figure 3.19)
  
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
geom_col(colour = "black") +
scale_fill_brewer(palette = "Pastel1")

##Proportional Stacked Bar Graph
#Use geom_col(position = "fill")
  
library(gcookbook) # Load gcookbook for the cabbage_exp data set

ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col(position = "fill")
#With position = "fill", the y values will be scaled to go from 0 to 1. 
#To print the labels as percentages, use scale_y_continuous(labels = scales::percent).

ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col(position = "fill") +
  scale_y_continuous(labels = scales::percent)

#To make the output look a little nicer, you can change the color palette and add an outline.
  
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col(colour = "black", position = "fill") +
  scale_y_continuous(labels = scales::percent) +
  scale_fill_brewer(palette = "Pastel1")

# Do a group-wise transform(), splitting on "Date"
ce <- cabbage_exp %>%
  group_by(Date) %>%
  mutate(percent_weight = Weight / sum(Weight) * 100)
ggplot(ce, aes(x = Date, y = percent_weight, fill = Cultivar)) +
  geom_col()

##Adding Labels to a Bar Graph
library(gcookbook) # Load gcookbook for the cabbage_exp data set

# Below the top
ggplot(cabbage_exp, aes(x = interaction(Date, Cultivar), y = Weight)) +
  geom_col() +
  geom_text(aes(label = Weight), vjust = 1.5, colour = "white")

# Above the top
ggplot(cabbage_exp, aes(x = interaction(Date, Cultivar), y = Weight)) +
  geom_col() +
  geom_text(aes(label = Weight), vjust = -0.2)

#Another common scenario is to add labels for a bar graph of counts instead of values. 
#To do this, use geom_bar(), which adds bars whose height is proportional to the number of rows, 
#and then use geom_text() with counts
ggplot(mtcars, aes(x = factor(cyl))) +
  geom_bar() +
  geom_text(aes(label = ..count..), stat = "count", vjust = 1.5, colour = "white")

# Adjust y limits to be a little higher
ggplot(cabbage_exp, aes(x = interaction(Date, Cultivar), y = Weight)) +
  geom_col() +
  geom_text(aes(label = Weight), vjust = -0.2) +
  ylim(0, max(cabbage_exp$Weight) * 1.05)

# Map y positions slightly above bar top - y range of plot will auto-adjust
ggplot(cabbage_exp, aes(x = interaction(Date, Cultivar), y = Weight)) +
  geom_col() +
  geom_text(aes(y = Weight + 0.1, label = Weight))

#For grouped bar graphs, you also need to specify position=position_dodge() and give it a value for the dodging width.
ggplot(cabbage_exp, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col(position = "dodge") +
  geom_text(
    aes(label = Weight),
    colour = "white", size = 3,
    vjust = 1.5, position = position_dodge(.9)
  )

#Putting labels on stacked bar graphs requires finding the cumulative sum for each stack.
library(dplyr)

# Sort by the Date and Cultivar columns
ce <- cabbage_exp %>%
  arrange(Date, rev(Cultivar))

# Get the cumulative sum
ce <- ce %>%
  group_by(Date) %>%
  mutate(label_y = cumsum(Weight))

ce

ggplot(ce, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col() +
  geom_text(aes(y = label_y, label = Weight), vjust = 1.5, colour = "white")

#To put the labels in the middle of each bar
ce <- cabbage_exp %>%
  arrange(Date, rev(Cultivar))

# Calculate y position, placing it in the middle
ce <- ce %>%
  group_by(Date) %>%
  mutate(label_y = cumsum(Weight) - 0.5 * Weight)

ggplot(ce, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col() +
  geom_text(aes(y = label_y, label = Weight), colour = "white")

#For a more polished graph
ggplot(ce, aes(x = Date, y = Weight, fill = Cultivar)) +
  geom_col(colour = "black") +
  geom_text(aes(y = label_y, label = paste(format(Weight, nsmall = 2), "kg")), size = 4) +
  scale_fill_brewer(palette = "Pastel1")

##Cleveland Dot Plot
library(gcookbook) # Load gcookbook for the tophitters2001 data set
tophit <- tophitters2001[1:25, ] # Take the top 25 from the tophitters data set

ggplot(tophit, aes(x = avg, y = name)) +
  geom_point()

#The tophitters2001 data set contains many columns, 
#but we’ll focus on just three of them for this example
  
  
  tophit[, c("name", "lg", "avg")]
#To further improve the appearance, we’ll make the vertical grid lines go away by using the theming system, 
#and turn the horizontal grid lines into dashed lines
  ggplot(tophit, aes(x = avg, y = reorder(name, avg))) +
    geom_point(size = 3) +  # Use a larger dot
    theme_bw() +
    theme(
      panel.grid.major.x = element_blank(),
      panel.grid.minor.x = element_blank(),
      panel.grid.major.y = element_line(colour = "grey60", linetype = "dashed")
    )

#It’s also possible to swap the axes so that the names go along the x-axis and 
  #the values go along the y-axis. We’ll also rotate the text labels by 60 degrees:
    
    
ggplot(tophit, aes(x = reorder(name, avg), y = avg)) +
  geom_point(size = 3) +  # Use a larger dot
  theme_bw() +
  theme(
     panel.grid.major.y = element_blank(),
     panel.grid.minor.y = element_blank(),
     panel.grid.major.x = element_line(colour = "grey60", linetype = "dashed"),
     axis.text.x = element_text(angle = 60, hjust = 1)
    )
#It’s also sometimes desirable to group the items by another variable. 
 #In this case we’ll use the factor lg, which has the levels NL and AL, 
  #representing the National League and the American League.

# Get the names, sorted first by lg, then by avg
nameorder <- tophit$name[order(tophit$lg, tophit$avg)]

# Turn name into a factor, with levels in the order of nameorder
tophit$name <- factor(tophit$name, levels = nameorder)
#To make the graph, we’ll also add a mapping of lg to the color of the points. Instead of using grid lines that run all the way across, this time we’ll make the lines go only up to the points, by using geom_segment(). Note that geom_segment() needs values for x, y, xend, and yend:
  
  
  ggplot(tophit, aes(x = avg, y = name)) +
  geom_segment(aes(yend = name), xend = 0, colour = "grey50") +
  geom_point(size = 3, aes(colour = lg)) +
  scale_colour_brewer(palette = "Set1", limits = c("NL", "AL")) +
  theme_bw() +
  theme(
    panel.grid.major.y = element_blank(),   # No horizontal grid lines
    legend.position = c(1, 0.55),           # Put legend inside plot area
    legend.justification = c(1, 0.5)
  )

#Another way to separate the two groups is to use facets
  ggplot(tophit, aes(x = avg, y = name)) +
    geom_segment(aes(yend = name), xend = 0, colour = "grey50") +
    geom_point(size = 3, aes(colour = lg)) +
    scale_colour_brewer(palette = "Set1", limits = c("NL", "AL"), guide = FALSE) +
    theme_bw() +
    theme(panel.grid.major.y = element_blank()) +
    facet_grid(lg ~ ., scales = "free_y", space = "free_y")
