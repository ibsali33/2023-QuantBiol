# =====================================================================
# Welcome to Mol Bio 254D Programming Component
# =====================================================================

# For this course we will be using the R programming language.
# R is one of the most commonly used and powerful statistical 
# programming languages and is used to analyze and manipulate 
# data for virtually every professional industry. Over the last 
# 10 years, powerful new tools within R have emerged to make data 
# manipulation and visualization an easier and more accessible 
# process. R is an open source software which means that it will 
# remain freely available to those who need to use it, but also
# may change its capabilities and improve over time. 

# R Studio is a software created by the Posit company as an integrated
# development environment (IDE) which is a fancy way of saying a
# conveniently arranged and multipurpose software for developing code.
# You can run R directly in the command line, but using an IDE like R
# Studio will make developing scripts much easier.

# =====================================================================
# Session 1
# =====================================================================
# How does R work?
# =====================================================================

# R reads your data (e.g., from an excel or text file) and makes 
# an image of it, which is stored in temporary memory. When you 
# edit your data, you are only editing an image of it; the original 
# dataset is unaffected.  You can then create and alter the datasets 
# within R, which can then be written back to a permanent file. 
# This is called 'nondestructive editing'. You can also create 
# objects from directly within R, as opposed to reading them in from a file.

# R can do almost anything you can think of doing with your data, 
# which greatly expands the amount of creativity you can apply to 
# your analyses. By using scripts (".R" files, such as this one), 
# you can keep a record of everything you've done to manipulate and 
# analyze your data. Those benefit you later, and can be published 
# or shared with colleagues.

# This course is designed for learners who have little to no experience 
# with R programming, but want to learn. For our session today we have the
# following main learning outcomes. For students are more advanced, we ask
# you to help answer questions, bust some jargon, and support your peers as
# they learn how to code in R for themselves. 

## Become familiar with the R Studio IDE
## Recognize the working directory and file paths
## Install packages, and load them into R
## Identify how to find help in R

# Take notes and annotate within this document by using the hashtag / pound #
# symbol at the beginning of the line. Without the # symbol, R will try to read 
# the text as if it were code, and it may cause the code to fail.

# =====================================================================
# Why are we using R?
# =====================================================================

# The most common software used for working with tables and running statistics
# are Microsoft Excel, Google Sheets, SPSS, SAS, GraphPad Prism. the main
# advantage of these software is that they are relatively easy to pick up
# and visually intuitive compared to programming language. On the other hand, 
# specialized software like SPSS, SAS and Prism all require expensive licenses
# creating a challenge when collaborators want to view the work you have done.
# Even when using free software, point and click tasks need to be repeated 
# manually every time you get a new data set which can be time consuming and 
# makes room for human error. 

# R is particularly useful for repetitive tasks like that data analysis you
# need to do for the qPCR that you have run for the 30th time. It is also
# built as a statistical programming language meaning that single commands
# can quickly calculate averages and complex statistics on those values
# quickly, efficiently, and in a way that is reproducible. 

# =====================================================================
# The layout, soft-wrapped code, and saving files
# =====================================================================

# In RStudio's default setting, the left side is the console. Once you 
# open an R source file, codes and scripts are displayed in the top 
# left hand corner. The bottom left remains as is the console where 
# code can be typed or copied directly. When running code from R scripts
# or R notebooks, it will automatically show up and run in the console.

# The top right contains the "Environment" which is where information
# about objects created in R are stored. More on this later... Other tabs
# in this section include "History" which shows you a history or a log of
# the commands that have run in your R session. It also contains a 
# "Connections" tab that allows you to directly connect to servers to retrieve
# data. Last, it contains a "Tutorial" tab. It won't work right after
# installation, but after installing the necessary packages, it has tutorials
# created by R developers to answer frequently asked questions. 

# The bottom right panel is arguably the most important panel: take a 
# look at the series of tabs. The "Files" tab can be used to navigate 
# and set directories. The "Plots" tab is where generated plots will 
# show up. The 'Packages' tab shows which R packages are installed in 
# your environment. The "Help" tab is where to search for usage 
# information for R commands that are currently installed. The "Viewer" 
# tab is for viewing local web content or web-based graphics. Finally,
# The "Presentation" tab

