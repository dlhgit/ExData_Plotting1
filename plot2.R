#load packages
library(lubridate)
library(dplyr)

#read in raw data
data2<- read.csv("exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")


data3 <-
  data2 %>%
#convert strings to date and combine Date and Time
    mutate(DateNew = dmy(Date)) %>% 
    mutate(DateTime = paste(data2$Date, data2$Time, sep="-")) %>%
    mutate(DateTimeNew = dmy_hms(DateTime)) %>%
  
#subset data to the date ranged specified  
    filter(DateNew >= as.Date("2007-02-01") & DateNew <= as.Date("2007-02-02")) %>%
#create weekdays variable from Date
    mutate(DayNew = weekdays(as.Date(Date)))  %>%
    mutate(Day = wday(Date))  %>%
    mutate(Global_active_power = as.numeric(Global_active_power))



#specify png image dimensions
png(file="plot2.png", width = 480, height = 480, units = "px")
#create the histogram with labels and titles
with(data3, plot(DateTimeNew, Global_active_power, type = "l", xlab = '', ylab = "Global Active Power (Kilowatts)"))
#close png
dev.off()
