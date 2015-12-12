# PLOT 3

data <- "./data/household_power_consumption.txt"
dataFrame <- read.table(data, header=T, sep=";", stringsAsFactors=F)
myData3 <- subset(dataFrame, Date %in% c("1/2/2007", "2/2/2007"))
day <- strptime(paste(myData3$Date, myData3$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot3.png", width=480, height=480, bg = "white")
Sys.setlocale(category= "LC_TIME", "English")

with(myData3, {
  plot(day, as.numeric(Sub_metering_1), xlab="", ylab="Energy sub metering", type="l")
  points(day, as.numeric(Sub_metering_2), type="l", col="red")
  points(day, as.numeric(Sub_metering_3), type="l", col="blue")
  }
  )
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

dev.off()