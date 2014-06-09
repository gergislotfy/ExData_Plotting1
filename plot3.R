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
# creating a datetime variable and adding it to the data.frame
date_time <- as.POSIXct( strptime(paste(projectset$Date, projectset$Time), "%d/%m/%Y %H:%M:%S"))
projectset1 <- cbind(projectset, date_time)
#Setting language
Sys.setlocale(category = "LC_TIME", locale = "C")
#Determining graphic parameters
par(mfrow = c(1, 1), mar = c(1, 4, 2, 1), oma = c(1, 1, 0, 0))
#drawing plot 3
plot(projectset1$date_time, projectset1$Sub_metering_1 , type = "l", ylab = "Energy sub metering", xlab = NA)
lines(projectset1$date_time,projectset1$Sub_metering_2, col = "red" )
lines(projectset1$date_time,projectset1$Sub_metering_3, col = "blue" )
legend("topright",30, lty=c(1, 1, 1),pt.cex=1, cex=0.75, col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#Save to png
dev.copy(png, file = "plot3.png")
#Close file device
dev.off()
