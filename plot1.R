### plot1.R

## Set working directory
setwd("./04-Exploratory Data Analysis/Wk1-project")

## Load Libraries
library(sqldf)

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
hist(PowerDF$Global_active_power, col = "red",main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
title(main = "Global Active Power")

## Output plot to file
dev.copy(png, file = "plot1.png", height = 480, width = 480) 
# Close device
dev.off()



