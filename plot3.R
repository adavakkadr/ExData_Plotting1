library("dplyr")
filename <- "household_power_consumption.txt"
powercons <- read.table(filename,header= TRUE,sep=';',stringsAsFactors = FALSE,dec=".")

sm <- filter(powercons,Date %in% c("1/2/2007","2/2/2007") ) %>%
  mutate(Sub_metering_1=as.numeric(Sub_metering_1),Sub_metering_2=as.numeric(Sub_metering_2),Sub_metering_3=as.numeric(Sub_metering_3) ) %>%
  select(Sub_metering_1,Sub_metering_2,Sub_metering_3,Date,Time)
wk <- strptime(paste(sm$Date, sm$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot3.png", width=480, height=480)
plot(wk,sm$Sub_metering_1,  type="l", xlab="", ylab="Energy Submetering")

lines(wk, sm$Sub_metering_2, type="l", col="red")

lines(wk, sm$Sub_metering_3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()