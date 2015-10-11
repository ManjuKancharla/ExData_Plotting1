setwd("C:/Users/30901/ExData_Plotting1")
# Read Data
elec.pwr.consumption<-read.table("household_power_consumption.txt", header=T, sep=";",na.strings = c("?",""))
# Set as Dates, Times and create a 'datetime' variable
elec.pwr.consumption$Date<-as.Date(elec.pwr.consumption$Date, format="%d/%m/%Y")
elec.pwr.consumption$datetime <- paste(elec.pwr.consumption$Date,elec.pwr.consumption$Time)
elec.pwr.consumption$datetime<-strptime(elec.pwr.consumption$datetime, format="%Y-%m-%d %H:%M:%S")

# Subset data for the 2 days
twodaydata<-elec.pwr.consumption[elec.pwr.consumption$Date=="2007-02-01"|elec.pwr.consumption$Date==" 2007-02-02", ]

# PLOT 4
par(mfrow=c(2,2),mar=c(4,3.75,1,1),oma=c(0,0,2,0))
#graph-1
plot(datetime,Global_active_power,type="l", xlab="", ylab="Global Active Power", cex.lab=0.75, cex.axis=0.6)
#graph-2
plot(datetime,Voltage,type="l", xlab="datetime", ylab="Voltage", cex.lab=0.75, cex.axis=0.6)
#graph-3
plot(datetime,Sub_metering_1, type="l", xlab=" ", ylab="Energy sub metering",cex.lab=0.75, cex.axis=0.6)
lines(datetime, Sub_metering_2, col="red")
lines(datetime, Sub_metering_3, col="blue")
legend("topright",lty=c(1,1,1), lwd=c(2,2,2),col=c("black", "red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.5)
#graph-4
plot(datetime,Global_reactive_power,type="l", xlab="datetime", ylab="Global reactive Power", cex.lab=0.75, cex.axis=0.6)
