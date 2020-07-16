library(dplyr)
library(tidyr)

#read data
cons<-read.delim("household_power_consumption.txt",sep=";")

#change date class
cons<-mutate(cons,Date=as.Date(Date,format="%d/%m/%Y"))

#select date
cons<-filter(cons,Date>="2007-02-01"&Date<="2007-02-02")

#change data class
cons[,c(3:8)]<-apply(cons[,c(3:8)],2,function(x) as.numeric(x))
cons<-mutate(cons,DT=as.POSIXct(paste(Date,Time)))

#plot layout setting
par(mfrow=c(2,2),mar=c(4,4,2,1))

#plot 1
with(cons,plot(DT,Global_active_power,col="black",type="l",xlab = "",
               ylab = "Global Active Power"))

#plot 2
with(cons,plot(DT,Voltage,col="black",type="l",xlab = "datetime",
               ylab = "Voltage"))

#Plot 3
with(cons,plot(DT,Sub_metering_1,col="black",type="l",xlab = "",
               ylab = "Energy sub metering"))
with(cons,lines(DT,Sub_metering_2,col="red",type="l",xlab = "", ylab = ""))
with(cons,lines(DT,Sub_metering_3,col="blue",type="l",xlab = "", ylab = ""))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=c(1,1),bty="n")

#plot 4
with(cons,plot(DT,Global_reactive_power,col="black",type="l",xlab = "datetime",
               ylab = "Global_reactive_power"))

dev.copy(png,file="plot4.png",width=480,height=480)
dev.off()