
dt <- read.table("household_power_consumption.txt", 
                 sep = ";", 
                 colClasses =  c("character", "character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                 col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                 skip = 66637,
                 nrows = 2880,
                 na.strings = c("?"))
dt$datetime = as.POSIXct(paste(dt$Date, dt$Time), format = "%d/%m/%Y %H:%M:%S")

graphics.off()

png("plot1.png")

hist(dt$Global_active_power,
     main="Global Active Power",
     col="red",
     xlab="Global Active Power (kilowatts)")
graphics.off()