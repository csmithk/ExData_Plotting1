hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

hpc$Date <- as.character(hpc$Date)

hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
hpc$Global_active_power <- as.character(hpc$Global_active_power)
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)

lowerDate <- as.Date("2007-01-31")
upperDate <- as.Date("2007-02-03")

myData <- subset(hpc, hpc$Date > lowerDate& hpc$Date < upperDate, na.rm = T)

png (filename = "plot1.png", width = 480, height = 480)
hist(myData$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power", xaxt = "n")
axis(1, at=seq(0, 6, by = 2))
dev.off()

