## Load data and draw plot # 1

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
png(file="plot1.png", width = 480, height = 480)
with(dat, hist(dat$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main = paste("Global Active Power")))
dev.off()
