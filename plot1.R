setwd("C:/Users/30901/ExData_Plotting1")
# Read Data
elec.pwr.consumption<-read.table("household_power_consumption.txt", header=T, sep=";",na.strings = c("?",""))
# Set as Dates, Times and create a 'datetime' variable
elec.pwr.consumption$Date<-as.Date(elec.pwr.consumption$Date, format="%d/%m/%Y")
elec.pwr.consumption$datetime <- paste(elec.pwr.consumption$Date,elec.pwr.consumption$Time)
elec.pwr.consumption$datetime<-strptime(elec.pwr.consumption$datetime, format="%Y-%m-%d %H:%M:%S")

# Subset data for the 2 days
twodaydata<-elec.pwr.consumption[elec.pwr.consumption$Date=="2007-02-01"|elec.pwr.consumption$Date==" 2007-02-02", ]
# PLOT 1: Histogram of Global Active Power
hist(twodaydata$Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power(kilowatts)", cex.axis=1)

