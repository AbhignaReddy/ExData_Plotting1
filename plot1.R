
##Extract the data for 1/2/2007 and 2/2/2007

power1<-"household_power_consumption.txt"
powerfile<-file(power1)
library(sqldf)
data<-sqldf("select * from powerfile where Date=='1/2/2007' or Date=='2/2/2007'",
            file.format=list(header=TRUE,sep=";"))

##Opening the png device

png(file="plot1.png",width=480,height = 480)

##Histogram

hist(data$Global_active_power,xlab="Global Active Power (kilowatts)",
     col="red",main = "Global Active Power")

##Closing the png device

dev.off()
