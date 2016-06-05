library(dplyr)

#Load full dataset
powerConsumption = read.csv('household_power_consumption.txt', sep=';')

trimmedSet = filter(powerConsumption, Date == '1/2/2007' | Date == '2/2/2007')

trimmedSet$DateTime = strptime(paste(as.Date(trimmedSet$Date, "%d/%m/%Y"), trimmedSet$Time), '%Y-%m-%d %H:%M:%S')

#Plot the graph
with(trimmedSet, hist(as.numeric(as.character(trimmedSet$Global_active_power)), 
     freq=TRUE, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)",  
     ylab = "Frequency"))
#Write to image
dev.copy(png, file = "plot1.png")
dev.off()
