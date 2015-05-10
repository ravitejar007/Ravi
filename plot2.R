df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
df$Date <- strptime(as.character(df$Date), "%d/%m/%Y")
df <- df[df$Date >= as.POSIXlt("2007-02-01") & df$Date <= as.POSIXlt("2007-02-02"),]
datetime <- paste(as.Date(df$Date), df$Time)
df$Datetime <- as.POSIXct(datetime)
plot(df$Global_active_power~df$Datetime, type = "l",xlab = "", ylab = "Global Active Power(kilowatts)")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()