# read data
data<-read.table(file="household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE,dec=".")

#Subset 2 days
subsetdata<-data[data$Date %in% c("1/2/2007","2/2/2007"),]

# load dplyr library
library(dplyr)

# Subsetting
subsetdata <- filter(data, data$Date %in% c("1/2/2007", "2/2/2007"))

#Convert date and time
dt <-strptime(paste(subsetdata$Date,subsetdata$Time, sep=""), "%d/%m/%Y %H:%M:%S") 

gap <-as.numeric(subsetdata$Global_active_power)

#Save as int PNG file
png("plot2.png",width=480,height=480)

# Plot graph
plot(dt, gap,type="l",ylab="Global Active Power (kilowatts)")
dev.off()      
