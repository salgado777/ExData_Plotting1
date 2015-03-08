my_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
my_data$Date <- as.Date(my_data$Date, "%d/%m/%Y")
rel_data <- subset(my_data, my_data$Date > "2007-01-31" & my_data$Date < "2007-02-03")
rel_data$Global_active_power <- as.numeric(as.character(rel_data$Global_active_power))
times <- rel_data$Time
dates <- rel_data$Date
date_time <- as.POSIXct(paste(as.character(dates),as.character(times)))
rel_data$DateTime <- date_time
png("plot3.png", width=480, height=480)
plot(rel_data$DateTime, rel_data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
points(rel_data$DateTime, rel_data$Sub_metering_2, col="red", type="l")
points(rel_data$DateTime, rel_data$Sub_metering_3, col="blue", type="l")
legend("topright", paste(c("Sub_metering_1","Sub_metering_2", "Sub_metering_3")), col = c("black", "red", "blue"), lty=1, ncol = 1)
dev.off()