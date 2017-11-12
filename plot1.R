library(data.table)
library(lattice)
library(ggplot2)
power_full <- fread("~/4 - Data Analysis/household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?",stringsAsFactors = FALSE)
power <-rbind(power_full[power_full$Date=="1/2/2007",],power_full[power_full$Date=="2/2/2007",])
power$Date <- as.Date(power$Date,"%d/%m/%Y")
power$DateTime <- as.POSIXct(paste(power$Date, power$Time), format="%Y-%m-%d %H:%M:%S")
par(mfrow = c(1,1))
par(mar=c(4,7,2,1)) 
#plot1
plot1 <- hist(as.numeric(power$Global_active_power), col="Red", main="Global Active Power", xlab="Global Active power (kilowatts)", ylab="Frequency")

#dev.off()