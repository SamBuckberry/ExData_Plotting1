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

# plot histogram for the 'global active power'

hist(dat$Global_active_power, 
     xlab="Global Active Power (kilowatts)",
     col="red", main="Global Active Power")

# Save plot as png file
png(filename="plot1.png", width=480, height=480)
hist(dat$Global_active_power, 
     xlab="Global Active Power (kilowatts)",
     col="red", main="Global Active Power")
dev.off()

