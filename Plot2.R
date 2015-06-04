
## This program is for Assignment 1 of exploratory Data Analysis
## Plot2.R is Generating plot1 whic is submitted as Plot2.png

## read the data form file
data <- read.table("household_power_consumption.txt",header = T, sep = ";",as.is=T,na.strings = "?")

## convert date as per assignment suggestion
data$Date <- as.Date(data$Date,"%d/%m/%Y")

## filter given dates
data <- data[data$Date == '2007-02-01' | data$Date == '2007-02-02',]

## Loop through the variaables
for(i in 3:9) data[,i] <- as.numeric(data[,i])

## Generate Plot2
png("plot2.png")
with(data,plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Global_active_power,type='l',xlab="",ylab = 'Global Active Power (kilowatts)'))
dev.off()
