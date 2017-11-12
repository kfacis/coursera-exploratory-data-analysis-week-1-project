library(data.table)
library(lattice)
library(ggplot2)
power_full <- fread("~/4 - Data Analysis/household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?",stringsAsFactors = FALSE)
power <-rbind(power_full[power_full$Date=="1/2/2007",],power_full[power_full$Date=="2/2/2007",])
power$Date <- as.Date(power$Date,"%d/%m/%Y")
power$DateTime <- as.POSIXct(paste(power$Date, power$Time), format="%Y-%m-%d %H:%M:%S")

#plot4 
#png(filename = "plot4.png")
par(mfrow = c(2,2))
par(mar = c(1,1,1,1))
#4.1
plot(power$Global_active_power ~ power$DateTime, type = "l")
#4.2
plot(power$Voltage ~ power$DateTime, type = "l")

#4.3
plot(power$Sub_metering_1~power$DateTime, type = "l")
lines(power$Sub_metering_2~power$DateTime, col = "red")
lines(power$Sub_metering_3~power$DateTime, col = "blue")
#4.4
plot(power$Global_reactive_power~power$DateTime, type = "l")
#dev.off()
