## Load data and draw plot # 4

## NOTE: for the script to work correctly, there must be a file called 
## "household_power_consumption.txt" in the working directory, size ~19.7Mb.
## It is assumed the .zip file was downloaded from Coursera-provided URL, and 
## manually unzipped to the working directory, to that file name.

# Read data into R (only for required dates)
dat <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),header=F, sep=';')
colnames(dat) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))

# Convert Date, Time to Date/Time
dat$datetime <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M:%S")

# draw plot
png(file="plot4.png", width = 480, height = 480)

# set 2x2 plot area
par(mfrow=c(2,2))

# draw plot #1
with(dat, plot(datetime, Global_active_power, type = "l", xlab="", ylab="Global Active Power"))
# draw plot #2
with(dat, plot(datetime, Voltage, type="l"))
# draw plot #3
with(dat, plot(datetime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black"))
with(dat, lines(datetime, Sub_metering_2, type="l", col="red"))
with(dat, lines(datetime, Sub_metering_3, type="l", col="blue"))
with(dat, legend("topright", lty = 1, bty="n", col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3")))
# draw plot #4
with(dat, plot(datetime, Global_reactive_power, type="l"))

# Close graphic device
dev.off()
