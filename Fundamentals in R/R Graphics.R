#R Graphics 
#PLOT Function
#The plot() function is used to draw points (markers) in a diagram. The function takes parameters for specifying points in the diagram. 
#Parameter 1 specifies points on the x-axis.
#Parameter 2 specifies points on the y-axis.
#At its simplest, you can use the plot() function to plot two numbers against each other:

plot(2,5)

#To draw more points, use vectors
plot(c(2, 4), c(1, 8))

#Multiple Points
#You can plot as many points as you like, just make sure you have the same number of points in both axis:
  
plot(c(3, 4, 5, 6, 7), c(3, 7, 8, 9, 12))

#For better organization, when you have many values, it is better to use variables:

x <- c(3, 4, 5, 6, 7)
y <- c(3, 7, 8, 9, 12)

plot(x, y)

#Sequences of Points
#If you want to draw dots in a sequence, on both the x-axis and the y-axis, use the : operator:

plot(1:10)  
plot(5:10)
plot(21:81)

#Draw a Line
#The plot() function also takes a type parameter with the value l to draw a line to connect all the points in the diagram:
  
plot(1:10, type="1")

#Plot Labels
#The plot() function also accept other parameters, such as main, xlab and ylab if you want to customize the graph with a main title and different labels for the x and y-axis:
  
plot(1:10, main="My Graph", xlab="The x-axis", ylab="The y axis")

#Graph Appearance
#There are many other parameters you can use to change the appearance of the points.

#Colors Use col="color" to add a color to the points:
  
plot(1:10, col="red")

#Size
#Use cex=number to change the size of the points (1 is default, while 0.5 means 50% smaller, and 2 means 100% larger):
  
plot(1:10, cex=2)

#Point Shape
#Use pch with a value from 0 to 25 to change the point shape format:
  
plot(1:10, pch=25, cex=2)

##Line Graphs
#A line graph has a line that connects all the points in a diagram.
#To create a line, use the plot() function and add the type parameter with a value of "l":
  
plot(1:10, type="l")

#Line Color
#The line color is black by default. To change the color, use the col parameter:
  
plot(1:10, type="l", col="blue")

#Line Width
#To change the width of the line, use the lwd parameter (1 is default, while 0.5 means 50% smaller, and 2 means 100% larger):
  
plot(1:10, type="l", lwd=2)

#Line Styles
#The line is solid by default. Use the lty parameter with a value from 0 to 6 to specify the line format.
#For example, lty=3 will display a dotted line instead of a solid line:
  
plot(1:10, type="l", lwd=5, lty=3)

#Available parameter values for lty:

# 0 removes the line
# 1 displays a solid line
# 2 displays a dashed line
# 3 displays a dotted line
#4 displays a "dot dashed" line
#5 displays a "long dashed" line
#6 displays a "two dashed" line

#Multiple Lines
#To display more than one line in a graph, use the plot() function together with the lines() function:
  
line1 <- c(1,2,3,4,5,10)
line2 <- c(2,5,7,8,9,10)

plot(line1, type = "l", col = "blue")
lines(line2, type="l", col = "red")

##Pie Charts
#A pie chart is a circular graphical view of data.
#Use the pie() function to draw pie charts:
  
# Create a vector of pies
x <- c(10,20,30,40)

# Display the pie chart
pie(x)

#Example Explained
#As you can see the pie chart draws one pie for each value in the vector (in this case 10, 20, 30, 40).

#By default, the plotting of the first pie starts from the x-axis and move counterclockwise.

#Note: The size of each pie is determined by comparing the value with all the other values, by using this formula:
  #The value divided by the sum of all values: x/sum(x)

#Start Angle
#You can change the start angle of the pie chart with the init.angle parameter.

#The value of init.angle is defined with angle in degrees, where default angle is 0.

#Start the first pie at 90 degrees:
  
  # Create a vector of pies
  x <- c(10,20,30,40)

# Display the pie chart and start the first pie at 90 degrees
pie(x, init.angle = 90)

#Labels and Header
#Use the label parameter to add a label to the pie chart, and use the main parameter to add a header:
  
# Create a vector of pies
x <- c(10,20,30,40)

# Create a vector of labels
mylabel <- c("Apples", "Bananas", "Cherries", "Dates")

# Display the pie chart with labels
pie(x, label = mylabel, main = "Fruits")

#Colors
#You can add a color to each pie with the col parameter:
  
# Create a vector of colors
colors <- c("blue", "violet", "green", "red")

# Display the pie chart with colors
pie(x, label = mylabel, main = "Fruits", col = colors)

#Legend
#To add a list of explanation for each pie, use the legend() function:
  
# Create a vector of labels
mylabel <- c("Apples", "Bananas", "Cherries", "Dates")

# Create a vector of colors
colors <- c("tomato", "steelblue", "green", "red")

# Display the pie chart with colors
pie(x, label = mylabel, main = "Pie Chart", col = colors)

# Display the explanation box
legend("bottomright", mylabel, fill = colors)

#The legend can be positioned as either:
#bottomright, bottom, bottomleft, left, topleft, top, topright, right, center