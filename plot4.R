## Plot-4 
## 1.Read from File in user current working directory
## 2.Filter data for date 01/02/2007-02/02/2007
## 3.Construct a 2x2 layout to fit 4 Graphs
## 4.Get respective x and y values and Plot 4 Graphs
## 5.Save out put in Plot4.png

library(dplyr)

## Read File - household_power_consumption.txt from working directory

  file_data <- read.csv("household_power_consumption.txt",sep=";", 
                      header=TRUE,stringsAsFactors = FALSE,na.strings = "?")

## Filter date from file_data  

  filter_by__date_data <- filter(file_data, (as.Date(file_data$Date,"%d/%m/%Y")
                                           >="2007-02-01" & as.Date(file_data$Date,"%d/%m/%Y")
                                           <="2007-02-02" ))

## construct layout

  par(mfrow=c(2,2))

## - Plot-1 - get x and y values and plot Graph

  x_axis_date_value <- strptime (paste(filter_by__date_data$Date,filter_by__date_data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
  y_axis_power_vlaue <- as.numeric(filter_by__date_data$Global_active_power)

  plot(x_axis_date_value,y_axis_power_vlaue,typ="l",xlab = "",
     ylab = "Global Active Power (kilowatts)")

## - Plot-2 - get  y values and plot Graph

  y_axis_voltage_vlaue <- as.numeric(filter_by__date_data$Voltage)

  plot(x_axis_date_value,y_axis_voltage_vlaue,type="l",xlab = "datetime",
     ylab = "Voltage")

## - Plot-3 - get  y values (submeter_1,submeter_2,submeter_3) 

  y_axis_submeter_vlaue_1 <- as.numeric(filter_by__date_data$Sub_metering_1)
  y_axis_submeter_vlaue_2 <- as.numeric(filter_by__date_data$Sub_metering_2)
  y_axis_submeter_vlaue_3 <- as.numeric(filter_by__date_data$Sub_metering_3)

## - Plot-3 - Plot graph type=line no x-label, y-label="Energy sub metering"

  plot(x_axis_date_value,y_axis_submeter_vlaue_1,type = "l",xlab = "",
     ylab = "Energy sub metering")

## - Plot-3 - add lines for submeter_2 and submeter_3 with colour

  lines(x_axis_date_value,y_axis_submeter_vlaue_2,type = "l",col="red")
  lines(x_axis_date_value,y_axis_submeter_vlaue_3,type = "l",col="blue")

## - Plot-3 - Add Legend to Plot-3 Graph  

  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

## - Plot-4 - get  y values (Submeter_1 ,2,3) and plot Graph

  y_axis_reactive_power <- as.numeric(filter_by__date_data$Global_reactive_power)

## - Plot-4 - Plot graph type=line x-label="datetime", y-label="Global_reactive_power"  

  plot(x_axis_date_value,y_axis_reactive_power,typ="l",xlab = "datetime",ylab = "Global_reactive_power")

## Copy my plot to a PNG file- plot4.png-width=480,height=480

  dev.copy(png, file = "plot4.png",width=480,height=480) 

## close the PNG device!

  dev.off()
  