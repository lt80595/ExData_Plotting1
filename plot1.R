myFile <- "household_power_consumption.txt"

library(sqldf)
mySQL <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myData <- read.csv.sql(myFile, mySQL, sep = ";")

xlab <- "Global Active Power (kilowatts)"
main <- "Global Active Power"

png("plot1.png", width=480, height=480)
hist(myData$Global_active_power, main = main, xlab = xlab, 
     col = "red")
dev.off()
