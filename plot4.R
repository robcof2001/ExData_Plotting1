# PLOT 4

data <- "./data/household_power_consumption.txt"
dataFrame <- read.table(data, header=T, sep=";", stringsAsFactors=F)
myData4 <- subset(dataFrame, Date %in% c("1/2/2007", "2/2/2007"))
day <- strptime(paste(myData4$Date, myData4$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot4.png", width=480, height=480, bg = "white")
Sys.setlocale(category= "LC_TIME", "English")
par(mfrow = c(2, 2))

## Graph 1
plot(day, as.numeric(myData4$Global_active_power), type="l", xlab="", ylab="Global Active Power")

## Graph 2
plot(day, as.numeric(myData4$Voltage), type="l", xlab="datetime", ylab="Voltage")

## Graph 3
with(myData4, {
  plot(day, as.numeric(Sub_metering_1), xlab="", ylab="Energy sub metering", type="l")
  points(day, as.numeric(Sub_metering_2), type="l", col="red")
  points(day, as.numeric(Sub_metering_3), type="l", col="blue")
}
)
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", lty=1, col=c("black", "red", "blue"))

## Graph 4
plot(day, as.numeric(myData4$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
