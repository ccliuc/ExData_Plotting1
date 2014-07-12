# Code for reading the data
dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), header=F, sep=";", na.strings="?")
colnames(dat) <- names(read.table("household_power_consumption.txt", header=TRUE, sep=";", nrows=1))

# Code for creating the plot2.png
# Use strptime() to change Date/Time format
dateTime <- strptime(paste(dat$Date, dat$Time), format="%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(dateTime, dat$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

