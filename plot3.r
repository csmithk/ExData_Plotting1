hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

hpc$Date <- as.character(hpc$Date)

hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
hpc$Global_active_power <- as.character(hpc$Global_active_power)
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)

lowerDate <- as.Date("2007-01-31")
upperDate <- as.Date("2007-02-03")

myData <- subset(hpc, hpc$Date > lowerDate& hpc$Date < upperDate, na.rm = T)

#build out the date/time column
myData$Time <- as.character(myData$Time)
myData$Date <- paste(myData$Date, myData$Time)
myData$Date.fmt <- "%Y-%m-%d %H:%M:%S"
myData$Date <-as.POSIXct(myData$Date, format = myData$Date.fmt, tz = "UTC")

#convert factors to characters and then to numeric
myData$Sub_metering_1 <- as.character(myData$Sub_metering_1)
myData$Sub_metering_1 <- as.numeric(myData$Sub_metering_1)

myData$Sub_metering_2 <- as.character(myData$Sub_metering_2)
myData$Sub_metering_2 <- as.numeric(myData$Sub_metering_2)

myData$Sub_metering_3 <- as.character(myData$Sub_metering_3)
myData$Sub_metering_3 <- as.numeric(myData$Sub_metering_3)

#plot the values
png (filename = "plot3.png", width = 480, height = 480)
plot(myData$Date, myData$Sub_metering_1, xlab = "", type="l", ylab = "Energy sub metering", col = "black")
lines(myData$Date, myData$Sub_metering_2, col = "red", type="l")
lines(myData$Date, myData$Sub_metering_3, col = "blue")
axis(1, at=1:length(myData$Date), labels = format(myData$Date, "%a"))

#legend
legend("topright", lty = c(1,1,1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col= c("black", "red", "blue"), bty = "n")
dev.off()

