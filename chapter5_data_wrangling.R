# Name - Shabbeer Hassan
# Date - 02 Dec 2018
# This is the week 5 work in the IODS course.
# Data source:  http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human1.txt

################################ DATA WRANGLING #################################

# Read Data
dat  <- read.table( "~/Documents/GitHub/IODS-project/data/human.txt", header = T, as.is = T )

# Data description & summary
summary(dat)
glimpse(dat)

# Observations: 195
# Variables: 19
# Rank = HDI Rank of the countries 
# Country
# HDindex = Computed HD index for each country used for ranking
# Life.expectancy =  Life Expectancy of each countries citizens
# Exp.school.years = Expected years of education of citizens living in the country
# Mean.school.yrs = Average years of education of citizens living in the country
# GNIncome = Gross Income of each country
# GNI.minus.Rank = Difference of GNI and HDI Rank
# Rank.y = Computed GI index for each country used for ranking
# GIindex = Gender Inequality index by country
# Mat.Mort.Rate = Maternal mortality rate 
# Adol.Birth.Rate = Adolescent mortality Rate
# Rep.Parliament(%) = Percetange of female representatives in parliament
# FSec.edu = Proportion of females with at least secondary education
# MSec.edu = Proportion of males with at least secondary education
# Flab.Rate = Proportion of females in the labour force
# Mlab.Rate = Proportion of males in the labour force
# Edu.F2M = FSec.edu/MSec.edu
# Lab.F2M = FLab.Rate/MLab.Rate


# 







