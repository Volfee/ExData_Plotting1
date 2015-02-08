# Plot 3

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

#plot 3
par(mfrow=c(1,1))

plot(y = dt$Sub_metering_1, x = dt$dateTime , type = "n", xlab = "", ylab  = "Energy sub metering")
lines(y = dt$Sub_metering_1, x = dt$dateTime)
lines(y = dt$Sub_metering_2, x = dt$dateTime, col = "red")
lines(y = dt$Sub_metering_3, x = dt$dateTime, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, col = c("black", "red", "blue"), cex = 0.5)

dev.copy(png, file = "plot3.png")
dev.off()