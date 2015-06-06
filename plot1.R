plot1 <- function() {
  dt <- fread("household_power_consumption.txt")
  dt2 <- subset(dt, as.Date(strptime(Date, "%d/%m/%Y")) == as.Date("2007-02-01") | as.Date(strptime(Date, "%d/%m/%Y")) == as.Date("2007-02-02"))
  library(datasets)
  with(faithful, hist(as.numeric(dt2$Global_active_power), xlab = "Global Active Power (kilowatts)", col = "red", main = ""))
  title(main = "Global Active Power")
  dev.copy(png, file = "Plot1.png")
  dev.off()
}