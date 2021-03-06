data <- read.table("household_power_consumption.txt", header = F,
                   sep =";",skip = 66637, nrows = 2880,
                   col.names=c("Date","Time","Global_active_power",
                               "Global_reactive_power","Voltage",
                               "Global_intensity","Sub_metering_1",
                               "Sub_metering_2","Sub_metering_3"),
                   stringsAsFactors= F, na.strings = "?")
data$Date_Time <- strptime(paste(data$Date, data$Time),
                           format ="%d/%m/%Y %H:%M:%S")
head(data)
tail(data)

png(filename="plot4.png")
par(mfrow=c(2,2),mar=c(5,4,2,1))
with(data, plot(Date_Time,Global_active_power,type="l",
                xlab="",ylab="Global Active Power"))

with(data, plot(Date_Time,Voltage,main="", type="l",
                xlab="datetime",ylab="Voltage"))

with(data, plot(Date_Time,Sub_metering_1,type="l",
                xlab="",ylab="Energy sub metering"))
with(data, lines(Date_Time,Sub_metering_2, col="red"))
with(data, lines(Date_Time,Sub_metering_3, col="blue"))
legend("topright", lty=1,lwd=1, col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(data, plot(Date_Time,Global_reactive_power,main="", type="l",
                xlab="datetime",))

dev.off()