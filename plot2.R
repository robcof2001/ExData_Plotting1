# PLOT 2

data <- "./data/household_power_consumption.txt"
dataFrame <- read.table(data, header=T, sep=";", stringsAsFactors=F)
myData2 <- subset(dataFrame, Date %in% c("1/2/2007", "2/2/2007"))
day <- strptime(paste(myData2$Date, myData2$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot2.png", width=480, height=480, bg = "white")
Sys.setlocale(category= "LC_TIME", "English")
plot(day, as.numeric(myData2$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()