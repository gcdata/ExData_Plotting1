### plot3.R 

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

## Make Plot
# Set up output area
par(mfrow=c(1,1))

# Generate plot on screen
plot(PowerDF$Sub_metering_1, type='l', xlab="", xaxt="n", ylab="Energy Sub metering")
lines(PowerDF$Sub_metering_2, col="red")
lines(PowerDF$Sub_metering_3, col="blue")
axis(1, at=c(0,1441,2880), labels=c("Thu","Fri","Sat"))
legend("topright", col = c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=c(1,1,1), cex=0.75) 

## Output plot to file
dev.copy(png, file = "plot3.png", height = 480, width = 480) 
# Close device
dev.off()



