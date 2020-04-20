# read data
data<-read.table(file="household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE,dec=".")

# load dplyr library
library(dplyr)

# Subsetting
subsetdata<- filter(data, data$Date %in% c("1/2/2007", "2/2/2007"))

#Convert date and time
dt <-strptime(paste(subsetdata$Date,subsetdata$Time, sep=""), "%d/%m/%Y %H:%M:%S")

gap <- as.numeric(subsetdata$Global_active_power)
grp <- as.numeric(subsetdata$Global_reactive_power)
sm1 <-as.numeric(subsetdata$Sub_metering_1)
sm2 <-as.numeric(subsetdata$Sub_metering_2)
sm3 <-as.numeric(subsetdata$Sub_metering_3)

vlt <- as.numeric(subsetdata$Voltage)

#Save PNG file
png("plot4.png",width=480,height=480)

# multiple base plots
par(mfrow = c(2,2))

hist(gap, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "RED")
plot(dt, vlt, type="l", ylab = "Voltage", xlab = "datetime") 
plot(dt, sm1, type="l", ylab = "Energy sub metering", xlab = "")
lines(dt, sm2, type = "l", col = "red")
lines(dt, sm3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
plot(dt, grp, type="l", ylab = "Global_Reactive_Power", xlab = "datetime")
dev.off()

