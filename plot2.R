plot2 <- function() {
  dt <- fread("household_power_consumption.txt")
  dt2 <- subset(dt, as.Date(strptime(Date, "%d/%m/%Y")) == as.Date("2007-02-01") | as.Date(strptime(Date, "%d/%m/%Y")) == as.Date("2007-02-02"))
  library(datasets)
  
  with(faithful, plot(as.numeric(format(strptime(dt2$Date, "%d/%m/%Y"), "%d")) + as.numeric(format(strptime(dt2$Time, "%H:%M:%S"), "%H")) /24 + as.numeric(format(strptime(dt2$Time, "%H:%M:%S"), "%M")) / (24 * 60) + as.numeric(format(strptime(dt2$Time, "%H:%M:%S"), "%S")) / (24 * 60 * 60),dt2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", xaxt = "n", main = ""))
  axis(1, at=1:3, labels=c("Thu", "Fri", "Sat"))
  dev.copy(png, file = "Plot2.png")
  dev.off()
}