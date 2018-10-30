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
        mutate(Date = as.POSIXct(dmy_hms(as.character(paste(Date, Time)))),
               Global_active_power = as.numeric(as.character(Global_active_power)),
               Global_reactive_power = as.numeric(as.character(Global_reactive_power)),
               Voltage = as.numeric(as.character(Voltage)),
               Sub_metering_1 = as.numeric(as.character(Sub_metering_1)),
               Sub_metering_2 = as.numeric(as.character(Sub_metering_2)),
               Sub_metering_3 = as.numeric(as.character(Sub_metering_3)))
View(globalAP)
str(globalAP)

# plot
par(mfrow = c(2, 2))

with(globalAP, plot(Date, Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))
with(globalAP, plot(Date, Voltage, type="l", xlab = "datetime", ylab = "Voltage"))
with(globalAP, plot(Date, Sub_metering_1, type="n", xlab = "", ylab = "Energy Sub Metering"))
with(globalAP, points(Date, Sub_metering_1, col="black", type="l"))
with(globalAP, points(Date, Sub_metering_2, col="red", type="l"))
with(globalAP, points(Date, Sub_metering_3, col="blue", type="l"))
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))
with(globalAP, plot(Date, Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power"))
