# Name - Shabbeer Hassan
# Date - 11 Nov 2018
# This is the week 2 work in the IODS course.

##### Read Data #####
data1 <- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt", 
                    sep="\t", header=TRUE)
# Output from above
# str(data1)
# The output from above is the total number of observations (183 obs) 
# and  total variables (n = 60)
# dim(data1)
# [1] 183  60
# The above tells us that data1 has 183 rows and 60 columns

##### Create an analysis dataset #####
library(dplyr)

# Creating column 'attitude' by scaling the column "Attitude"
data1$attitude <- data1$Attitude / 10

# Questions related to deep, surface and strategic learning
deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")
surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")
# Select the columns related to deep learning and create column 'deep' by averaging
deep_columns <- select(data1, one_of(deep_questions))
data1$deep <- rowMeans(deep_columns)

# Select the columns related to surface learning and create column 'surf' by averaging
surface_columns <- select(data1, one_of(surface_questions))
data1$surf <- rowMeans(surface_columns)
# Select the columns related to strategic learning and create column 'stra' by averaging
strategic_columns <- select(data1, one_of(strategic_questions))
data1$stra <- rowMeans(strategic_columns)

# Choose the listed variables to keep
keep_columns <- c("gender", "Age", "Attitude", "deep", "stra", "surf", "Points")
# Select the 'keep_columns' to create analysis dataset
analysis <- select(data1, one_of(keep_columns))
# Change column names
colnames(analysis)[c(2, 3, 7)] <- c("age", "attitude", "points")


# Scale all combination variables to the original scales (by taking the mean). 
# Exclude observations where the exam points variable is zero. 
analysis$deep <- analysis$deep/mean(analysis$deep)
analysis$surf <- analysis$surf/mean(analysis$surf)
analysis$stra <- analysis$deep/mean(analysis$stra)
analysis <- filter(analysis, points > 0)

# Set working directory
setwd("~/Documents/GitHub/IODS-project")
getwd()
write.csv(analysis, "~/Documents/GitHub/IODS-project/data/learning2014.csv", 
          row.names = FALSE) 
# Read the file above
read_data <- read.csv("~/Documents/GitHub/IODS-project/data/learning2014.csv")
