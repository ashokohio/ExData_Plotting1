## This script creates plot4.png for Exploratory Data Analysis

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
png(filename = "plot4.png", width = 480, height = 480)

## Set up for 4 sublots distributed as 2 X 2
par(mfrow = c(2,2))
## Create the first row of plots
with(powerData, {
  plot(Date, Global_active_power, xlab = "", ylab = "Global active power", type = "l")
  plot(Date, Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
  ## Create the second row of plots
  plot(Date, Sub_metering_1, xlab = "", type = "l", col = "black",
     ylab = "Energy sub metering")
  lines(Date, Sub_metering_2, xlab = "", type = "l", col = "red")
  lines(Date, Sub_metering_3, xlab = "", type = "l", col = "blue")
  ## Add the legend
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = c(1, 1, 1))
  plot(Date, Global_reactive_power, xlab = "datetime", type = "l")
})


## shut off the plot device
dev.off()