
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

png(file="plot2.png",width=480,height = 480)

##Plot time vs Global Active Power
plot(powerdata$date_time,powerdata$Global_active_power,type = "l",xlab=" ",
     ylab = "Global Active Power (kilowatts)")


##Closing the png device

dev.off()
