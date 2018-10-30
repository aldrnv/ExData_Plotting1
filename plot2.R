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
        mutate(Date = as.POSIXct(dmy_hms(as.character(paste(Date, Time)))), Global_active_power = as.numeric(as.character(Global_active_power))) %>% 
        select(Date,Global_active_power)
View(globalAP)
str(globalAP)

# plot
with(globalAP, plot(Date, Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))
