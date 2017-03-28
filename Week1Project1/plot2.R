
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

#Plot2
png(file="plot2.png",width=480,height=480)
plot(dat$Global_active_power~dat$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()



