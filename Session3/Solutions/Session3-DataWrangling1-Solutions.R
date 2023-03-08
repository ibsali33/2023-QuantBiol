# =====================================================================
# Session 3 - Data Wrangling with Vectors and Data Frames
# =====================================================================
# In our previous session we covered some practical fundamentals for coding
# in R. We learned about some of the most common data classes and data
# structures. We imported a data set with read.table() and read.csv() and 
# used commands like View(), str(), class(), rownames(), colnames() to get
# information about our data set. We used the c() command to create vectors
# and did some basic vector math. We also learned about different data formats
# like wide data and long (aka Tidy) data. Now that we have found ways to view
# our data, we can build on this and learn to transform data.

# Data transformation and data cleaning are among the most time consuming,
# but also rewarding aspects of coding in R. Often when you receive a data
# set, or load it into your environment, it isn't always in the format that
# is ready for data visualization or statistics. Similar to when you load
# a dataset into Google sheets or excel, you need to perform some tasks
# in order to create a plot, or calculate averages. In R, you write the 
# instructions for how things should be organized so that you can calculate 
# statistics and create plots. 

# By the end of this module, you should be able to:

## Recognize two data wrangling packages
## Filter a data set based on certain characteristics
## Select relevant variables from a larger data set
## Calculate basic statistical summaries

# --------------------------------------------------------------------- 
# Load Libraries and Import Data
# ---------------------------------------------------------------------

# For Session 3, we will be using data wrangling packages in order
# to transform our data and create statistical summaries. These include
# packages like 'dplyr', 'tidyr', and 'reshape2', among others. In session 2
# we discussed removing objects from our global environment using the rm()
# command. For our session today, we will start by completely clearing the 
# global environment, loading the libraries, and importing the data.

# Clear the environment
rm(list=ls())

# Load libraries
library(dplyr)
library(tidyr)
library(reshape2)

# Import Data
BulkRNAseq <- read.csv("Datasets/TidyBulkRNAseq.csv", header = TRUE, sep = ",")


# =====================================================================
# Cleaning Data with Dplyr
# =====================================================================

# The easiest way to start working with and cleaning data frames is with the 
# 'dplyr' and 'tidyr' packages. These packages offers a wide variety commands 
# to filter and clean data frames in order to make data sets more manageable
# to work with and visualize. We will get to use several of these commands
# in this lesson. It is important to note that the dplyr and tidyr packages
# work best with data frames. Other data wrangling packages may be needed for 
# other data structures. Since data frames are among the most common
# data structures that you will work with, we will focus on these packages.

# The syntax of dplyr commands comes in two flavors. The first is a standalone
# command used to create a new object. The second uses a symbol called a pipe
# which looks like %>%, which allows you to string together several dplyr 
# commands. We will try both for our data transformation tasks.

# The first commands we will cover are the select() and filter() commands
# select() allows you to select any number of columns from a data frame
# filter() allows you to filter on values within a column in a data frame

# ---------------------------------------------------------------------
# Cleaning Data with Dplyr : Select and Filter
# ---------------------------------------------------------------------

# Standalone commands in 'dplyr' require three parts of information, the 
# the command, the data frame, and the criteria. If we look at our
# BulkRNAseq # data, we might notice that the first column (named X) 
# does not contain useful information. Lets remove this column from 
# our working data frame. 

# Use the select() command to create a new object called BulkRNAseqCleaned 
# containing all columns from our BulkRNAseq table except the X column.

BulkRNAseqCleaned <- select(BulkRNAseq, GeneID, Condition, Replicate, Reads)

# Notice that in the Global Environment, BulkRNAseqCleaned only has 4 
# variables instead of 5. We removed the 'X' variable and kept all the 
# others. When we look at the syntax of the select command, the first
# argument is the data frame from which we are filtering, the next arguments
# are all the columns we selected for the new object. Another way of doing
# this is by using logical operators to write the command more efficiently.

BulkRNAseqCleaned2 <- select(BulkRNAseq, !X)

# In this example, the '!' preceding the variable X indicates the converse
# of X. In other words, everything except for X. 

# We can use the filter() command to pick on specific row characteristics.
# In our RNA seq data set, we have a few characteristics we can pick from.
# In this example, we will create a filter to look at everything in the
# first experimental replicate.

Replicate1 <- filter(BulkRNAseqCleaned, Replicate == 1)

# The filter() standalone command functions similarly to the select() command
# For the first argument you must indicate the data frame (BulkRNAseqCleaned). 
# The next argument indicates the variable, and the value of the variable
# that you want to filter on. In this case, we are looking for values 
# where 'Replicate' is equivalent to 1. 

