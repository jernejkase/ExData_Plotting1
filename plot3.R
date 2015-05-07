library("lubridate")
#for simplicity sake i use numbers i got with grep in plot1.R
feb<-66638
feb3<-69518
h <- read.table("household_power_consumption.txt",header=TRUE,nrows=1,sep=";")
df <- read.table("household_power_consumption.txt",
				 sep=";",
				 na.strings = c("?"),
				 header = FALSE,
				 skip=feb-1,
				 nrows = feb3-feb)
names(df)<-names(h)
df <- data.table(df)
df[,DateTime:=dmy_hms(paste(Date,Time,sep=" "))]
png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(df$DateTime,df$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(df$DateTime,df$Sub_metering_2,type="l",col="red")
lines(df$DateTime,df$Sub_metering_3,type="l",col="blue")
legend('topright', 
	   legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
	   col=c('black', 'red', 'blue'), 
	   lty='solid')
dev.off()