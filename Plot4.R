library(dplyr)
data <- read.csv2("household_power_consumption.txt")
f_data <- filter(data, Date %in% c("1/2/2007","2/2/2007")) 
f_data$DateTime <- strptime(paste(f_data$Date,f_data$Time),"%d/%m/%Y %H:%M:%S")

# converted factor variablees into numeric

for (i in 3:9) {f_data[,i] <- as.numeric(levels(f_data[,i]))[f_data[,i]]}

png("plot4.png", height = 480, width = 480, bg = "transparent")

par(mfcol = c(2,2))

plot(f_data$DateTime, f_data$Global_active_power,type="l", ylab="Global Active Power",xlab=NA)

plot(f_data$DateTime, f_data$Sub_metering_1,type="l", ylab="Energy sub metering",xlab=NA)
lines(f_data$DateTime, f_data$Sub_metering_2,type="l", col = "red")
lines(f_data$DateTime, f_data$Sub_metering_3,type="l", col = "blue")

legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

plot(f_data$DateTime, f_data$Voltage,type="l", ylab="Voltage",xlab="datetime")

plot(f_data$DateTime, f_data$Global_reactive_power,type="l", ylab="Global_reactive_power",xlab="datetime")

dev.off()