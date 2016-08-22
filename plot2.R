### plot2.R

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
plot(PowerDF$Global_active_power, type='l', xlab="", xaxt="n", ylab="Global Active Power (kilowatts)")
axis(1, at=c(0,1441,2880), labels=c("Thu","Fri","Sat"))

## Output plot to file
dev.copy(png, file = "plot2.png", height = 480, width = 480) 
# Close device
dev.off()



