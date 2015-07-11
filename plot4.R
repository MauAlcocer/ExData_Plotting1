memory.limit(4000)
setwd("C:/Users/Luis Mauricio/Desktop/Coursera Data Science/Exploratory Data Analysis/Week 1")
data<-read.table("household_power_consumption.txt",
                 sep=";",header=TRUE,
                 na.strings="?")

data$Date<-as.Date(data$Date,format="%d/%m/%Y")

datax<-subset(data,data$Date>="2007-02-01" & 
                data$Date<="2007-02-02")

datax$datex<-paste(datax$Date,datax$Time)
datax$datex<-strptime(datax$datex, 
                      format="%Y-%m-%d %H:%M:%S",tz="EST")

# plot4
# Since my default locale is Mexico I have to change it to an English
#locale to obtain the correct x axis labels
Sys.setlocale("LC_TIME", "English")

par(mfrow = c(2, 2))
plot(datax$datex,datax[,3],
     type="l",ylab="Global Active Power (kilowatts)",xlab="")

plot(datax$datex,datax[,5],
     type="l",ylab="Voltage",xlab="datetime")

plot(datax$datex,datax[,7],
     type="l",ylab="Energy sub metering",xlab="")
lines(datax$datex,datax[,8],col="red")
lines(datax$datex,datax[,9],col="blue")
legend("topright",legend=c(colnames(datax)[7],colnames(datax)[8],
                           colnames(datax)[9]),lty=c(1,1),
       col=c("black","red","blue"))

plot(datax$datex,datax[,4],
     type="l",ylab=colnames(datax)[4],xlab="datetime")

dev.copy(png, file = "plot4.png",width=480,height=480)
dev.off()
