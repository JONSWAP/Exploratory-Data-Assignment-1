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

#plot
plot1<-cons$Global_active_power
hist(plot1,col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.copy(png,file="plot1.png", width=480,height=480)
dev.off()


