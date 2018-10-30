# Aldreen Venzon
# Oct 30, 2018
# Course 4: Exploratory Data Analysis

#libraries
library(dplyr)
library(lubridate)

#input
house_power <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
View(house_power)

# subset
power07 <- subset(house_power, house_power$Date=="1/2/2007" | house_power$Date =="2/2/2007")
View(power07)

# numeric to plot
globalAP  <- power07  %>% 
        select(Global_active_power) %>% 
        mutate(Global_active_power = as.numeric(as.character(Global_active_power)))
View(globalAP)
str(globalAP)

# histogram
hist(globalAP$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
