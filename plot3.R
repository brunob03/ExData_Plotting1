# set the new working directory saving the previous one
old.dir=getwd()
setwd(paste(old.dir,"/Coursera/Exploratory Data Analysis/week1",sep=""))

# re-set the aspects of the locale in accordance to the English date-time settings
Sys.setlocale("LC_TIME", "English")

# only records we are interested in
var.names=colnames(read.table("household_power_consumption.txt",sep=";",header=T,nrows=1))
ElPowCon=read.table("household_power_consumption.txt",sep=";",header=T, skip=66636,nrows=2880)
colnames(ElPowCon)= var.names

ElPowCon$DateTime=strptime(paste(ElPowCon$Date,ElPowCon$Time),"%d/%m/%Y %H:%M:%S")


# open png device
png(filename = "plot3.png", width = 480, height = 480)

with(ElPowCon, plot(DateTime,Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(ElPowCon, lines(DateTime,Sub_metering_2, col="red"))
with(ElPowCon, lines(DateTime,Sub_metering_3, col="blue"))
legend("topright",var.names[7:9],lty=1,col=c("black","red","blue"))

# close png device
dev.off()


setwd(old.dir)
