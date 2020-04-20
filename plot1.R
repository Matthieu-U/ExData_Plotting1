# read data
data<-read.table(file="household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE,dec=".")

# load dplyr library
library(dplyr)

# Subsetting
datasubset <- filter(data, data$Date %in% c("1/2/2007", "2/2/2007"))
gap <- as.numeric(datasubset$Global_active_power)

#Save PNG file
png("plot1.png",width=480,height=480)

# Plot graph
hist(gap, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "RED")

dev.off()
