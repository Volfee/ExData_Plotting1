# Plot 2

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



#plot 2
par(mfrow=c(1,1))


plot(y = dt$Global_active_power, x = dt$dateTime , type = "n", xlab = "", ylab  = "Global Active Power (kilowatts)")
lines(y = dt$Global_active_power, x = dt$dateTime)

dev.copy(png, file = "plot2.png", 480, 480)
dev.off()