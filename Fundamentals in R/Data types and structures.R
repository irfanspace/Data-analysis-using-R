##1............. Data types
#Numeric
#- Integer (1, 2, 3,
#           - Floating point (42.1)
#           - Complex (real and imaginary part, e.g. 3 + 1i)

#Text
#          - Character ('a', 'B', )
#          - String

#Logical
           #Boolean (True / False)
           #Will talk about them in a later lecture in much more detail
#Special values
           #  Null: object returned when the result of a function is undefined
           #  NA: not available (missing value in dataset)
           #  NaN: not a number (e.g. undefined mathematical operation)
           #  Inf: Infinity (e.g. number too large)
##Variable
# charaters are a,b,c, so on
# string is a group of character plant, name so on
a <- 1+4
b <- 8-1
c <- a+b
d <- "plant"
#if you want to know the class of variable
class(a)
class(d)

##2............ Data Structures
# Scalar — single value of certain type
#    a = 2
#    a <- 2
# A scalar data structure holds only a single atomic value, and it's the most basic datatype.

#In this case, a new variable named a is created that contains a value, two.
#However, using a scalar we can construct more complex data types.
#For instance, we can generate vectors by concatenating values of the same type.
#Again, we will need to learn the syntax.
#In this example, we observe that we are generating a new variable name vec,
#which is a concatenation of three values: 1, 2, and 3.
#The word c here stands for combine or concatenate and is in reality,
#this letters C is a function.

# Atomic Vector — ordered set of values of same type
vec = c(1,2,3)

#vectors must have everyone of the items of the vectors 
#within the vectors to be of the same type.
#If we want to have different types, then we will be using what we call lists.

#List — list of values of variable type
lst = list('a','b')

##matrix- to create table like spreadsheet
# Matrix — matrix of values same type
# "name" = matrix("values", # of rows, # of columns)
#                ?matrix (if you want to know in more details type ?matrix
#                 in the console pane and hit enter)

mat = matrix(0, nrow = 2, ncol = 2)

##Data frames
#Data frame — "a set of columns"
#?data.frame
#"name"= data.frame("define column 1"
#                  "define column n")

#You can think of DataFrames as a collection of columns,
#where every column can be a vector of different types.

df = data.frame (col1 = c(1,2),  col2 = c("a","b"))

#Factor
# Factor — list of fixed categorical values (levels)
#Factors are list of predefined set of values.

#For instance, we generated a factor derived from a vector.
#The vector contains three values: 1, 2, and 1.
#The factor will contain those three values,
#but we'll associate the values to two levels.

f = factor(x = c(1,2,1))

##Vector

v1 <- c(1,2,3,4,5,8)

v1 * 2

v2 <- v1+1

# Obtain length of vector
length(v1)
# Obtain class of all elements in vector
class(v1)
# Element-wise operation of two vectors of equal length
v3 <- c(4:9)
v1 + v3
# Element-wise operation possible when length of one vector is a multiple of the other
v4 <- c(1,2,3)
v1 + v4

# Error, if no of elements are not same
P <- c(1,4,7,9)
Q <- c(2,4,6,8)
P*Q

#Vectors allow only elements of same data type
F <- c(2, "Gordon", 8, a)

# Can add elements to existing vector
v5 <- c(v1, 11)
length(v1)
length(v5)

##3 List................

# 3- Lists
# Directly initialize list with varying data types

lst <- list(1, 2, 'three')
# Select a sublist of elements from list
sb.lst <- lst[1]
class(sb.lst)
# Select a single element from list
elem <- lst[[1]]
class(elem)
# List elements can be named and accessed by name
nmd.lst <- list(first = 1, second = 2, third = 'three')
nmd.lst$second

#you can change the element name whatever you want
nmd.lst <- list(x=1, y=2, z='three')
nmd.lst$z

#get names of list elements
names(nmd.lst)

##Matrix (if you want to add rows and columns)
#M1 <- matrix(fill, nrows, ncolums)
mt1 <- matrix(0, 2, 3)

mt2 <- matrix(2:5, 2, 2)
# Get dimensions of a matrix object
dim(mt1)
nrow(mt1)
ncol(mt1)

# Inspect head of matrix
head(mt1)

#if you want to find out any elements, input (row number and col number)

mt1[1,1]
#if you need to change any elements value
mt1[1,1] <- 12
mt1
mt2[1,2] <- 100
mt2

#mt3 and mt4
mt3 <- matrix(0,3,2)
mt3 [1,1] <- 5
mt3 [2,1] <- 2
mt3 [3,1] <- 7
mt3 [1,2] <- 8
mt3 [2,2] <- 1
mt3 [3,2] <- 4

#using syntax, we can add all elements at once
mt3 <- matrix (c(5,2,7,8,1,4), 2, 3)
mt4 <- matrix (c(2,-2,1,4,10,4), 2, 3)

#R operates matrices column by column
mt3 + mt4
mt3 * mt4
mt3 * 5
# R cannot able operate if rows and cols are not equal in matrices
mt2 + mt3
mt2 * mt3
#R is a column oriented programming language
#Unless we say otherwise, it's going to fill all the elements column by column.

#To add row n col names
rownames(mt4) <- c('T1', 'T2')
colnames(mt4) <- c('DS', 'Height', 'Weight')
mt4
#To access any elements 
mt4[2,3]
#To access col
mt4[,"DS"]
mt4[,3]

## Data frames
v1 <- c('T0', 'T1', 'T2')
v2 <- c(2, 4, 6)
v3 <- c(1, 3 ,5)
v4 <- c(11, 13, 17)

df1 <- data.frame(Treatment = v1, col2 = v2, col3 = v3, col4 = v4)
df1
# To know the class
class(df1)
class(df1[,1]) #To know the class of column
class(df1[,2])

#To access column names
colnames(df1)
df1$col2        #To see the values of a column
df1$Treatment

##Factor
#a factor is a specialized data structure used to represent and store categorical data
#examples include gender(Male, Female), t-shirt sizes(small, medium, large), or
#Blood types (A,B,AB,O)
# Initial data vector
data.vec<- c("small", "small", "medium", "large", "medium")
class(data.vec)
# Convert data to factor, all levels are considered equal, i.e. no order
data.factor <- factor(data.vec)
class(data.factor)
data.factor

# Can convert nominal factor to ordinal by introducing an order
data.factor <- factor(data.vec,
               order = TRUE,
               levels = c("small", "medium", "large"))
data.factor