# There is certainly plenty to explore in the Rspace. There are some 
# global options that you may want to review before beginning. First, 
# allowing for 'soft-wrap' will make it significantly easier to view 
# code in the top left window. To change this setting, go to the 'Tools' 
# menu, and select "Global Options" this should open a new window with 
# many options. Under the 'Code' tab, there will be a box that says 
# "soft-wrap R source files". Select that box, if it is not already 
# selected. You can also change the appearance to a variety of pre-built
# settings. 

# Creating new R projects, R source files, and R markdown documents.
# (look for the + at the top left)






# =====================================================================
# The working directory
# =====================================================================

# You probably already know that there is a file system in your computer that
# can be used to find and organize the things in its system. You have probably
# created folders to organize your own work. The term "directory" refers
# to a folder in the file system of your computer. The working directory 
# is the folder on your computer that you have designated as the main reference
# point when running code.

# When importing data, or writing new files in R you need to designate the 
# path to that item from the working directory. 
# To see what directory you are currently in type getwd().



# You will see something that looks like "/Users/MyName/Desktop/254D/Module1/"
# If you are working in Posit Cloud you might see "/cloud/project/Session1"

# The output of setwd() is a file path. In other words, it is the path through
# the folders in your computer from its root to the location of the folder 
# that you are working in. 

# Similar to other command-line operations, setting the working directory 
# at the beginning of whatever script you are writing will simplify
# reading and writing data. When you ask R to import (read) a file, 
# or export (write) a file, it will automatically complete the task in 
# the working directory. If you are looking for a file that is not in the
# working directory, you have to indicate the path the computer needs to
# take in order to find that file. If you want to write a file into a 
# directory that is not your working directory, you must indicate that as well.

# When you open an R session it will be in a default directory which you may
# need to change. The easiest way to set the directory is by navigating to the
# folder of interest in the 'Files' tab on the bottom right and then click on
# 'More' which allows you to set the working directory, or return to the 
# current working directory.

# NOTE: you can use the command setwd() to set the working directory to any 
# other file path you want. You can change directories from your working
# directory, or you can set the directory using the absolute file path, (from
# the root folder) like what you saw when you typed getwd()

# To see the contents of the working directory type dir()





# =====================================================================
# Installing and loading packages
# =====================================================================

# Almost all R programming will require loading or installing specific 
# R packages in order to execute particular functions. For the purposes 
# of this course we will need to use a wide variety of packages. In order 
# to do that you must use the 'install.packages()' command. Here are some 
# packages that you can install.

# The packages: 
# tidyr - for cleaning and organizing data
# dplyr - human readable data wrangling package
# reshape2 - for cleaning and organizing data
# ggplot2 - for plotting tidy data
# RColorBrewer - for flexible color palettes
# lubridate - for working with dates and times

# Try it out
install.packages("tidyr")
install.packages("dplyr")
install.packages("reshape2")
install.packages("ggplot2")
install.packages("RColorBrewer")
install.packages("lubridate")


# HINT: In order to run code from an Rsource file, click in the line or 
# highlight the code that you want to run and hit Command/Control + Return.  
# Thiswill execute the line(s) of code in the console. Install the rest of 
# the packages listed above. Notice what happens in the console. Pay attention
# to see if there are any warning or error messages. 

# Packages are bits of code that are built in order to perform specific tasks
# in R. For example: the tidyr, dplyr and tibble packages are built organize 
# and clean data that you are working with. The packages ggplot2 and RColorBrewer 
# are used for data visualization and color blending. The lubridate package is
# used for working with dates and times when plotting. Each of these will 
# will come in handy by the end of the workshop.

# Once packages are installed you can see them listed under the 'Packages' 
# tab in the bottom right hand panel. In order to use the installed 
# packages, they need to be loaded in the R session. To do this use the 
# 'library()' command. See examples below.


library("tidyr")
library("dplyr")
library("reshape2")
library("ggplot2")
library("RColorBrewer")
library("lubridate")


# Use the library() command for all the packages you just installed. 
# Are there other ways to load libraries in R?
# Notice any errors or warnings.

# Pro Tip: Load all the necessary packages for your code using the library()
# command at the beginning of your coding session. If you don't have packages
# loaded when you run a command you have written it will give you an error
# that says "could not find function." 

