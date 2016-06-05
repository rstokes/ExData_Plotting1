library(dplyr)

#Load full dataset
powerConsumption = read.csv('household_power_consumption.txt', sep=';')

trimmedSet = filter(powerConsumption, Date == '1/2/2007' | Date == '2/2/2007')

trimmedSet$DateTime = strptime(paste(as.Date(trimmedSet$Date, "%d/%m/%Y"), trimmedSet$Time), '%Y-%m-%d %H:%M:%S')

#Plot the graph
par(mfrow=c(2, 2), mar=c(4,4,2,1), oma=c(2,2,2,2))
with(trimmedSet, {
  plot(trimmedSet$DateTime, 
       as.numeric(as.character(trimmedSet$Global_active_power)), 
       type="l",
       xlab="",  
       ylab = "Global Active Power")
  plot(trimmedSet$DateTime, 
       as.numeric(as.character(trimmedSet$Voltage)), 
       type = "l", 
       xlab="datetime", 
       ylab="Voltage")
  
  
  with(trimmedSet, plot(DateTime, Sub_metering_1, type="l", xlab="", 
                        ylab="Energy sub metering"))
  with(trimmedSet, points(DateTime, Sub_metering_2, type="l", col="red"))
  with(trimmedSet, points(DateTime, Sub_metering_3, type="l", col="blue"))
  legend("topright",text.width = 80000, lwd=1, col=c("black","blue", "red"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(trimmedSet$DateTime, 
       as.numeric(as.character(trimmedSet$Global_reactive_power)), 
       type = "l", 
       xlab="datetime", 
       ylab="Global_reactive_power")
})

#Write to image
dev.copy(png, file = "plot4.png")
dev.off()