fulldata <-read.table( "household_power_consumption.txt", header = TRUE, sep = ";", 
                       na.strings = "?",  colClasses = "character", stringsAsFactors = FALSE )
data <- subset(fulldata, ((fulldata[["Date"]] == "1/2/2007") | (fulldata[["Date"]] == "2/2/2007")) )
data[["Sub_metering_1"]] <- as.numeric(data[["Sub_metering_1"]])
data[["Sub_metering_2"]] <- as.numeric(data[["Sub_metering_2"]])
data[["Sub_metering_3"]] <- as.numeric(data[["Sub_metering_3"]])
data[["Time"]] <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

png("ExData_Plotting1/plot3.png")
Sys.setlocale("LC_ALL","English")
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
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()