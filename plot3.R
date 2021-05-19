
dt <- read.table("household_power_consumption.txt", 
                 sep = ";", 
                 colClasses =  c("character", "character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                 col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                 skip = 66637,
                 nrows = 2880,
                 na.strings = c("?"))
dt$datetime = as.POSIXct(paste(dt$Date, dt$Time), format = "%d/%m/%Y %H:%M:%S")

graphics.off()

png("plot3.png")

with(dt, plot(datetime, 
              Sub_metering_1,
              type="l",
              xlab = "",
              ylab = "Energy sub metering", ylim=c(0,38)))

with(dt, lines(datetime, Sub_metering_2, col = "red"))
with(dt, lines(datetime, Sub_metering_3, col = "blue"))

legend("topright",lty=c(1,1,1), lwd=c(2,2,2),
       col=c("black","red", "blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

graphics.off()

