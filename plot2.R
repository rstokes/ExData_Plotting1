library(dplyr)

#Load full dataset
powerConsumption = read.csv('household_power_consumption.txt', sep=';')

trimmedSet = filter(powerConsumption, Date == '1/2/2007' | Date == '2/2/2007')

trimmedSet$DateTime = strptime(paste(as.Date(trimmedSet$Date, "%d/%m/%Y"), trimmedSet$Time), '%Y-%m-%d %H:%M:%S')

#Plot the graph
with(trimmedSet, plot(DateTime, 
     as.numeric(as.character(Global_active_power)), 
     type = "l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)"))

#Write to image
dev.copy(png, file = "plot2.png")
dev.off()

