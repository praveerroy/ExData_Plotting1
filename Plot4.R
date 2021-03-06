
## This program is for Assignment 1 of exploratory Data Analysis
## Plot4.R is Generating plot1 whic is submitted as Plot4.png

## read the data form file
data <- read.table("household_power_consumption.txt",header = T, sep = ";",as.is=T,na.strings = "?")

## convert date as per assignment suggestion
data$Date <- as.Date(data$Date,"%d/%m/%Y")

## filter given dates
data <- data[data$Date == '2007-02-01' | data$Date == '2007-02-02',]

## Loop through the variaables
for(i in 3:9) data[,i] <- as.numeric(data[,i])

## Generate Plot4
png("plot4.png")

par(mfrow=c(2,2))
with(data,plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Global_active_power,type='l',xlab="",ylab = 'Global Active Power (kilowatts)'))
with(data,plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Voltage,type='l',xlab='datetime',ylab='Voltage'))
with(data,plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Sub_metering_1,type='l',xlab="",ylab = 'Energy sub metering'))
with(data,lines(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Sub_metering_2,col='red'))
with(data,lines(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Sub_metering_3,col='blue'))

legend("topright",legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lwd=1)
with(data,plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Global_reactive_power,type='l',xlab='datetime'))

dev.off()

