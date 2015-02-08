# Plots 4

data <- read.table(file = "household_power_consumption.txt", 
                   sep = ";", header = T, dec = ".", na.strings = "?",
                   colClasses = c("character", "character", rep("numeric", 7)))
dateTime <- paste(data$Date, " ", data$Time, sep = "")
data <- cbind(data, dateTime)
data$dateTime <- strptime(data$dateTime, format = "%d/%m/%Y %H:%M:%S")
dataSub <- data[data$Date == "1/2/2007" |  data$Date == "2/2/2007",]

require(dplyr)
require(lubridate)
dt <- tbl_df(dataSub)


#Plots :
par(mfrow=c(2,2))


# 1
plot(y = dt$Global_active_power, x = dt$dateTime , type = "n", xlab = "", ylab  = "Global Active Power (kilowatts)")
lines(y = dt$Global_active_power, x = dt$dateTime)


#2
plot(y = dt$Voltage, x = dt$dateTime , type = "n", xlab = "datetime", ylab  = "Voltage")
lines(y = dt$Voltage, x = dt$dateTime)


#3
plot(y = dt$Sub_metering_1, x = dt$dateTime , type = "n", xlab = "", ylab  = "Energy sub metering")
lines(y = dt$Sub_metering_1, x = dt$dateTime)
lines(y = dt$Sub_metering_2, x = dt$dateTime, col = "red")
lines(y = dt$Sub_metering_3, x = dt$dateTime, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty = 1, col = c("black", "red", "blue"), bty = "n", cex = 0.4)

#4
plot(y = dt$Global_reactive_power, x = dt$dateTime , type = "n", xlab = "datetime")
lines(y = dt$Global_reactive_power, x = dt$dateTime)

dev.copy(png, file = "plot4.png")
dev.off()
