library(dplyr)

#Load full dataset
powerConsumption = read.csv('household_power_consumption.txt', sep=';')

trimmedSet = filter(powerConsumption, Date == '1/2/2007' | Date == '2/2/2007')

trimmedSet$DateTime = strptime(paste(as.Date(trimmedSet$Date, "%d/%m/%Y"), trimmedSet$Time), '%Y-%m-%d %H:%M:%S')

#Plot the graph
with(trimmedSet, plot(DateTime, Sub_metering_1, type="l", xlab="", 
                      ylab="Energy sub metering"))
with(trimmedSet, points(DateTime, Sub_metering_2, type="l", col="red"))
with(trimmedSet, points(DateTime, Sub_metering_3, type="l", col="blue"))
legend("topright",text.width = 40000, lwd=1, col=c("black","blue", "red"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Write to image
dev.copy(png, file = "plot3.png")
dev.off()
