
## This program is for Assignment 1 of exploratory Data Analysis
## Plot3.R is Generating plot1 whic is submitted as Plot3.png

## read the data form file
data <- read.table("household_power_consumption.txt",header = T, sep = ";",as.is=T,na.strings = "?")

## convert date as per assignment suggestion
data$Date <- as.Date(data$Date,"%d/%m/%Y")

## filter given dates
data <- data[data$Date == '2007-02-01' | data$Date == '2007-02-02',]

## Loop through the variaables
for(i in 3:9) data[,i] <- as.numeric(data[,i])

## Generate Plot3
png("plot3.png")

with(data,plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Sub_metering_1,type='l',xlab="",ylab = 'Energy sub metering'))
with(data,lines(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Sub_metering_2,col='red'))
with(data,lines(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"),Sub_metering_3,col='blue'))
legend("topright",legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lwd=1)


dev.off()

