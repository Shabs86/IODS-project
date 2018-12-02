# Name - Shabbeer Hassan
# Date - 25 Nov 2018
# This is the week 4 work in the IODS course.

################################ DATA WRANGLING #################################
# Read Data
hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv",
               stringsAsFactors = F)
gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv",
                stringsAsFactors = F, na.strings = "..")


# Data description & summary
str(hd)
summary(hd)

str(gii)
summary(gii)

# Variable renaming for both datasets
colnames(hd) <- c("Rank" , "Country", "HDindex" , "Life.expectancy", "Exp.school.years", 
                   "Mean.school.yrs", "GNIncome", "GNI.minus.Rank")

colnames(gii) <- c("Rank" , "Country", "GIindex" , "Mat.Mort.Rate", "Adol.Birth.Rate", 
                  "Rep.Parliament(%)", "FSec.edu", "MSec.edu",
                  "FLab.Rate", "MLab.Rate")

# Mutate the “Gender inequality” data and create two new variables.
gii <- gii %>% mutate(Edu.F2M = FSec.edu/MSec.edu, 
                      Lab.F2M = FLab.Rate/MLab.Rate)

# Join together the two datasets using the variable Country as the identifier. 
human <- inner_join(hd, gii, by = "Country")

# Set working directory & save file
setwd("~/Documents/GitHub/IODS-project")
getwd()
write.table(human, "~/Documents/GitHub/IODS-project/data/human.txt", 
            sep = "\t", row.names = FALSE) 


