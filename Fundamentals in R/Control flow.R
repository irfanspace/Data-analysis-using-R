#General form
# if (condition TRUE) action
# if (condition TRUE) action
# else alternative action
#Specific syntax
a <- 1
if ( class(a) == "numeric")
{ 
  a = a +1 
  }
# if (condition TRUE) action
# else alternative action
a = "New York"
if (class(a) == "numeric")
  {
  a = a+1
} else if (class(a) == "character") {
    a = "California"
  } else if (class(a) == "factor" ) {
  }

##=========Loops
#  for a set of values, do "this"
#In a for loop, we aim to instruct the computer to run the same
#  operation a number of times.
#what do we need to specify?
#  We need to specify, what do we want to do every time and how many times.
#General form
       # for("how many times")
       # {
       #   "what to do everytime"
       #   }

#Specific form
      # for("for each column")
      # {
      #   "compute the mean"
      #  }
P <- matrix(c(2:17), 4,4)
P
for( i in c(1,2,3,4) )
{
  mean(P[,i])
}

#While
#while("statement' holds TRUE)
# {
#    "do something"
#    }

#Specific syntax
i = 0
while (i < 3)
  {
  print(i)
  i=i+1
}

# If and Else
a <- 8
if ( a < 10) {
  print("single digit")
}

b <- 11
if (b < 10){
  print("single digit")
} else {
  print("double digit")
}
# or, we can write short code
if (b < 10) "single digit" else ("double digit")

# we can store as a variable
c <- if (b < 10) "single digit" else ("double digit")
c
# Nested version with arbitrarily many options: more than two conditions
y <- 70
if (y < 18) {
  "young"
} else if (y <= 40){
  "middle-aged"
} else {
  "adult"
}

# Evaluating entire vector instead of a scalar
v1 <- seq(1,10)
ans <- ifelse(v1/2 == 4, "Here", "Nope")
ans

##Switch statements
colorMapper <- function(x) {
  switch(x,
          red = "#FF0000",
          green = "#00FF00",
          blue = "#0000FF",
          stop("invalid color name")
  )
}
         
colorMapper('red')
colorMapper('tree')

# For Loop
mat1 = matrix(
  data = rnorm(12),
  nrow = 3,
  ncol = 4,
  dimnames = list(NULL, c('col1', 'col2', 'col3', 'col4')))

#Initialize result vector. We know how large the result is.
means <- vector("list", ncol(mat1))

#Iterate over matrix columns and populate result
for (i in 1:ncol(mat1)) {
  means [[i]] <- (mean(mat1)[,i])
}