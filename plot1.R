fulldata <-read.table( "household_power_consumption.txt", header = TRUE, sep = ";", 
                  na.strings = "?",  colClasses = "character", stringsAsFactors = FALSE )
data <- subset(fulldata, ((fulldata[["Date"]] == "1/2/2007") | (fulldata[["Date"]] == "2/2/2007")) )
data[["Global_active_power"]] <- as.numeric(data[["Global_active_power"]])

png("ExData_Plotting1/plot1.png")
hist( data[["Global_active_power"]], col = "red", 
      main = "Global Active Power", 
      xlab = "Global Active Power (kilowatts)" 
)
dev.off()