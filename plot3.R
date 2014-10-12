## This script creates plot3.png for Exploratory Data Analysis

## Read the data in using read.table
powerData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                        as.is = c(1, 2), na.strings = "?")

## Get the row indices corresponsing to the dates 2007-02-01 and 2007-02-02
selInd1 <- powerData$Date == "1/2/2007"
selInd2 <- powerData$Date == "2/2/2007"

## subset powerData to only the selected dates
powerData <- powerData[selInd1|selInd2,]

## convert Date and Time to posix time and put back in date
temp <- paste(powerData$Date, powerData$Time, sep = " ")
powerData$Date <- strptime(temp, format = "%d/%m/%Y %H:%M:%S")

## open the png file for plotting
png(filename = "plot3.png", width = 480, height = 480)
 
## Create the required plot with the tiles and labels
plot(powerData$Date, powerData$Sub_metering_1, xlab = "", type = "l", col = "black",
     ylab = "Energy sub metering")
lines(powerData$Date, powerData$Sub_metering_2, xlab = "", type = "l", col = "red")
lines(powerData$Date, powerData$Sub_metering_3, xlab = "", type = "l", col = "blue")

## Add the legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = c(1, 1, 1))
## shut off the plot device
dev.off()