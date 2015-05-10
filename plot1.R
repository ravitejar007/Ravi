df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
df$Date <- strptime(as.character(df$Date), "%d/%m/%Y")
df <- df[df$Date >= as.POSIXlt("2007-02-01") & df$Date <= as.POSIXlt("2007-02-02"),]
hist(df$Global_active_power, col = "red", main = "Global Active Power")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()