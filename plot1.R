## This script creates plot1.png for Exploratory data Analysis

## Read the data in using read.table
powerData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                        as.is = c(1, 2), na.strings = "?")

## Get the row indices corresponsing to the dates 2007-02-01 and 2007-02-02
selInd1 <- powerData$Date == "1/2/2007"
selInd2 <- powerData$Date == "2/2/2007"

## subset powerData to only the selected dates
powerData <- powerData[selInd1|selInd2,]

## convert the date string to R date format
powerData$Date <- strptime(powerData$Date, "%d/%m/%Y")

## open the png file for plotting
png(filename = "plot1.png", width = 480, height = 480)

## Create the required histogram
hist(powerData$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", col = "red")

## shut off the plot device

dev.off()