library(data.table)
library(dplyr)

power <- fread("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
subpower <- power[Date == "1/2/2007" | Date == "2/2/2007"]
subpower$DateTime <- as.POSIXct(strptime(paste(subpower$Date, subpower$Time), format="%d/%m/%Y %H:%M:%S"))

## Plot 3
png(file = "plot3.png", width = 480, height = 480)
par(mfrow = c(1, 1))
with(subpower, plot(DateTime, Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab = ""))
lines(subpower$DateTime, subpower$Sub_metering_2, type = "l", col = "red")
lines(subpower$DateTime, subpower$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = c(1,1,1), col = c("black", "Red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()