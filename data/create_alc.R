# AUTHOR - Shabbeer Hassan
# Date - 18/11/2018 
# Logistic Regression chapter in IODS course

# Libraries ---------------------------------------------------------
library("readxl")
library("ggplot2")
library("data.table")
library("dplyr")
library("stringr")
library("tidyr")

# Reading datasets ---------------------------------------------------------

por  <- read.csv("~/Documents/GitHub/IODS-project/data/student-por.csv", sep=";")
mat  <- read.csv("~/Documents/GitHub/IODS-project/data/student-mat.csv", sep=";")

# Exploring datasets ---------------------------------------------------------
glimpse(por)
glimpse(mat)

# Join the two data sets ---------------------------------------------------------
join_by <- c("school", "sex", "age", "address", "famsize", "Pstatus", "Medu", "Fedu",
              "Mjob", "Fjob", "reason", "nursery","internet")

# Join two datasets by selected identifiers ---------------------------------------------------------
mat_por <- inner_join(mat, por, by = join_by, 
                       suffix = c(".mat", ".por"))
glimpse(mat_por)

# Get new column by taking duplicated answers out  --------------------------------------------
# create a new data frame with only the joined columns
alc <- select(mat_por, one_of(join_by))

# the columns in the datasets which were not used for joining the data
notjoined_columns <- colnames(mat)[!colnames(mat) %in% join_by]

# For every column name not used for joining...
for(column_name in notjoined_columns) {
  two_columns <- select(mat_por, starts_with(column_name))
  first_column <- select(two_columns, 1)[[1]]
       if(is.numeric(first_column)) {
            alc[column_name] <- round(rowMeans(two_columns))
        } else {
  alc[column_name] <- first_column
  }
}
glimpse(alc)

# Define a new column alc_use by combining weekday and weekend alcohol use
alc <- mutate(alc, alc_use = (Dalc + Walc) / 2)

# Define a new logical column 'high_use'
alc <- mutate(alc, high_use = alc_use > 2)
glimpse(alc)

# Write Dataset
write.csv(alc, "~/Documents/GitHub/IODS-project/data/alc.csv", 
          row.names = FALSE) 


