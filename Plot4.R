#Exploratory Data Analysis
#Course Project 1 / Plotting Assignment 4

library(dplyr)

png(file="Plot4.png",width=480,height=480)

hpc<-read.csv2("household_power_consumption.txt",header = TRUE)

hpc<-mutate(hpc,datetime=paste(hpc$Date,hpc$Time))

hpc$datetime<-strptime(hpc$datetime,"%d/%m/%Y %T")

hpc<-filter(hpc,datetime>="2007-02-01 00:00:00",datetime<="2007-02-02 23:59:00")

hpc$Global_active_power<-as.numeric(hpc$Global_active_power)
hpc$Voltage<-as.numeric(hpc$Voltage)
hpc$Sub_metering_1<-as.numeric(hpc$Sub_metering_1)
hpc$Sub_metering_2<-as.numeric(hpc$Sub_metering_2)
hpc$Sub_metering_3<-as.numeric(hpc$Sub_metering_3)
hpc$Global_reactive_power<-as.numeric(hpc$Global_reactive_power)

par(mfrow=c(2,2))

plot(hpc$datetime,hpc$Global_active_power,type="l",xlab="",ylab="Global Active Power")

plot(hpc$datetime,hpc$Voltage,type="l",xlab="datetime",ylab="Voltage")

plot(hpc$datetime,hpc$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
points(hpc$datetime,hpc$Sub_metering_1,type="l")
points(hpc$datetime,hpc$Sub_metering_2,type="l",col="red")
points(hpc$datetime,hpc$Sub_metering_3,type="l",col="blue")
legend("topright",bty="n",lty = 1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(hpc$datetime,hpc$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()
