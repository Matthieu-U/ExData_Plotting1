# read data
data<-read.table(file="household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE,dec=".")

# load dplyr library
library(dplyr)

# Subsetting
subsetdata <- filter(data, data$Date %in% c("1/2/2007", "2/2/2007"))

#Convert date and time
dt <-strptime(paste(subsetdata$Date,subsetdata$Time, sep=""), "%d/%m/%Y %H:%M:%S")


sm1 <-as.numeric(subsetdata$Sub_metering_1)
sm2 <-as.numeric(subsetdata$Sub_metering_2)
sm3 <-as.numeric(subsetdata$Sub_metering_3)

#Save PNG file
png("plot3.png",width=480,height=480)


# plot graph
plot(dt, sm1, type="l", ylab = "Energy sub metering", xlab = "")
lines(dt, sm2, type = "l", col = "red")
lines(dt, sm3, type = "l", col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
