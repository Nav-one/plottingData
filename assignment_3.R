rm(list=ls()) # clear the environment
setwd(dirname(rstudioapi::getSourceEditorContext()$path))

#-------Import necessary packages here-------------------#
library(tidyverse) 

#------ Uploading PERMID --------------------------------#
PERMID <- "xxxxxxx" #Type your PERMID with the quotation marks
PERMID <- as.numeric(gsub("\\D", "", PERMID)) #Don't touch
set.seed(PERMID) #Don't touch

#------- Answers ----------------------------------------#
#Problem 1

# importing data and saving it under a new name
californiaHispanicData <- read_csv("californiaHispanicData.csv")

# reporting county names
County <- californiaHispanicData$county

# creating variables to give total surveyed in 2011 and 2021
totalSum2011 <- sum(californiaHispanicData[2:6], na.rm = T)
totalSum2021 <- sum(californiaHispanicData[7:11], na.rm = T)

# creating a vector to give percentage surveyed in 2011 and 2021 for each group
ethnicPercentages2011 <- c(sum(californiaHispanicData$Not.Hispanic_2011,  na.rm = T)/totalSum2011,
                           sum(californiaHispanicData$Mexican_2011,  na.rm = T)/totalSum2011,
                           sum(californiaHispanicData$Puerto.Rican_2011,  na.rm = T)/totalSum2011,
                           sum(californiaHispanicData$Cuban_2011,  na.rm = T)/totalSum2011,
                           sum(californiaHispanicData$Other.Hispanic_2011,  na.rm = T)/totalSum2011)*100 

ethnicPercentages2021 <- c(sum(californiaHispanicData$Not.Hispanic_2021,  na.rm = T)/totalSum2021,
                           sum(californiaHispanicData$Mexican_2021,  na.rm = T)/totalSum2021,
                           sum(californiaHispanicData$Puerto.Rican_2021,  na.rm = T)/totalSum2021,
                           sum(californiaHispanicData$Cuban_2021,  na.rm = T)/totalSum2021,
                           sum(californiaHispanicData$Other.Hispanic_2021,  na.rm = T)/totalSum2021)*100 


plot2011 <- barplot(ethnicPercentages2011, ylab = "Percentages (%)", 
                    names.arg = c("Not Hispanic", "Mexican", "Puerto Rican", "Cuban", "Other Hispanic"))
plot2021 <- barplot(ethnicPercentages2021, ylab = "Percentages (%)", 
                    names.arg = c("Not Hispanic", "Mexican", "Puerto Rican", "Cuban", "Other Hispanic"))

