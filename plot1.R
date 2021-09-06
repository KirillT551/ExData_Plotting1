##Read txt file
epc<-read.table("household_power_consumption.txt",header=TRUE,sep =";",
                na.strings = "?")
##Merge date and time column
dt<-paste(epc$Date,epc$Time)
##Change dt variable to data frame
dt<-as.data.frame(dt)
##Change dt's column name
colnames(dt)<-"DateTime"
##Change dt's class from ch to POSIXlt
dt$`DateTime`<-strptime(dt$`DateTime`,format="%d/%m/%Y %H:%M:%S")
##Merge dt with epc
epc<-cbind(dt,epc)

epc$Date<-as.Date(epc$Date, format="%d/%m/%Y")

##Subset February 01 and 02 of 2007
epc1<-subset(epc,Date=="2007-02-01" | Date=="2007-02-02")

##Plot 1 - Histogram - Global Active Power
png("plot1.png",width = 480,height= 480)
par(mfrow=c(1,1))
hist(epc1$Global_active_power,col = "Red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()