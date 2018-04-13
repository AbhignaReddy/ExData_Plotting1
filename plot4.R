##Extract the data for 1/2/2007 and 2/2/2007

power1<-"household_power_consumption.txt"
powerfile<-file(power1)
library(sqldf)
data<-sqldf("select * from powerfile where Date=='1/2/2007' or Date=='2/2/2007'",
            file.format=list(header=TRUE,sep=";"))

##Combine date and time

powerdata<-data
powerdata$date_time<-with(powerdata,dmy(Date)+hms(Time))

##Opening the png device

png(file="plot4.png",width=480,height = 480)

##Four plots

par(mfrow=c(2,2))
plot(powerdata$date_time,powerdata$Global_active_power,type = "l",xlab=" ",
     ylab = "Global Active Power (kilowatts)")

plot(powerdata$date_time,powerdata$Voltage,type = "l",xlab="datetime",
     ylab = "Voltage")

plot(powerdata$date_time,powerdata$Sub_metering_1,type = "l",xlab="",
     ylab="Energy sub metering")
lines(powerdata$date_time,powerdata$Sub_metering_2,col="red")
lines(powerdata$date_time,powerdata$Sub_metering_3,col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),lty =1)

plot(powerdata$date_time,powerdata$Global_reactive_power,type = "l",xlab="datetime",    
     ylab = "Global_reactive_power")

##Closing the png device

dev.off()

