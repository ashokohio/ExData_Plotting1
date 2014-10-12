## This script creates plot2.png for Exploratory Data Analysis

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
png(filename = "plot2.png", width = 480, height = 480)
 
## Create the required plot with the tiles and labels
plot(powerData$Date, powerData$Global_active_power, xlab = "", type = "l",
     ylab = "Global Active Power (kilowatts)")


## shut off the plot device
dev.off()