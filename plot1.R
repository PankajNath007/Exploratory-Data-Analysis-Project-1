## Plot-1
## 1.Read from File in user current working directory
## 2.Filter data for date 01/02/2007-02/02/2007
## 3.Create Histogram with Global active pOwer
## 4.Save output in Plot1.png in working directory


library(dplyr)

## Read File - household_power_consumption.txt from working directory

  file_data <- read.csv("household_power_consumption.txt",sep=";", 
                      header=TRUE,stringsAsFactors = FALSE,na.strings = "?")

## Filter date from file_data  

  filter_by__date_data <- filter(file_data, (as.Date(file_data$Date,"%d/%m/%Y")
                                           >="2007-02-01" & as.Date(file_data$Date,"%d/%m/%Y")
                                           <="2007-02-02" ))

## Create Histogram with Global_active Powre data, col=red, 
##  x-label  - Global Active Power (kilowatts) , title - Global Active Power

  hist(as.numeric(filter_by__date_data$Global_active_power),
     col="red",xlab="Global Active Power (killowatts)",
     main="Global Active Power")

## Copy my plot to a PNG file - plot1.png-width=480,height=480

  dev.copy(png, file = "plot1.png", width=480,height=480) 

## close the PNG device!

  dev.off() 
  