# Often programmers don't always know what libraries or packages to
# use when they are starting a computational workflow. Below we will
# talk about finding help and where to find the packages that you can
# use to write code.

# =====================================================================
# Finding Help
# =====================================================================

# There are a lot of options when it comes to finding help in R. 
# The quickest way is to go to the bottom right hand corner under 
# the 'Help' tab. This is most useful for when you already know what
# command you need help with. In this tab you can use the search box 
# to search the commands you need help with. We will practice this as 
# we start working with code.

# Sadly, the documentation for some packages in R is absolutely 
# horrific and unintelligible. So our next best friend is the internet. 
# But before going into the abyss - a good place to start are the 
# RStudio cheat-sheets. These cheat sheets are made for some of the most 
# commonly used and useful packages in R and they outline the command 
# options and syntax for those packages. For this particular workshop 
# I recommend a few listed below:

# data import: 
# https://evoldyn.gitlab.io/evomics-2018/ref-sheets/R_data-import.pdf
# data transformation: 
# https://posit.co/wp-content/uploads/2022/10/data-transformation-1.pdf
# data visualization with ggplot2: 
# https://posit.co/wp-content/uploads/2022/10/data-visualization-1.pdf

# RStudio (now known as Posit) has created a bunch of these cheat sheets 
# and they can all be accessed using RStudio Cloud or by searching RStudio 
# cheat sheets. There is no need to look at these in detail quite yet. 
# Relevant commands will be provided through instruction. However, I highly
# recommend reviewing these cheat sheets to see the breadth of capabilities
# of RStudio's selected packages at some point.

# Otherwise, a large majority of data wrangling, visualization and statistics
# questions have been asked or discussed on various forums. One strategy is to 
# just describe what you are trying to do in the google search bar and see if 
# any forums pop up. Common forums include 'StackOverflow', 'R-bloggers' and 
# for life sciences or bioinformatics workflows 'Biostars'. 

# Lets take a look at ChatGPT




# =====================================================================
# Computational Syntax and Writing Commands
# =====================================================================

# Often you will hear the term "syntax" when people are discussing the way
# the code is written. Syntax is the arrangement of words and phrases
# to create a well-formed sentence. When you are coding, you will often use
# a series of commands to tell the computer what to do with your data. 
# For every command, like any sentence, arranging the phrases and punctuation
# is necessary in order for it to make sense. Within a command, each phrase
# is called an "argument" and arguments are separated by commas. Commands 
# often include a series of arguments that provide details for how to 
# follow those instructions. 

# We have already used some commands when we were looking at the working
# directory and installing packages. These commands are fairly basic, where
# you can write them out and include one word, or less to run them. As we 
# move forward, we will get experience arranging multiple arguments in a
# command, and stringing multiple commands together in order to complete
# tasks relating to data cleaning, analysis and visualization.


# =====================================================================
# Creating new R source files, or R markdown files. 
# =====================================================================

# Some of the most common ways to compose code in R is by creating an
# R source file (like this one), or an R markdown document in order to keep
# a clean history of the code you are writing. To do that there is a button
# in the top left corner with a white square, and green circle with a plus
# symbol. You might notice the many types of documents you can open in 
# R studio. 

# The most common relevant documents we will use in R are R source files
# and R markdown documents. R source files are essentially plain text files
# with the .R suffix in the file name. You can run lines of code directly  
# from files, or run the whole script which will be read from top
# to bottom and execute any code that is recognized as R. If there are
# lines of code that do not work, the R script will fail and an error
# message will appear.

# R markdown documents contain a bit more metadata than R source files
# and are useful if you want to compose documents from your code. R markdown 
# files can create word docs, pdfs, powerpoint presentations, webpages 
# and more. They use a combination of code chunks written in R and plain 
# text that can be formatted using markdown code. Individual chunks can be 
# run, or excluded, which offers flexibility when troubleshooting
# code, and nice formatting when you want to share the work with others.

# =====================================================================
# Challenge
# =====================================================================

# Follow the instructions and answer as many questions as you are able.
# Create an R source file and save it in your working directory.
# Create an R markdown file and save it in your working directory.

# What differences do you notice when you create an R source file
# compared to an R markdown document?

# How do you create a code chunk in R markdown?



