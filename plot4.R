#downloading file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile= "./project1.zip")
#download date saving
download_date <- date()
#unzipping and exploring  the name and extension of the data file
unzip("project1.zip", list= TRUE)
# Importing data
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";" , na.strings = "?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
# subsetting by date
projectset<- data[data$Date%in% c("1/2/2007" , "2/2/2007"), ]
#Setting language
Sys.setlocale(category = "LC_TIME", locale = "C")
#drawing plot 4
#1st plot
plot(projectset1$date_time, projectset1$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = NA)
#2nd plot
plot(projectset1$date_time, projectset1$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
#3rd plot
plot(projectset1$date_time, projectset1$Sub_metering_1 , type = "l", ylab = "Energy sub metering", xlab = NA)
lines(projectset1$date_time,projectset1$Sub_metering_2, col = "red" )
lines(projectset1$date_time,projectset1$Sub_metering_3, col = "blue" )
legend("topright",30, lty=c(1, 1, 1), pt.cex=1, cex=0.5 , col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#4th plot
plot(x= projectset1$date_time, y = projectset1$Global_reactive_power, type = "l", ylab = "Global_relative_power", xlab = "datetime")
#Determining graphic parameters
par(mfrow = c(2, 2), mar = c(2, 4, 1, 1), oma = c(1, 1, 0, 0))
#Save to png
dev.copy(png, file = "plot4.png")
#Close file device
dev.off()