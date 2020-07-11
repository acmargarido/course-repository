#Exploratory Data Analysis
#Course Project 1 / Plotting Assignment 2

library(dplyr)

png(file="Plot2.png",width=480,height=480)

hpc<-read.csv2("household_power_consumption.txt",header = TRUE)

hpc<-mutate(hpc,datetime=paste(hpc$Date,hpc$Time))

hpc$datetime<-strptime(hpc$datetime,"%d/%m/%Y %T")

hpc<-filter(hpc,datetime>="2007-02-01 00:00:00",datetime<="2007-02-02 23:59:00")

hpc$Global_active_power<-as.numeric(hpc$Global_active_power)

plot(hpc$datetime,hpc$Global_active_power,type="l",xlab="",ylab="Global Active Power (killowatts)")

dev.off()
