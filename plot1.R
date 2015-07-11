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

# plot1
hist(datax[,3], 
     xlab="Global Active Power (kilowatts)", 
     main="Global Active Power", 
     col="red")
dev.copy(png, file = "plot1.png",width=480,height=480)
dev.off()
