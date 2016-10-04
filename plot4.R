fulldata <-read.table( "household_power_consumption.txt", header = TRUE, sep = ";", 
                       na.strings = "?",  colClasses = "character", stringsAsFactors = FALSE )
data <- subset(fulldata, ((fulldata[["Date"]] == "1/2/2007") | (fulldata[["Date"]] == "2/2/2007")) )
data[["Time"]] <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data[["Global_active_power"]] <- as.numeric(data[["Global_active_power"]])
data[["Voltage"]] <- as.numeric(data[["Voltage"]])
data[["Global_reactive_power"]] <- as.numeric(data[["Global_reactive_power"]])
data[["Sub_metering_1"]] <- as.numeric(data[["Sub_metering_1"]])
data[["Sub_metering_2"]] <- as.numeric(data[["Sub_metering_2"]])
data[["Sub_metering_3"]] <- as.numeric(data[["Sub_metering_3"]])

png("ExData_Plotting1/plot4.png")
Sys.setlocale("LC_ALL","English")
par(mfcol = c(2, 2))
##1
plot( data$Time, data$Global_active_power, 
      type = "l",
      ylab = "Global Active Power", 
      xlab = ""
)
##2
plot( data$Time, data$Sub_metering_1, 
      type = "l",
      ylab = "Energy sub metering", 
      xlab = ""
)
lines(data$Time, data$Sub_metering_2,
      col = "red")
lines(data$Time, data$Sub_metering_3,
      col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1, 
       bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
##3
plot( data$Time, data$Voltage, 
      type = "l",
      ylab = "Voltage", 
      xlab = "datetime"
)
##4
plot( data$Time, data$Global_reactive_power, 
      type = "l",
      ylab = "Global_reactive_power", 
      xlab = "datetime"
)

dev.off()