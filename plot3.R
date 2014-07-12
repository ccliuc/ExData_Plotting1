# Code for reading the data. NOTE: This code uses read.table coupled with pipe and grep
# to read the data just from the two dates 1/2/2007 and 2/2/2007. It would work on Mac, Linux
# as well as Windows with grep function or cgiwin installed.
dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), header=F, sep=";", na.strings="?")
colnames(dat) <- names(read.table("household_power_consumption.txt", header=TRUE, sep=";", nrows=1))

# Code for creating the plot3.png
dateTime <- strptime(paste(dat$Date, dat$Time), format="%d/%m/%Y %H:%M:%S")
png("plot3.png", width=480, height=480)
plot(dateTime, dat$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dateTime, dat$Sub_metering_2, col="red")
lines(dateTime, dat$Sub_metering_3, col="blue")
legend("topright", lty="solid", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
