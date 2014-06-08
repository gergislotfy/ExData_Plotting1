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
#drawing plot 1
hist(projectset$Global_active_power, col= "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", freq = TRUE, xlim = c(0,6), ylim = c(0, 1200))
#Determining graphic parameters
par(mfrow = c(1, 1))
#Save to png
dev.copy(png, file = "plot1.png")
#Close file device
dev.off()