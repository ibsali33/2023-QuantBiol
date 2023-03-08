# =====================================================================
# Session 2 - Data Classes and Structures
# =====================================================================

# In this section we are going to begin discussing how to work with data
# in R. There are three main components to this:
# The first is importing data. R needs to create an "object" from the data 
# so that it can complete tasks using that object. The object is often a list 
# or a table containing your data set.
# The second aspect to remember is data class. Different classes of data are
# treated differently, and certain commands require specific data classes
# in order to complete their task. 
# The third is data structure. Commands in any programming language often
# assume the data is organized in a particular way. Perhaps it is a long 
# list of values, maybe it is in a table, or even something multidimensional, 
# like a list of values and tables.

# By the end of this module, you should be able to:

## Recognize at least three data classes used in R
## Recognize one- and two- dimensional data structures
## Import a data set into the R global environment
## Examine the class and structure of objects
## Change between the class and structure of objects

# --------------------------------------------------------------------- 
# Load Libraries
# ---------------------------------------------------------------------
# As we covered in the previous session, it is a best practice to install
# relevant packages and load libraries to begin. For this section
# we are going to use code from readr and dplyr. If you don't have these
# installed or loaded do so using the install.packages() and library() 
# commands




# =====================================================================
# Useful Definitions
# =====================================================================
# --------------------------------------------------------------------- 
# Data Classes
# ---------------------------------------------------------------------

# R recognizes several classes of data. Below we have listed some of the
# most common data classes that you will work with in this course.

# Character data are strings of alphanumeric characters. Character data are
# case-sensitive and symbols are interpreted literally

# Numeric data includes integers (whole numbers) and numerics which includes
# numbers with decimals and scientific notation. 

# Logicals are TRUE / FALSE designations which are used for creating loops
# and for filtering or selecting data. 

# Factor data are categories that can be used to group variables and 
# calculate statistics.


# Pro Tip:
# Certain commands and functions in R require specific data types. If a 
# command input is in a data class that does not match it will often result
# in an error mentioning the data class it is expecting, or mentioning the
# class of data that is out of place. 

# --------------------------------------------------------------------- 
# Data Structures
# ---------------------------------------------------------------------

# A data structure is the way that data is organized. Specific R functions
# assume specific data structures of the input data in order to execute tasks. 
# In this section we are only going to define the data structures so that we
# can make sense of the data that will import in the next section.

# Data structures can be grouped into categories based on their dimensionality.

## One dimensional data structures:
# Scalar - an individual value of any data class
# Vector - a list of values of one data class (most commonly used in R)


## Two dimensional data structures:
# Data Frame - A table composed of vectors of equal length of any data class.
# Matrix - A table composed of one single data class. Row names and column 
# can provide additional information or context in matrices.


## Multidimensional data structures
# List - a series of objects of any data structure or class
# Array - a series of objects of any data structure of a single data class


# =====================================================================
# Data Import
# =====================================================================

# In order to work with data in R it needs to be imported from an outside 
# source. There are some data sets built into R, these are good for testing
# commands on a data set that is readily accessible. In a typical research 
# workflow the data will come from a dataset that you collect, create, or 
# one that you find in a publicly available database. 

# For this section we will pick apart three example data sets that have been
# prepared for the class. The first is data from an RNA sequencing experiment.
# The second is a data set from the TidyTuesday public data repository. 
# The third are data objects we will create directly in R.

# --------------------------------------------------------------------- 
# Importing data from a local directory
# ---------------------------------------------------------------------

# When you are writing code for your own research project, you will most
# likely have to import your data set in a form that R can work with. Our
# first step today will be to import our RNA sequencing data set.

# In our last session, we talked about the working directory. This is the
# folder in your computer's file system that R is treating as your home-base. 
# Any files you upload or write using commands in R, will occur relative to
# the working directory in your file system. 

# First check your working directory with getwd(), you can also use the
# files tab to go directly and view the contents of the working directory.
# If you followed our download instructions, when you check the files tab
# you will find a folder in your working directory called "RNAseqData" the 
# file we are looking for is in that folder.



# Now we're going to load our first data set into R. The base R 
# command for reading a table is the read.table() command. We can read 
# the table into an object using the assignment "<-" operator. Here is
# an example:




