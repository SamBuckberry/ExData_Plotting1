
download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="dataFile.zip", method="curl")
unzip(zipfile="dataFile.zip")

# Read the data into dataframe
dat <- read.table(file="household_power_consumption.txt", 
                  na.strings="?", sep=";", header=TRUE)

# specify dates 
dates <- c("1/2/2007", "2/2/2007")

# subset data according to dates
dat <- subset(dat, Date %in% dates)
days <- strptime(paste(dat$Date, dat$Time), format="%d/%m/%Y %H:%M:%S")

# generate the plot
par(mfrow=c(2,2))
#plot 1,1
plot(days, dat$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# plot 1,2
plot(days, dat$Voltage, type="l", xlab="datetime", ylab="Voltage")

# plot 2,1
plot(days, dat$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(days, dat$Sub_metering_2, col="red")
lines(days, dat$Sub_metering_3, col="blue")
legend("topright", lty=1, bty = "n", col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# plot 2,2
plot(days, dat$Global_reactive_power, 
     type="l", xlab="datetime", ylab="Global_reactive_power")


# output to file
png(filename="plot4.png", width=480, height=480)
# generate the plot
par(mfrow=c(2,2))

#plot 1,1
plot(days, dat$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# plot 1,2
plot(days, dat$Voltage, type="l", xlab="datetime", ylab="Voltage")

# plot 2,1
plot(days, dat$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(days, dat$Sub_metering_2, col="red")
lines(days, dat$Sub_metering_3, col="blue")
legend("topright", lty=1, bty = "n", col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# plot 2,2
plot(days, dat$Global_reactive_power, 
     type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

