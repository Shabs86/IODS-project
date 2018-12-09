# Name - Shabbeer Hassan
# Date - 09 Dec 2018
# This is the week 6 work in the IODS course.
# Data source 1: https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/BPRS.txt 
# Data source 2: https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/rats.txt

################################ DATA WRANGLING #################################

# Read Data
BPRS  <- read.table( "https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/BPRS.txt",
                   header = T, as.is = T, stringsAsFactors = F)
RATS  <- read.table( "https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/rats.txt",
                   header = T, as.is = T, stringsAsFactors = F)

# Data description & summary
glimpse(BPRS) ## BPRS contains 1 treatment variable, 1 subject variable and weeks 0 to 8 data.
glimpse(RATS) ## RATS contains IDs of rats with various groups it belongs to and measurements at different weeks.

summary(BPRS)
summary(RATS)

# Convert some variables to factors 
BPRS$treatment <- factor(BPRS$treatment)
BPRS$subject <- factor(BPRS$subject)
RATS$ID <- as.factor(RATS$ID)
RATS$Group <- factor(RATS$Group)

# Convert the datasets to long form 
BPRSL <-  BPRS %>% gather(key = weeks, value = bprs, -treatment, -subject)
# Extract the week number
BPRSL <-  BPRSL %>% mutate(week = as.integer(substr(weeks,5,5)))

RATSL <- RATS %>%
  gather(key = WD, value = Weight, -ID, -Group) %>%
  mutate(Time = as.integer(substr(WD,3,4)))

# Set working directory & save file
setwd("~/Documents/GitHub/IODS-project")
getwd()
write.csv(BPRSL,"data/BPRSL.csv", row.names=FALSE)
write.csv(RATSL,"data/RATSL.csv", row.names=FALSE)
write.csv(BPRS,"data/BPRS.csv", row.names=FALSE)