house_hold_power <- read.csv("household_power_consumption.txt",header=TRUE,sep = ';', na.strings = '?',nrows= 2075259, check.names = FALSE, stringsAsFactors = FALSE, comment.char = "", quote = '\"')
subsetted_data <- subset(house_hold_power,Date %in% c("1/2/2007","2/2/2007"))
subsetted_data$Date <- as.Date(subsetted_data$Date,format="%d/%m/%Y")
datetime <- paste(as.Date(subsetted_data$Date),subsetted_data$Time)
subsetted_data$Datetime <- as.POSIXct(datetime)


par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(subsetted_data, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

