# Make plot 1

# Read in the file
hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.string = "?")

# Look at it
# str(hpc)

# Make a date and time column
hpc$DT <- paste(hpc$Date, hpc$Time, sep = " ")
hpc$DT <- as.POSIXlt(hpc$DT, format = "%d/%m/%Y %H:%M:%S")

begin <- as.POSIXlt("2007-02-01 00:00:00")
end <- as.POSIXlt("2007-02-02 23:59:59")
# cut out all the rows except the two day period we want
a <- which(hpc$DT >= begin & hpc$DT <= end)
hpc2 <- hpc[a, ]

# Make plot 1
png("plot1.png", width = 480, height = 480)

hist(hpc2$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     xlim=c(0, 6), col = "red")

dev.off()