# The read.csv() and read.csv2() commands can also be used for importing 
# this data. Look at the documentation for read.table(). Notice the syntax.
# There are 3 arguments in this command separated by commas. First, we tell 
# the command which file we are loading written in quotations. Second, we
# indicate that the file contains headers, or a first row that is different 
# from all information below it. Last, we indicate the separator, or delimiter.
# In this case we are loading a CSV file which is an acronym for comma
# separated variable file. This means columns in the table are separated by
# commas. There are other common separators, like tab separated files and 
# more, but CSVs are going to serve as our entry point for this. 

# Using this example, we can view the contents of the table that was imported 
# using the View() command. You can either click on your new object in the 
# global environment or type View(object) to see it. 




# There are a lot of strategies that can be used to assign object names.
# Generally it is a best-practice to assign objects with names that are 
# short but descriptive, and without spaces. Here are some example naming 
# conventions

# YouCanNameThingsLikeThis 
# maybelikethis
# or.like.this
# even_like_this
# but-not-like-this (the dash is confused for subtraction)
# 4nor_likeThis (numbers are okay to use, but only at the end)

# --------------------------------------------------------------------- 
# Import data from an online directory
# ---------------------------------------------------------------------

# Another common way to load data into R is by directly using the
# path for an online directory. In this case we will be using a dataset
# shared by the TidyTuesday community. 

# Lets load in the soccer world cup dataset published Nov 2022. 
# You can find more info about the data set by following this url:
# https://github.com/rfordatascience/tidytuesday/tree/master/data/2022/2022-11-29

# If you follow the link, notice that the website contains a readme with
# information about the data set. It contains information about where the data
# came from, details about the different components of the data set, 
# instructions on how to load the data set into R. It also provides a
# data dictionary with (not very much) useful information.

# Let's use the import code copied directly from the repository:







# Pro Tip: 
# If you are downloading a data set form the internet for your
# research. Be sure to check to see if there is a data dictionary, or a 
# README file. Make sure you understand what exactly each variable means
# in data sets that you find. This will help you be sure your analysis 
# is doing what you expect it to do. 

# For example, if you are running an analysis that relies on using a 
# specific concentration of a reagent. A variable named "Concentration"
# that includes numeric values doesn't help you determine if the number 
# means grams per liter or millimolar or micrograms per milliliter. It is a
# best practice to include detailed definitions of variables in a data 
# dictionary, or readme file published alongside the data set, that way
# variables can have short and concise names in the data set. 

# In what other cases would a data dictionary or readme file be helpful?





# --------------------------------------------------------------------- 
# Creating your own objects (Vectors)
# ---------------------------------------------------------------------

# The most fundamental data structure in R is the Vector. Lets practice
# creating some basic vector objects using the c() command and assignment 
# operator (<-) 

# Let's create a vector of numbers, one of characters, and one of words.




# Even simple functions in R like addition and subtraction, operate very
# efficiently on vectors. So if we have two vectors of equal length that 
# contain numbers, you can subtract Vector A from Vector B, and it will
# subtract the first value of Vector A from the first value of Vector B,
# then it will subtract the second value, and third value, and so on.
# This makes running repetitive calculations very efficient when you have 
# tens of thousands of observations like what you find in an RNAseq data set.

# Here is a visual example

#    Vector A  +  Vector B  =  Output
#        1     +      2     =    3
#        3     +      4     =    7
#        5     +      6     =    11

# What happens if we try to subtract numbers from characters?


# As it stands, this wont work. We need to learn a bit more before
# we can troubleshoot this problem.

# --------------------------------------------------------------------- 
# Creating your own objects (Data Frames)
# ---------------------------------------------------------------------

# Since we have just made a few vectors of equal length. We can put these
# together into a data frame. Create an object using the data.frame()
# command with vectors of equal length. See the example below.



# View your data frame and notice how it arranges the vectors.


# --------------------------------------------------------------------- 
# Removing objects
# ---------------------------------------------------------------------

# As you create more objects that are saved to your global environment,
# it might become confusing or challenging to keep track of them all. 
# There are three approaches you can use to keep the global environment
# clean. The first is to remove objects when you no longer need them.
# to do that you can use the rm() command. If you remove an object using
# the rm() command, it will disappear from the global environment and no
# longer be stored in temporary memory. 



# You may also want to overwrite objects as you improve aspects of your
# code. To do this, use the assignment operator, and reassign the value of
# of the object. 



# If you just need to do a hard reset of your global environment, and clear
# everything out. Use the rm(list=ls()). This removes the list of every data 
# object in your global environment called out by ls(). Don't run this now!!
# Moving forward, we will start each session by clearing the environment
# and loading all the necessary libraries.

