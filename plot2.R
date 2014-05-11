myFile <- "household_power_consumption.txt"

library(sqldf)
mySQL <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myData <- read.csv.sql(myFile, mySQL, sep = ";")

dates <- myData$Date
times <- myData$Time
date_time <- paste(dates, times)
x <- strptime(date_time, format = "%d/%m/%Y %H:%M:%S")

ylab <- "Global Active Power (kilowatts)"

png("plot2.png", width=480, height=480)
plot(x, myData$Global_active_power, type = "l", 
     xlab = " ", ylab = ylab)
dev.off()
