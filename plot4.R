### plot4.R

## Set working directory
setwd("./04-Exploratory Data Analysis/Wk1-project")

## Load Libraries
library(sqldf)
library(lubridate)

## Read data
txtfile <- "household_power_consumption.txt"
PowerDF <- read.csv.sql(txtfile, sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", sep = ";")
# Close connection
closeAllConnections()

# Replace any missing values with NA
PowerDF[ PowerDF == "?" ] = NA

## Make Plots
# Output plots to png file
png(file = "plot4.png")

# Set up output area
par(mfrow=c(2,2))

# Generate plots on screen
# Plot1
plot(PowerDF$Global_active_power, type='l', xlab="", xaxt="n", ylab="Global Active Power")
axis(1, at=c(0,1441,2880), labels=c("Thu","Fri","Sat"))

# Plot2
plot(PowerDF$Voltage, type='l', xlab="datetime", xaxt="n", ylab="Voltage")
axis(1, at=c(0,1441,2880), labels=c("Thu","Fri","Sat"))

# Plot3
plot(PowerDF$Sub_metering_1, type='l', xlab="", xaxt="n", ylab="Energy Sub metering")
lines(PowerDF$Sub_metering_2, col="red")
lines(PowerDF$Sub_metering_3, col="blue")
axis(1, at=c(0,1441,2880), labels=c("Thu","Fri","Sat"))
legend("topright", col = c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=c(1,1,1), cex = 0.7, bty = "n")

# Plot4
plot(PowerDF$Global_reactive_power, type='l', xlab="datetime", xaxt="n", ylab="Global_reactive_power")
axis(1, at=c(0,1441,2880), labels=c("Thu","Fri","Sat"))

# Close device
dev.off()
