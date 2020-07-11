#Exploratory Data Analysis
#Course Project 1 / Plotting Assignment 1

library(dplyr)

png(file="Plot1.png",width=480,height=480)

hpc<-read.csv2("household_power_consumption.txt",header = TRUE)

hpc$Date<-as.Date(hpc$Date,format="%d/%m/%Y")

hpc<-filter(hpc,Date>="2007-02-01",Date<="2007-02-02")

hpc$Global_active_power<-as.numeric(hpc$Global_active_power)

hist(hpc$Global_active_power,col="red",xlab="Global Active Power (kilowwats)",main="Global Active Power")

dev.off()