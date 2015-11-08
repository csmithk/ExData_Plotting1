hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

hpc$Date <- as.character(hpc$Date)

hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
hpc$Global_active_power <- as.character(hpc$Global_active_power)
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)

lowerDate <- as.Date("2007-01-31")
upperDate <- as.Date("2007-02-03")

myData <- subset(hpc, data$Date > lowerDate& data$Date < upperDate, na.rm = T)

#build out the date/time column

myData$Time <- as.character(myData$Time)
myData$Date <- paste(myData$Date, myData$Time)
myData$Date.fmt <- "%Y-%m-%d %H:%M:%S"
myData$Date <-as.POSIXct(myData$Date, format = myData$Date.fmt, tz = "UTC")

png (filename = "plot2.png", width = 480, height = 480)
plot(myData$Date, myData$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
axis(1, at=1:length(myData$Date), labels = format(myData$Date, "%a"))
dev.off()

