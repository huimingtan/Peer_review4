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
##plot1
png(filename="plot1.png",width=480,height=480)
hist(Specific_Date$Global_active_power,main="Global Active Power",
     col="red",xlab="Global Active Power(kilowatts)")
dev.off()