mydata<- read.table("C:\\Users\\adity\\OneDrive\\Desktop\\New folder\\Explanatory\\household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)

FullTimeDate <- strptime(paste(mydata$Date, mydata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
mydata <- cbind(mydata, FullTimeDate)

mydata$Date<-as.Date(mydata$Date, format="%d/%m/%Y")
mydata$Time<-format(mydata$Time, format="%H:%M:%S")
mydata$Global_active_power<-as.numeric(mydata$Global_active_power)
mydata$Global_reactive_power<-as.numeric(mydata$Global_reactive_power)
mydata$Global_intensity<-as.numeric(mydata$Global_intensity)
mydata$Global_active_power<-as.numeric(mydata$Global_active_power)
mydata$Voltage<-as.numeric(mydata$Voltage)
mydata$Sub_metering_1<-as.numeric(mydata$Sub_metering_1)
mydata$Sub_metering_2<-as.numeric(mydata$Sub_metering_2)
mydata$Sub_metering_3<-as.numeric(mydata$Sub_metering_3)

subdata<- subset(mydata, Date== "2007-02-01" | Date =="2007-02-02")
plot3<-function(){

png("plot3.png", width=480, height=480)

  with(subdata, plot(FullTimeDate, Sub_metering_1, type="l", xlab="Day", ylab="Energy sub metering"))
  lines(subdata$FullTimeDate, subdata$Sub_metering_2,type="l", col= "red")
  lines(subdata$FullTimeDate, subdata$Sub_metering_3,type="l", col= "blue")
  legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))  
  dev.off()
}