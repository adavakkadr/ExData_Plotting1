library("dplyr")
filename <- "household_power_consumption.txt"
powercons <- read.table(filename,header= TRUE,sep=';',stringsAsFactors = FALSE,dec=".")

sub <- filter(powercons,Date %in% c("1/2/2007","2/2/2007") ) %>%
  mutate(Sub_metering_1=as.numeric(Sub_metering_1),Sub_metering_2=as.numeric(Sub_metering_2),Sub_metering_3=as.numeric(Sub_metering_3),
         globalActivePower <- as.numeric(Global_active_power),
         globalReactivePower <- as.numeric(Global_reactive_power),
         voltage <- as.numeric(Voltage)
         )
wk <- strptime(paste(sub$Date, sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2)) 

plot(wk, sub$globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(wk, sub$voltage, type="l", xlab="datetime", ylab="Voltage")

plot(wk,sub$Sub_metering_1,  type="l", xlab="", ylab="Energy Submetering")

lines(wk, sub$Sub_metering_2, type="l", col="red")

lines(wk, sub$Sub_metering_3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))


plot(wk, sub$globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()