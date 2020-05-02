library("dplyr")
filename <- "household_power_consumption.txt"
powercons <- read.table(filename,header= TRUE,sep=';',stringsAsFactors = FALSE,dec=".")

gap <- filter(powercons,Date %in% c("1/2/2007","2/2/2007") ) %>%
       mutate(Global_active_power=as.numeric(Global_active_power)) %>%
       select(Global_active_power)          

png("plot1.png", width=480, height=480)
hist(gap$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")


dev.off()