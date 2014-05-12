#Load Data
myFile <- "household_power_consumption.txt"

library(sqldf)
mySQL <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myData <- read.csv.sql(myFile, mySQL, sep = ";")


#Plots
png("plot4.png", width=480, height=480)
par(mfcol= c(2,2))


#Top Left
dates <- myData$Date
times <- myData$Time
date_time <- paste(dates, times)
x <- strptime(date_time, format = "%d/%m/%Y %H:%M:%S")
ylab1 <- "Global Active Power (kilowatts)"

plot(x, myData$Global_active_power, type = "l", 
     xlab = "", ylab = ylab1)


#Bottom Left
m1 <- myData$Sub_metering_1
m2 <- myData$Sub_metering_2
m3 <- myData$Sub_metering_3
ylab2 <- "Energy sub metering"

plot(x, m1, type = "l", col = "black", xlab = "", ylab = ylab2)
lines(x, m2, col = "red")
lines(x, m3, col = "blue")
legend("topright", col= c("black", "red", "blue"), lty=1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


#Top Right
xlab3 <- "datetime"
ylab3 <- "Voltage"

plot(x, myData$Voltage, type = "l", xlab = xlab3,
     ylab = ylab3)

#Bottom Right
xlab4 <- "datetime"
ylab4 <- "Global_reactive_power"

plot(x, myData$Global_reactive_power, type = "l",
     xlab = xlab4, ylab = ylab4)

dev.off()