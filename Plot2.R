library(dplyr)
data <- read.csv2("household_power_consumption.txt")
f_data <- filter(data, Date %in% c("1/2/2007","2/2/2007")) 
f_data$DateTime <- strptime(paste(f_data$Date,f_data$Time),"%d/%m/%Y %H:%M:%S")

# converted factor variablees into numeric

for (i in 3:9) {f_data[,i] <- as.numeric(levels(f_data[,i]))[f_data[,i]]}

png("plot2.png", height = 480, width = 480, bg = "transparent")
plot(f_data$DateTime, f_data$Global_active_power,type="l",
                        ylab="Global Active Power (kilowatts)",xlab=NA)
dev.off()