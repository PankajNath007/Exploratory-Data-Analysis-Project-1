## Plot-2
## 1.Read from File in user current working directory
## 2.Filter data for date 01/02/2007-02/02/2007
## 3.Get respective x and y values and Plot Graph 
## 4.Save out put in Plot2.png


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


## Get y-axis value - Global_active_power

  y_axis_power_vlaue <- as.numeric(filter_by__date_data$Global_active_power)

## Plot Graph x-axis, y-axis, y-label="Global_active_power", 
## title= Global Active Power (kilowatts) 

  plot(x_axis_date_value,y_axis_power_vlaue,typ="l",xlab = "",
     ylab = "Global Active Power (kilowatts)")
     

## Copy my plot to a PNG file - plot2.png-width=480,height=480

  dev.copy(png, file = "plot2.png",width=480,height=480) 

## close the PNG device!

  dev.off() 
  