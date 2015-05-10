#Read full Data
df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
#Interpret the dates
df$Date <- strptime(as.character(df$Date), "%d/%m/%Y")
#Subset the data
df <- df[df$Date >= as.POSIXlt("2007-02-01") & df$Date <= as.POSIXlt("2007-02-02"),]
#Generate the histogram
png(file="plot1.png")
hist(df$Global_active_power, col = "red", main = "Global Active Power",xlab="Global active power(kilowatts", ylab="Frequency")
#Copy to png file
dev.off()