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

# dollar sign ($)
The period (.) has no special significance in object names. The dollar sign ($) has a somewhat analogous meaning to the period in other object-oriented lan-
guages and can be used to identify the parts of a data frame or list. For example, A$x refers to variable x in data frame A.

# block comments
R doesn’t provide multiline or block comments. You must start each line of a multiline comment with #. For debugging purposes, you can also surround code that you want the interpreter to ignore with the statement if(FALSE){...}. Changing the FALSE to TRUE allows the code to be executed.

# Assigning a value to a nonexistent element of a vector, matrix, array, or list expands that structure to accommodate the new value. For example, consider the following:
> x <- c(8, 6, 4)
> x[7] <- 10
> x
[1] 8 6 4 NA NA NA 10

# Scalars
R doesn’t have scalar values. Scalars are represented as one-element vectors.

# Declare
Variables can’t be declared. They come into existence on first assignment.

# Importing data via connections
Many of the examples in this chapter import data from files that exist on your computer. R provides several mechanisms for accessing data via connections as well. For example, the functions file(), gzfile(), bzfile(), xzfile(), unz(), and url() can be used in place of the filename. The file() function allows you to access files, the clipboard, and C-level standard input. The gzfile(), bzfile(), xzfile(), and unz() functions let you read compressed files.

# installing xlsx package (Cannot compile a simple JNI program on Debian)<http://stackoverflow.com/questions/22042914/cannot-compile-a-simple-jni-program-on-debian-wheezhy>
I had a similar problem while installing xlsx package that has some dependencies maybe related to java and r java packages...

In order to solve your problem you have to: - check environment variables $JAVA_HOME and $PATH - sudo R CMD javareconf

If it doesn't help, try out my configuration with java-7-oracle,

install java-7-oracle via webupd8 repository Installing Java 7 (Oracle) in Debian via apt-get
set environment variables $JAVA_HOME and $PATH
export JAVA_HOME=/usr/lib/jvm/java-7-oracle
export PATH=$PATH:$JAVA_HOME/bin
sudo update-java-alternatives -s java-7-oracle
sudo R CMD javareconf
and than retry the installation of rjava

I hope it will help you!
