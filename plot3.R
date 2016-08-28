## Plot-3
## 1.Read from File in user current working directory
## 2.Filter data for date 01/02/2007-02/02/2007
## 3.Get respective x and y values and Plot Graph 
## 4.Save out put in Plot3.png

library(dplyr)

## Read File - household_power_consumption.txt from working directory

  file_data <- read.csv("household_power_consumption.txt",sep=";", 
                      header=TRUE,stringsAsFactors = FALSE,na.strings = "?")

## Filter date from file_data

  filter_by__date_data <- filter(file_data, (as.Date(file_data$Date,"%d/%m/%Y")
                                           >="2007-02-01" & as.Date(file_data$Date,"%d/%m/%Y")
                                           <="2007-02-02" ))
## Get x-axis date and time

  x_axis_date_value <- strptime (paste(filter_by__date_data$Date,
                                     filter_by__date_data$Time, sep=" "),
                               "%d/%m/%Y %H:%M:%S")

## Get y-axis Sub_metering_1,Sub_metering_2,Sub_metering_3

  y_axis_submeter_vlaue_1 <- as.numeric(filter_by__date_data$Sub_metering_1)
  y_axis_submeter_vlaue_2 <- as.numeric(filter_by__date_data$Sub_metering_2)
  y_axis_submeter_vlaue_3 <- as.numeric(filter_by__date_data$Sub_metering_3)

## Plot Graph y-axis-Sub_metering_1, type=line, y-label="Energy sub metering"    

  plot(x_axis_date_value,y_axis_submeter_vlaue_1,type = "l",
     xlab = "",ylab = "Energy sub metering")

## Add Lines on Graph y-axis-Sub_metering_2 & y-axis-Sub_metering_3, 
## type=line, y-label="Energy sub metering"

  lines(x_axis_date_value,y_axis_submeter_vlaue_2,type = "l",col="red")
  lines(x_axis_date_value,y_axis_submeter_vlaue_3,type = "l",col="blue")

## Add Legend to the Graph

  legend("topright", lty= 1, cex=0.8, col = c("Black", "red", "blue"), 
       legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Copy my plot to a PNG file - plot3.png-width=480,height=480

  dev.copy(png, file = "plot3.png", width=480,height=480) 

## close the PNG device!

  dev.off() 
  