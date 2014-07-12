# Code for reading the data. NOTE: This code uses read.table coupled with pipe and grep
# to read the data just from the two dates 1/2/2007 and 2/2/2007. It would work on Mac, Linux
# as well as Windows with grep function or cgiwin installed.
dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), header=F, sep=";", na.strings="?")
colnames(dat) <- names(read.table("household_power_consumption.txt", header=TRUE, sep=";", nrows=1))

# Code for creating the plot1.png
png("plot1.png", width=480, height=480)
hist(dat$Global_active_power,col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
