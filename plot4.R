plot4 <- function() {
  dt <- fread("household_power_consumption.txt")
  dt2 <- subset(dt, as.Date(strptime(Date, "%d/%m/%Y")) == as.Date("2007-02-01") | as.Date(strptime(Date, "%d/%m/%Y")) == as.Date("2007-02-02"))
  library(datasets)
  
  xval <- as.numeric(format(strptime(dt2$Date, "%d/%m/%Y"), "%d")) + as.numeric(format(strptime(dt2$Time, "%H:%M:%S"), "%H")) /24 + as.numeric(format(strptime(dt2$Time, "%H:%M:%S"), "%M")) / (24 * 60) + as.numeric(format(strptime(dt2$Time, "%H:%M:%S"), "%S")) / (24 * 60 * 60)
  
  par(mfcol = c(2,2))
  
  
  with(faithful, plot(as.numeric(format(strptime(dt2$Date, "%d/%m/%Y"), "%d")) + as.numeric(format(strptime(dt2$Time, "%H:%M:%S"), "%H")) /24 + as.numeric(format(strptime(dt2$Time, "%H:%M:%S"), "%M")) / (24 * 60) + as.numeric(format(strptime(dt2$Time, "%H:%M:%S"), "%S")) / (24 * 60 * 60),dt2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", xaxt = "n", main = ""))
  axis(1, at=1:3, labels=c("Thu", "Fri", "Sat"))
  
  
  
  plot(xval, dt2$Sub_metering_1, type = "l", xlab = "", xaxt = "n", ylab = "Energy sub metering")
  points(xval, dt2$Sub_metering_2, col = "red", type = "l")
  points(xval, dt2$Sub_metering_3, col = "blue", type = "l")
  axis(1, at=1:3, labels=c("Thu", "Fri", "Sat"))
  
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=c(2.5),col=c("black", "red", "blue"))
  
  
  plot(xval, dt2$Voltage, type = "l", xlab = "datetime", xaxt = "n", ylab = "Voltage")
  axis(1, at=1:3, labels=c("Thu", "Fri", "Sat"))
  
  plot(xval, dt2$Global_reactive_power, type = "l", xlab = "datetime", xaxt = "n", ylab = "Global_reactive_power")
  axis(1, at=1:3, labels=c("Thu", "Fri", "Sat"))
  
  dev.copy(png, file = "Plot4.png")
  dev.off()
}