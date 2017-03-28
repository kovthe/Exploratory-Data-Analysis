
initial <- read.table("household_power_consumption.txt", nrows = 100)
classes <- sapply(initial, class)
tabAll <- read.table("household_power_consumption.txt",sep=";",header = TRUE, na.strings ="?")
tabAll$Date <- as.Date(tabAll$Date, "%d/%m/%Y")
subdata <- subset(tabAll,tabAll$Date >= "2007-02-01" & tabAll$Date <= "2007-02-02")
subdata <- na.omit(subdata)
DateTime <- with(subdata, as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"))
dat <- subset(subdata, select=-c(Date,Time))
dat <- cbind(DateTime,dat)
head(dat)

#Plot3
png(file="plot3.png",width=480,height=480)

plot(dat$Sub_metering_1~dat$DateTime, type="l", ylab="Enerygy sub metering", xlab="",ylim = c(0,30))
par(new=TRUE)
plot(dat$Sub_metering_2~dat$DateTime, type="l",ann=FALSE, axes=FALSE, col = "orange",ylim = c(0,30))
par(new=TRUE)
plot(dat$Sub_metering_3~dat$DateTime, type="l",ann=FALSE, axes=FALSE,col = "blue",ylim = c(0,30))
legend(x="topright", col=c("black", "red", "blue"), lwd=c(1,1,1),legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
