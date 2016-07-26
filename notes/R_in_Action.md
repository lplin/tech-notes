# Scalars
Scalars are one-element vectors. Examples include f <- 3 , g <- "US" ,
and h <- TRUE . They’re used to hold constants.

# Vector
Note that the data in a vector must be only one type or mode (numeric, character, or logical).
You can’t mix modes in the same vector.

# Matrix:
A matrix is a two-dimensional array in which each element has the same mode
(numeric, character, or logical). Matrices are created with the matrix() function.

# Data frames
A data frame is more general than a matrix in that different columns can contain different modes of data (numeric, character, and so on).
Each column must have only one mode, but you can put columns of different modes together to form the data frame.

# attach()
The attach() function adds the data frame to the R search path. When a variable
name is encountered, data frames in the search path are checked for the variable in order.

The detach() function removes the data frame from the search path. Note that detach() does nothing to the data frame itself. The statement is optional but is good programming practice and should be included routinely.

Here you already have an object named mpg in your environment when the mtcars
data frame is attached. In such cases, the original object takes precedence, which isn’t
what you want. The plot statement fails because mpg has 3 elements and disp has 32
elements. The attach() and detach() functions are best used when you’re analyzing
a single data frame and you’re unlikely to have multiple objects with the same name.
In any case, be vigilant for warnings that say that objects are being masked.
An alternative approach is to use the with() function. You can write the previous
example as
with(mtcars, {
	print(summary(mpg))
	plot(mpg, disp)
	plot(mpg, wt)
})

# with()
The limitation of the with() function is that assignments exist only within the function brackets. Consider the following:
> with(mtcars, {
  stats <- summary(mpg)
  stats
})
Min. 1st Qu. Median
Mean 3rd Qu.
10.40
15.43
19.20
20.09
22.80
> stats
Error: object 'stats' not found