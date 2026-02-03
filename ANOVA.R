#ANOVA (Analysis of Variance) Test in R Programming
#1. Installing and Loading Required Packages
install.packages("dplyr")
library(dplyr)

#2_Viewing the Dataset
  #We inspect the first few rows of the dataset to understand the structure.
   #head: Displays the first few rows of a dataset.
head(mtcars)

#3. Performing One-Way ANOVA
 #We conduct a one-way ANOVA to examine if the mean displacement (disp) differs across gear levels (gear).
  #aov: Performs ANOVA.
  #factor: Converts a variable into a categorical factor.
  #summary: Displays the ANOVA result.
mtcars_aov <- aov(mtcars$disp ~ factor(mtcars$gear))
summary(mtcars_aov)

#4. Performing Two-Way ANOVA
 #We conduct a two-way ANOVA to analyze the influence of both gear and am (transmission) on disp.
  #aov: Used again for two-way ANOVA.
  #factor: Converts gear and am to categorical variables.
mtcars_aov2 <- aov(mtcars$disp ~ factor(mtcars$gear) * factor(mtcars$am))
summary(mtcars_aov2)

#5. Finding the Best-Fit Model with AIC
 #We compare both models using AIC to determine the better fit.
  #AICcmodavg: Package used for AIC comparison.
  #aictab: Compares models using AIC scores.
install.packages("AICcmodavg")
library(AICcmodavg)
model.set <- list(mtcars_aov, mtcars_aov2)
model.names <- c("mtcars_aov", "mtcars_aov2")
aictab(model.set, modnames = model.names)

#6. Visualizing the ANOVA Results
 #We use ggplot2 to visualize the distribution of disp across gear levels.
  #ggplot2: Used for creating elegant data visualizations.
  #ggplot: Initializes the plot object.
  #geom_boxplot: Creates boxplots.
  #labs: Adds titles and axis labels.
  #theme_minimal: Applies a minimal theme to the plot.
  #gridExtra: Arranges multiple plots side-by-side.
install.packages("gridExtra")
library(gridExtra)

install.packages("ggplot2")
library(ggplot2)

plot1 <- ggplot(mtcars, aes(x = factor(gear), y = disp, fill = factor(gear))) +
  geom_boxplot(color = "black", alpha = 0.7) +
  labs(title = "One-Way ANOVA", x = "Gear", y = "Displacement") +
  theme_minimal() +
  theme(legend.position = "top")

plot2 <- ggplot(mtcars, aes(x = factor(gear), y = disp, fill = factor(am))) +
  geom_boxplot(color = "black", alpha = 0.7) +
  labs(title = "Two-Way ANOVA", x = "Gear", y = "Displacement") +
  theme_minimal() +
  theme(legend.position = "top")

grid.arrange(plot1, plot2, ncol = 2)

##RESULT/OUTPUT
 #One-way ANOVA shows that gear has a significant effect on disp (p < 0.05).
 #Two-way ANOVA reveals that while gear significantly affects disp, the am variable does not.
 #AIC comparison suggests that the simpler model (mtcars_aov) is a better fit.
 #Visualizations clearly show differences in displacement across gear levels,with or without considering transmission.