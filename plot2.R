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

#plot
with(cons,plot(DT,Global_active_power,type="l",xlab = "",
                ylab = "Global Active Power (kilowatts)"))
dev.copy(png,file="plot2.png")
dev.off()