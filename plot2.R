library("dplyr")
filename <- "household_power_consumption.txt"
powercons <- read.table(filename,header= TRUE,sep=';',stringsAsFactors = FALSE,dec=".")

gap <- filter(powercons,Date %in% c("1/2/2007","2/2/2007") ) %>%
  mutate(Global_active_power=as.numeric(Global_active_power)) %>%
  select(Global_active_power,Date,Time)
wk <- strptime(paste(gap$Date, gap$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(wk,gap$Global_active_power,  type="l", xlab="", ylab="Global Active Power (kilowatts)")


dev.off()