# For the filter command you must use the double equals "==" because that is
# used as a logical test. The "="  is used as an assignment operator similar to "<-".

# If you are writing standalone commands with dplyr(), you will always 
# indicate the data frame as the first argument, with all the other
# arguments included afterwards.

# ---------------------------------------------------------------------
# Challenge
# ---------------------------------------------------------------------

# Using the RNA seq data, create a filter for the following characteristics
# and save them as an object with a unique name.
# 1. Filter for ESCs
# 2. Filter for Replicate 3 of SNaPs (do this in one step, or two steps)


RNAseq_ESC <- filter(BulkRNAseqCleaned, Condition == "ESCs")

RNAseq_SNaPs <- filter(BulkRNAseqCleaned, Condition == "SNaPs")





# Pro Tip: Keep an eye on the observations and variables as you process 
# through your data. This can help keep track of what is happening to the 
# shape of your data, or if your data cleaning steps are working. Use the 
# View() command to check to see if the filtering step works on your new 
# data frame.

# If things don't look right, don't be afraid to overwrite the object
# you created to make a correction, or create a new object and try again.
# Just be sure to keep your environment clean by removing unnecessary
# objects once you are done.


# ---------------------------------------------------------------------
# Cleaning Data with Dplyr : Using Pipes
# ---------------------------------------------------------------------

# It can be a bit slow and painstaking writing a command for every
# data cleaning step that you need in a particular workflow. To simplify
# data cleaning, you can use pipes %>% to push the output of one
# command into the input of the other. Using the same example of the
# previous section, we can combine the selecting and filtering steps 
# together with pipes to create an object containing only replicate 2 data.

Replicate2 <- BulkRNAseq %>%
  select(!X) %>%
  filter(Replicate == 2)

# Since we are using pipes, the dplyr commands already know what data 
# frame to use as input data, so we can skip the first argument of the
# command. We then only need to include arguments for the selecting or
# filtering steps we are interested in. If we also use a different line
# for each step, we can have clean, relatively easy to read code that
# makes it easier to read and reproduce your analysis.

# Now that we have done some selecting and filtering, we can start to perform
# more sophisticated tasks with our data. Using our BulkRNAseq data let's 
# calculate the average read count for each condition. To do this we can
# introduce some new commands:

# mutate() will allow you to calculate a new column of values based on a 
# previous column's data. This is useful for repetitive calculations.
# group_by() allows R to create levels based on the variables on which you
# group the data. We can use the group_by() and mutate() commands together
# to calculate the average for each group we select. 

MeanCounts <- BulkRNAseq %>%
  group_by(GeneID, Condition) %>%
  mutate(Mean = mean(Reads))

# Using this operation we were able to tell R to group by GeneID and 
# condition, then create a new column called mean where each value is
# the mean of the groups we designated in the previous step. Use View() 
# to look at your new object, what do you notice about the mean column?




# Now that we have calculated the mean for all of our groups, we can remove
# some of the repetitive data. We no longer need the read counts per replicate
# and we don't need gene names and means repeated so many times. The
# distinct() function allows you to select on specific columns, and return
# just the unique values.

MeanCountsDistinct <- BulkRNAseq %>%
  group_by(GeneID, Condition) %>%
  mutate(Mean = mean(Reads)+0.0001) %>%
  distinct(GeneID, Condition, Mean)

# In order to easily calculate the fold change, we should separate the
# conditions into two columns, one for ESCs and another for SNaPs. 
# Use the pivot_wider() command to create columns for each condition. 
# The pivot_wider() command is used to pivot tables by creating multiple 
# columns from values within a starting column. The command wants two arguments here.
# First, the command wants to know where to get the names of the new columns.
# In this case we would sue "names_from =" to identify the column containing 
# new names. Values for the columns will be identified using the "values_from ="
# argument. In this case we want to pull the names from Condition, and values
# from Mean. 

FoldChange <- MeanCountsDistinct %>%
  group_by(GeneID) %>%
  pivot_wider(names_from = Condition, values_from = Mean) %>%
  mutate(FoldChange = log2(SNaPs/ESCs))


# Pro tip: there are a wide variety of built in functions for summarizing data
# below, I list a few of the more useful commands. Look them up in the help 
# section, or online to get more information.

# Center: mean(), median()
# Spread: sd(), IQR()
# Range: min(), max(), quantile()
# Position: first(), last(), nth(), which()
# Count: n(), n_distinct(), length()
# Summarize: summarize(), str()

# =====================================================================
# Introduction to Statistical Testing
# =====================================================================

