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
#Determining graphic parameters
par(mfrow = c(1, 1))
#drawing plot 2
date_time <- as.POSIXct( strptime(paste(projectset$Date, projectset$Time), "%d/%m/%Y %H:%M:%S"))  
projectset1 <- cbind(projectset, date_time)
plot(projectset1$date_time, projectset1$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = NA)
#Save to png
dev.copy(png, file = "plot2.png")
#Close file device
dev.off()