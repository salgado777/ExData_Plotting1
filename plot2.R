my_data <- read.table("../rdata/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
my_data$Date <- as.Date(my_data$Date, "%d/%m/%Y")
rel_data <- subset(my_data, my_data$Date > "2007-01-31" & my_data$Date < "2007-02-03")
rel_data$Global_active_power <- as.numeric(as.character(rel_data$Global_active_power))
times <- rel_data$Time
dates <- rel_data$Date
date_time <- as.POSIXct(paste(as.character(dates),as.character(times)))
rel_data$DateTime <- date_time
png("plot2.png", width=480, height=480)
plot(rel_data$DateTime, rel_data$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()