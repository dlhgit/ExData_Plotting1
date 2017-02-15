#load packages
library(lubridate)
library(dplyr)

#read in raw data
data2<- read.csv("exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")
data3 <-
  data2 %>%
#convert strings to date
    mutate(DateNew = dmy(Date)) %>% 
#subset data to the date ranged specified  
    filter(DateNew >= as.Date("2007-02-01") & DateNew <= as.Date("2007-02-02")) 

#specify png image dimensions
png(file="plot1.png", width = 480, height = 480, units = "px")
#create the histogram with labels and titles
hist(data3$Global_active_power, col="Red", xlab="Global Active Power (kilowatts)", main = "Global Active Power")
#close png
dev.off()
