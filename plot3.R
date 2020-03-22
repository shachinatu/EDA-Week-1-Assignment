tx  <- readLines("D:/Coursera/JH_4_EDA/household_power_consumption.txt")
tx2  <- gsub(pattern = ";", replace = ",", x = tx)
head(tx2)
writeLines(tx2, con="D:/Coursera/JH_4_EDA/tx2.csv")

install.packages("tidyverse")
library(tidyverse)
library(dplyr)
install.packages(lubridate)
library(lubridate)
df=read.csv("D:/Coursera/JH_4_EDA/tx2.csv",header = TRUE,stringsAsFactors = FALSE)

# str(df)
# head(df)
# names(df)
# 
# class(df$Date)

df1 <- df %>% filter(Date %in% c("1/2/2007" , "2/2/2007"))

# class(df1$Date)
# head(df1)

df1$Global_active_power <- as.numeric(df1$Global_active_power)
head(df1$Global_active_power)

# str(df1)
# summary(df1)

df1$Sub_metering_1<- as.numeric(df1$Sub_metering_1)
df1$Sub_metering_2 <- as.numeric(df1$Sub_metering_2)

#df1$Sub_metering_3 <- as.character(df1$Sub_metering_3)
#str(df1)

datetime <- strptime(paste(df1$Date,df1$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

png("plot3.png", width=480, height=480)
plot(datetime,df1$Sub_metering_1,type ="l", xlab="", ylab = "Energy sub metering")
lines(datetime,df1$Sub_metering_2,type= "l",col="red")
lines(datetime,df1$Sub_metering_3,type="l",col="blue")
legend("topright",c("sub_metering_1","sub_metering_2","sub_metering_3"),lty=1, lwd=2.5, col = c("black","red","blue"))
dev.off()

