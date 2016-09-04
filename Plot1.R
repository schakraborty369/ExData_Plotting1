library(lubridate)
rm(list=ls()) # removed the earlier objects from environment
data <- read.csv2("household_power_consumption.txt")
data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)

f_data <- subset(data, year(Date) == 2007 & month(Date) == 02 & (day(Date) == 1 | day(Date) == 2))
Numeric_var <- as.numeric(levels(f_data$Global_active_power))[f_data$Global_active_power]

png(filename = "Plot1.png", height = 480, width = 480, bg = "transparent")
hist(Numeric_var, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", 
     main = "Global Active Power", col = "red")
dev.off()