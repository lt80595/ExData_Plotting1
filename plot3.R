myFile <- "household_power_consumption.txt"

library(sqldf)
mySQL <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myData <- read.csv.sql(myFile, mySQL, sep = ";")

dates <- myData$Date
times <- myData$Time
date_time <- paste(dates, times)
x <- strptime(date_time, format = "%d/%m/%Y %H:%M:%S")
m1 <- myData$Sub_metering_1
m2 <- myData$Sub_metering_2
m3 <- myData$Sub_metering_3

ylab <- "Energy sub metering"

png("plot3.png", width=480, height=480)
plot(x, m1, type = "l", col = "black", xlab = " ", ylab = ylab)
lines(x, m2, col = "red")
lines(x, m3, col = "blue")
legend("topright", col= c("black", "red", "blue"), lty=1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
