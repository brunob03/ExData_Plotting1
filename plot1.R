# set the new working directory saving the previous one
old.dir=getwd()
setwd(paste(old.dir,"/Coursera/Exploratory Data Analysis/week1",sep=""))


# only records we are interested in
var.names=colnames(read.table("household_power_consumption.txt",sep=";",header=T,nrows=1))
ElPowCon=read.table("household_power_consumption.txt",sep=";",header=T, skip=66636,nrows=2880)
colnames(ElPowCon)= var.names

# open png device
png(filename = "plot1.png", width = 480, height = 480)

par(bg='transparent')
with(ElPowCon, hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)"))

# close png device
dev.off()


setwd(old.dir)
