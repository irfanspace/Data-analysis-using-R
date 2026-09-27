## Correlation matrix
data(SaratogaHouses, package="mosaicData")

# select numeric variables
df <- dplyr::select_if(SaratogaHouses, is.numeric)

# calulate the correlations
r <- cor(df, use="complete.obs")
round(r,2)

library(ggplot2)
library(ggcorrplot)
ggcorrplot(r)

ggcorrplot(r, 
           hc.order = TRUE, 
           type = "lower",
           lab = TRUE)

##=======Linear regression
data(SaratogaHouses, package="mosaicData")
houses_lm <- lm(price ~ lotSize + age + landValue +
                  livingArea + bedrooms + bathrooms +
                  waterfront, 
                data = SaratogaHouses)
# conditional plot of price vs. living area
library(ggplot2)
library(visreg)
visreg(houses_lm, "livingArea", gg = TRUE) 

# conditional plot of price vs. waterfront location
visreg(houses_lm, "waterfront", gg = TRUE) +
  scale_y_continuous(label = scales::dollar) +
  labs(title = "Relationship between price and location",
       subtitle = paste0("controlling for lot size, age, ",
                         "land value, bedrooms and bathrooms"),
       caption = "source: Saratoga Housing Data (2006)",
       y = "Home Price",
       x = "Waterfront")

##========Logistic Regression
# fit logistic model for predicting
# marital status: married/single
data(CPS85, package = "mosaicData")
cps85_glm <- glm(married ~ sex + age + sex*age + race + sector, 
                 family="binomial", 
                 data=CPS85)
# plot results
library(ggplot2)
library(visreg)
visreg(cps85_glm, "age", 
       gg = TRUE, 
       scale="response") +
  labs(y = "Prob(Married)", 
       x = "Age",
       title = "Relationship of age and marital status",
       subtitle = "controlling for sex, race, and job sector",
       caption = "source: Current Population Survey 1985")

# plot results
library(ggplot2)
library(visreg)
visreg(cps85_glm, "age",
       by = "sex",
       gg = TRUE, 
       scale="response") +
  labs(y = "Prob(Married)", 
       x = "Age",
       title = "Relationship of age and marital status",
       subtitle = "controlling for race and job sector",
       caption = "source: Current Population Survey 1985")

#References
#Breheny, Patrick, and Woodrow Burchett. 2017. “Visualization of Regression Models Using Visreg.” Journal Article. The R Journal 9 (2): 56–71. https://doi.org/10.32614/RJ-2017-046.
#Wickham, Hadley, and Garrett Grolemund. 2017. R for Data Science : Import, Tidy, Transform, Visualize, and Model Data. Book. Beijing: O’Reilly.