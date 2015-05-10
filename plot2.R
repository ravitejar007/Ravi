#Read full data
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
#Interpret the dates
df$Date <- strptime(as.character(df$Date), "%d/%m/%Y")
#Sub-setting the data
df <- df[df$Date >= as.POSIXlt("2007-02-01") & df$Date <= as.POSIXlt("2007-02-02"),]
#Calculate new datatime column
datetime <- paste(as.Date(df$Date), df$Time)
df$Datetime <- as.POSIXct(datetime)
#Plot the data
plot(df$Global_active_power~df$Datetime, type = "l",xlab = "", ylab = "Global Active Power(kilowatts)")
#Copy the files
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()