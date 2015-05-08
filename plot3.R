# Make plot 3

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

# Make plot 3
png("plot3.png", width = 480, height = 480)

plot(hpc2$DT, hpc2$Sub_metering_1, type = "l",
     ylab = "Energy sub metering", xlab = "")
lines(hpc2$DT, hpc2$Sub_metering_2, type = "l", col = "red")
lines(hpc2$DT, hpc2$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1,
       col = c('black', 'red', 'blue'))

dev.off()