setwd("~/Desktop/Dropbox/Coursera/ExploreDataAnalysis")
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
plot(days, dat$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# output to file
png(filename="plot2.png", width=480, height=480)
plot(days, dat$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
