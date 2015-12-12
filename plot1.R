# PLOT 1

data <- "./data/household_power_consumption.txt"
dataFrame <- read.table(data, header=T, sep=";", stringsAsFactors=F)
myData1 <- subset(dataFrame, Date %in% c("1/2/2007", "2/2/2007"))

png("plot1.png", width=480, height=480, bg = "white")
hist(as.numeric(myData1$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()
