library(ggplot2)
library(ggthemes)
library(lubridate)
library(dplyr)
library(tidyr)
library(DT)
library(scales)

#Trips hour wise
hour_data <- data_2014 %>%
    group_by(hour) %>%
    summarise(Total = n())


ggplot(hour_data, aes(hour, Total))+
    geom_bar( stat = "identity", fill = "steelblue", color = "red") +
    ggtitle("Trips Every Hour") +
    theme(legend.position = "none") +
    scale_y_continuous(labels = comma)

#Trips hour wise for each month
month_hour <- data_2014 %>%
    group_by(month,hour) %>%
    summarise(Total = n())

ggplot(month_hour, aes(hour, Total, fill = month)) + 
    geom_bar( stat = "identity") +
    ggtitle("Trips by Hour and Month") +
    scale_y_continuous(labels = comma)

#Trips days wise throughout the data
day <- data_2014 %>%
    group_by(day) %>%
    summarise(Total = n())

ggplot(day, aes(day, Total))+
    geom_bar( stat = "identity", fill = "steelblue", color = "red") +
    ggtitle("Trips Every Day") +
    theme(legend.position = "none") +
    scale_y_continuous(labels = comma)

#Trips days wise for every month
day_month_group <- data_2014 %>%
    group_by(month, day) %>%
    summarize(Total = n())


ggplot(day_month_group, aes(day, Total, fill = month)) + 
    geom_bar( stat = "identity") +
    ggtitle("Trips by Day and Month") +
    scale_y_continuous(labels = comma) +
    scale_fill_manual(values = colors)

#Trips days of the week wise
wday_month <- data_2014 %>%
    group_by( month, dayofweek) %>%
    summarise(Total = n())

ggplot(wday_month, aes(month, Total, fill = dayofweek)) + 
    geom_bar( stat = "identity", position = "dodge2") +
    ggtitle("Trips by Weekday and Month") +
    scale_y_continuous(labels = comma)+
    scale_fill_manual(values = colors)


#Trips Month wise
month_data = data_2014 %>%
    group_by(month) %>%
    summarise(Total = n())

ggplot( month_data, aes(month, Total, fill = month)) + 
    geom_bar( stat = "identity") +
    ggtitle("Trips by Month") +
    theme(legend.position = "none") +
    scale_y_continuous(labels = comma)

#Trips Base Wise
base_data = data_2014 %>%
    group_by(Base) %>%
    summarise(Total = n())

ggplot(base_data, aes(Base, Total, fill = Base))+
    geom_bar(stat = "identity")+
    ggtitle("Trips Bases wise")+
    theme(legend.position = "none")+
    scale_y_continuous(labels = comma)

#Trips Base Wise every month

base_month = data_2014 %>%
    group_by(month, Base) %>%
    summarise(Total = n())


ggplot(base_month, aes(Base, Total,  fill = month)) +
    geom_bar(stat = "identity", position = "dodge")+
    ggtitle("Trips Base wise for each Month")+
    scale_y_continuous(labels = comma)

#Trips Base Wise every weekday

base_wday = data_2014 %>%
    group_by( Base,dayofweek) %>%
    summarise(Total = n())


ggplot(base_wday, aes(Base, Total,  fill = dayofweek)) +
    geom_bar(stat = "identity", position = "dodge")+
    ggtitle("Trips Base wise for each weekday")+
    scale_y_continuous(labels = comma)



