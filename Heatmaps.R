library(ggplot2)
library(ggthemes)
library(lubridate)
library(dplyr)
library(tidyr)
library(DT)
library(scales)


#Hour and Day

hour_day = data_2014 %>%
    group_by(day,hour) %>%
    summarise(Total = n())

ggplot(hour_day, aes(day, hour, fill = Total))+
    geom_tile(col = "white")+
    ggtitle("Heat Map by Hour and Day")    


#Month and Day

ggplot(day_month_group, aes(month, day, fill = Total))+
    geom_tile(col = "white")+
    ggtitle("Heat Map by Month and Day")

# Weekday and Month

ggplot(wday_month, aes(month, dayofweek,fill = Total))+
    geom_tile(col = "white")+
    ggtitle("Heat map by Month and Weekday")



#Base and month

ggplot(base_month, aes(Base, month, fill = Total))+
    geom_tile(col = "white")+
    ggtitle("Heat map by Base and Month")

#Base and weekday

ggplot(base_wday, aes(Base, dayofweek, fill = Total))+
    geom_tile(col = "white")+
    ggtitle("Heat map by Base and Weekday ")