# As mentioned during lecture 2, statistical testing can help us infer
# more general characteristics about their total population. They can also
# be used to determine how similar or different samples are from each other.
# One of the most common statistical tests used in biomedical research is 
# the T-test. A t-test is a statistical test that uses summary statistics, 
# specifically the mean and standard deviation, to see if one group is
# different from the other. Based on the center and spread of the two different
# groups the test reports a probability that the groups are the same due
# to random chance. 

# The t-test command is written as t.test(). Look at the help documentation
# to find information about its syntax. The t.test() function wants at least 
# two arguments, the first: a vector for the first sample of data, the second: 
# a vector of second sample of data. You can also include if you want
# the test to be one-sided or two-sided depending on your hypothesis.

# We need to arrange our data frame in a wider form in order to run our t-test. 
# Using what we learned about filtering and pivoting tables, we can arrange
# our data frame such that we can compare the ESC condition with the SNaPs
# condition. First we need to filter on a specific gene. In this case, we can
# use "ENSG00000000003" as an example. We will create separate columns by
# pulling variable names from "condition", and populate their values from the
# "Reads" variable. 

SampleGene1 <- BulkRNAseqCleaned %>%
  filter(GeneID =="ENSG00000000003") %>% # filtering on values for that gene
  pivot_wider(names_from = Condition, values_from = Reads)

# Now that our data is in the right format, we can call the columns
# for each condition into the t.test() command. See the example below where
# we use the dataframe$column syntax to call each population

t.test(SampleGene1$SNaPs, SampleGene1$ESCs)

# The t.test() command will automatically calculate all the summary statistics
# necessary to conduct a t-test. That includes the mean, standard deviation, and
# degrees of freedom. It will return the t-value (similar to the Z value in 
# a Z test), and the p-value, or probability that the samples have the same mean
# based on random chance. 

# In this case, our p-value is 0.0159, which you can think of as a 1.59% chance 
# the samples are the same. This is a very low probability and a research paper
# might argue that this is a "significant" difference. 

# Try running a t-test on a different gene like "ENSG00000000457" or "ENSG00000001036"





# ---------------------------------------------------------------------
# Summary
# ---------------------------------------------------------------------

# In this session, we covered some fundamentals of data transformation in 
# data frames. We used the filter(), select(), group_by() and distinct() 
# commands from the 'dplyr' package. We used the mutate() command to perform
# calculations and create new columns of data. We used pivot_wider() from the
# 'tidyr' package to reshape our data and run basic statistical tests. 

# Using these basic methods of data transformation we can begin to more 
# easily shape our data in the forms needed to run the statistical tests
# and data visualization tools that can help us identify patterns in 
# research. We will continue to build on these techniques as we dive into
# next session focused on data visualization using 'ggplot2'.

# ---------------------------------------------------------------------
# Challenge
# ---------------------------------------------------------------------

# Import the world cup matches data set from the previous session.

wcmatches <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-11-29/wcmatches.csv')

# Create a data frame with two columns: the name of the team, and its number
# of wins. Use a filtering step to remove games resulting in a draw. Using
# this data frame, determine which team had the most world cup wins of all
# time, and how many wins they had. Write the code and result. 

MostWins <- wcmatches %>%
  filter(outcome != "D") %>%
  group_by(winning_team) %>%
  mutate(nWins = length(winning_team)) %>%
  distinct(winning_team, nWins) 

# Superstitious Sam thinks the day of the week matters for a "home" team to 
# win a world cup game, regardless of the year, or country that is playing. 
# They challenge you to create a data frame showing the number of home-team
# wins per day of the week, the average score for the home team, and maximum
# score for the home team on games where the home team won. 

BestWinningDay <- wcmatches %>%
  filter(outcome == "H") %>%
  group_by(dayofweek) %>%
  mutate(AvgHomeScore = mean(home_score),
         MaxHomeScore = max(home_score),
         nWins = length(dayofweek)) %>%
  distinct(dayofweek, AvgHomeScore, nWins, MaxHomeScore)


# What day of the week does a winning home team have the highest average score?

# Sunday

# Is the day with the highest average score significantly higher than 
# any other day of the week?
SundayGames <- wcmatches %>%
  filter(outcome == "H") %>%
  filter(dayofweek == "Sunday")

FridayGames <- wcmatches %>%
  filter(outcome == "H") %>%
  filter(dayofweek == "Friday")

t.test(SundayGames$home_score, FridayGames$home_score)
# Friday, with the lowest score, appears to have a significantly lower average
# score compared to Sunday, with the highest score.

# What day of the week does a home team have the highest maximum score?
# Tuesday

# What day of the week does a home team have the most wins?
# Sunday