# =====================================================================
# Viewing data classes and structures.
# =====================================================================

# Now that we have created a few objects in R we can see how class and 
# structure is applied to commands in R. Use the str() command on one of the
# data sets we imported. This command will reveal the structure and classes 
# of the data. The output for this command will appear in the console below. 
# Using the same syntax from the line of code below, check the structure 
# of all the objects we have created so far.






# You might notice that all the objects we created are data frames
# You might also notice the list of variables shown by str(). This list
# shows a $ followed by the variable name, then an abbreviation of the
# data class, and the first few values listed. Write out the data class
# abbreviations that you see in the output of the str() command as notes 
# below.





# There are a lot of ways view aspects of your data set. Depending on the 
# number of columns, or rows that you have, you might want to use one
# or more strategies. The quickest way to view a data set is to use the
# head(dataframe) command to see the first several lines of a data set
# or use tail(dataframe) to see the last several lines the data set. 
# Try it out with the data sets that we imported.

head(XXXXXXX)
tail(XXXXXXX)

# You can also look at the 'class' of objects that you create and their
# components. We mentioned that commands are often designed to work with
# specific data classes, so if you get an error about the data class you
# can use the next commands to view the class, and change them if needed.

# First lets use class() on the vectors we created earlier.
class(XXXXXXX)

# Next lets use class on a column in the data frame. You can pick out
# columns from a data frame using the $. Using the dataframe$column syntax
# this will call out specific columns from your data frame and treat them
# as their own vectors.




# You can use specific commands to take a look at the different column and 
# row names within various data sets using the colnames() or rownames()
# commands. 





# --------------------------------------------------------------------- 
# Modifying data classes and structures.
# ---------------------------------------------------------------------

# Previously we tried subtracting numbers from characters and we got 
# an error. 


# Since the character vector is made up of numeric characters,
# we can convert this to a numeric and complete our calculation.

# You can change classifications using R commands such as:

# as.character() - converts object to character class
# as.integer() - converts object to whole-number integer class (rounds down)
# as.numeric() - converts object to decimal number class
# as.logical() - converts object to logical (TRUE/FALSE) value

# we can use the as.numeric() command to complete the calculation


# Variables in R are case sensitive, the most common reason why code does not 
# work is because there is a typo in the code that prevents R from recognizing
# what it is being tasked to do.

# --------------------------------------------------------------------- 
# Working with Wide or Long data
# ---------------------------------------------------------------------

# Data sets can be written in two different formats, wide and long. 
# Lets examine a wide and long version of an RNAseq data set containing
# the number of reads for each gene. Load in the wide data set using the 
# code below.

BulkRNAseqWide <- read.csv("../Datasets/Bulk RNAseq/BulkRNAseq_reads.csv")

# In our wide version of this RNAseq data set, the first column is a list 
# of gene IDs, and each column to the right contains the number of reads for
# that specific replicate and condition. A wide data set is great for creating
# heatmaps and matrices, but is limited in the ways it can be transformed
# for creating statistical summaries or other types of visualization.

# Let's take a closer look at the first BulkRNAseq data set that we imported
View(BulkRNAseq)

# In this data set we have a column for each variable that is collected. 
# You can see it is much longer and contains a lot more repetitive information
# Long data is also known as tidy data, and many (but not all) of the 
# operations we will do in R will require long form data.

# --------------------------------------------------------------------- 
# Summary
# ---------------------------------------------------------------------

# Over the course of this session we have talked about some of the most
# common data classes and structures you will come across. We imported
# data sets into R objects and created some of our own. 

# During your journey learning R, being aware of data classes and structures
# will make a huge difference when it comes time to troubleshooting your code.
# Trying to run code using data that is read as the wrong class, or in the
# incorrect structure, are some of the more common errors you will get. 

# Error messages might be challenging to decrypt, but being aware of
# the most common things that prevent your code from working will 
# save you a lot of time and grief as you learn this new langauge.

# --------------------------------------------------------------------- 
# Challenge
# ---------------------------------------------------------------------

# Using some of the help tools we discussed in Session 1, look up how to
# pivot a table in R and try to answer as many of the questions below
# as you can. 

# Which of the help tools did you try, and which was the easiest to 
# understand?

# What library, or package, could you use to pivot a table, if needed?

# If you start with the wide form data set, which command(s) would you try?




