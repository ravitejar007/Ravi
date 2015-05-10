#Read full data
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
#Interpret the dates
df$Date <- strptime(as.character(df$Date), "%d/%m/%Y")
#Subsetting data
df <- df[df$Date >= as.POSIXlt("2007-02-01") & df$Date <= as.POSIXlt("2007-02-02"),]
#Calculate datatime column
datetime <- paste(as.Date(df$Date), df$Time)
df$Datetime <- as.POSIXct(datetime)
#Plot the data
with(df, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#Copy the values
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()