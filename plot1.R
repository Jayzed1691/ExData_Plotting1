library(data.table)
library(dplyr)

power <- fread("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
subpower <- power[Date == "1/2/2007" | Date == "2/2/2007"]
subpower$DateTime <- as.POSIXct(strptime(paste(subpower$Date, subpower$Time), format="%d/%m/%Y %H:%M:%S"))

## Plot 1
png(file = "plot1.png", width = 480, height = 480)
par(mfrow = c(1, 1))
hist(subpower$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()