fulldata <-read.table( "household_power_consumption.txt", header = TRUE, sep = ";", 
                       na.strings = "?",  colClasses = "character", stringsAsFactors = FALSE )
data <- subset(fulldata, ((fulldata[["Date"]] == "1/2/2007") | (fulldata[["Date"]] == "2/2/2007")) )
data[["Global_active_power"]] <- as.numeric(data[["Global_active_power"]])
data[["Time"]] <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

png("ExData_Plotting1/plot2.png")
Sys.setlocale("LC_ALL","English")
plot( data$Time, data$Global_active_power, 
      type = "l",
      ylab = "Global Active Power (kilowatts)", 
      xlab = ""
)
dev.off()