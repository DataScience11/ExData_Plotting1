download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destFile="Project1.zip",method="curl")
file <- unzip("Project1.zip")

data <- read.table(file, header=T, sep=";")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
dT <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]
dT$Global_active_power <- as.numeric(as.character(dT$Global_active_power))
dT$Global_reactive_power <- as.numeric(as.character(dT$Global_reactive_power))
dT$Voltage <- as.numeric(as.character(dT$Voltage))
dT$Sub_metering_1 <- as.numeric(as.character(dT$Sub_metering_1))
dT$Sub_metering_2 <- as.numeric(as.character(dT$Sub_metering_2))
dT$Sub_metering_3 <- as.numeric(as.character(dT$Sub_metering_3))

dT <- transform(dT, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

