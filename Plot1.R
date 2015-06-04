
## This program is for Assignment 1 of exploratory Data Analysis
## Plot1.R is Generating plot1 whic is submitted as Plot1.png


## read the data form file
data <- read.table("household_power_consumption.txt",header = T, sep = ";",as.is=T,na.strings = "?")
## convert date as per assignment suggestion
data$Date <- as.Date(data$Date,"%d/%m/%Y")
## filter given dates
data <- data[data$Date == '2007-02-01' | data$Date == '2007-02-02',]
## loop through the variables
for(i in 3:9) data[,i] <- as.numeric(data[,i])

## Generate Plot1
png("plot1.png")
with(data,hist(Global_active_power,main = "Global Active Power",col='red',xlab = 'Global Active Power (kilowatts)'))

## close device
dev.off()
