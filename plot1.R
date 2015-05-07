library("readr")
rawFile <- read_lines("household_power_consumption.txt")
feb<- grep("1/2/2007", rawFile)[1]
feb3<- grep("3/2/2007", rawFile)[1]
h <- read.table("household_power_consumption.txt",header=TRUE,nrows=1,sep=";")
df <- read.table("household_power_consumption.txt",
				 sep=";",
				 na.strings = c("?"),
				 header = FALSE,
				 skip=feb-1,
				 nrows = feb3-feb)
names(df)<-names(h)
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(df$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main = "Global Active Power")
dev.off()