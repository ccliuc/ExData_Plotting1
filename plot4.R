# Code for reading the data
dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), header=F, sep=";", na.strings="?")
colnames(dat) <- names(read.table("household_power_consumption.txt", header=TRUE, sep=";", nrows=1))

# Code for creating the plot4.png
dateTime <- strptime(paste(dat$Date, dat$Time), format="%d/%m/%Y %H:%M:%S")
png("plot4.png", width=480, height=480)
par(mfcol=c(2,2))

# Plot topleft graph
plot(dateTime, dat$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# Plot bottomleft graph
plot(dateTime, dat$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dateTime, dat$Sub_metering_2, col="red")
lines(dateTime, dat$Sub_metering_3, col="blue")
legend("topright", lty="solid", bty="n", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Plot topright graph
plot(dateTime, dat$Voltage, type="l", xlab="datetime", ylab="Voltage")

# Plot bottomright graph
plot(dateTime, dat$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()


