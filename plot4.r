setwd("C:/Users/user/Desktop/Coursera/course4/week1")
file<-file("./household_power_consumption.txt")
Specific_Date<-read.table(text=grep("^[1,2]/2/2007",readLines(file),
                                    value=TRUE),sep=";")
Specific_Date<-setNames(Specific_Date,c("V1"="Date","V2"="Time",
                                        "V3"="Global_active_power",
                                        "V4"="Global_reactive_power",
                                        "V5"="Voltage",
                                        "V6"="Global_intensity",
                                        "V7"="Sub_metering_1",
                                        "V8"="Sub_metering_2",
                                        "V9"="Sub_metering_3"))
png(filename="plot4.png",width=480,height=480)
par(mfrow=c(2,2))
##plot1
Data2<-strptime(paste(Specific_Date$Date,Specific_Date$Time,sep=""),"%d/%m/%Y %H:%M:%S")
plot(Data2,Specific_Date$Global_active_power,type="l",ylab="Global Active Power(kilowatts)",xlab="")
##plot2
Data5<-strptime(paste(Specific_Date$Date,Specific_Date$Time,sep=""),"%d/%m/%Y %H:%M:%S")
plot(Data5,Specific_Date$Voltage,type="l",ylab="Voltage",xlab="")
##plot3
Data3<-strptime(paste(Specific_Date$Date,Specific_Date$Time,sep=""),"%d/%m/%Y %H:%M:%S")
plot(Data3,Specific_Date$Global_active_power,type="l",ylab="Energy sub metering",ylim=c(0,30),
     xlab="")
lines(Data3,Specific_Date$Sub_metering_1,type="l",col="black")
lines(Data3,Specific_Date$Sub_metering_2,type="l",col="red")
lines(Data3,Specific_Date$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=1)
##plot4
Data4<-strptime(paste(Specific_Date$Date,Specific_Date$Time,sep=""),"%d/%m/%Y %H:%M:%S")
plot(Data4,Specific_Date$Global_reactive_power,type="l",ylab="Global_reactive_power",
     xlab="")
dev.off()