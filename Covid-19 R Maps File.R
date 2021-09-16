#comments and coding file
#load data
#https://github.com/nytimes/covid-19-data

#Change filepath
us.states.csv <- read.csv("INSERT FULL FILE PATH for us-states.csv.txt")
us.counties.csv<-read.csv("INSERT FULL FILE PATH for us-counties.csv.txt")

#Declare Columns as vectors. 
Date<-us.states.csv[1]
State<-us.states.csv[2]
FIPS<-us.states.csv[3]
Case<-us.states.csv[4]
Deaths<-us.states.csv[5]

Date<-us.counties.csv[1]
County<-us.counties.csv[2]
State2<-us.counties.csv[3]
FIPS<-us.counties.csv[4]
Case2<-us.counties.csv[5]
Deaths2<-us.counties.csv[6]

#check if character or numeric
sapply(us.states.csv, class)
sapply(us.counties.csv, class)

#install and load packages for manipulation

install.packages("ggplot2")
install.packages("tidyverse")
install.packages("dplyr")
install.packages("usmap")


library("ggplot2")
library("tidyverse")
library("dplyr")
library("usmap")

#cleaning and sorting through the data
class(Case)
#"data.frame"
class(Deaths)
#"data.frame"
class(Date)
#"data.frame"

#All are data frames. change to numeric for statistics purposes (ex, mean, median, mode, etc...)
num.Case<-as.numeric(unlist(Case))
num.Deaths<-as.numeric(unlist(Deaths))
AS.Date<-as.Date(unlist(Date))
char.State<-as.character(unlist(State))
class(AS.Date)

#print vectors to check data 
num.Case
num.Deaths
AS.Date
char.State

#data cleaning and vector creation for counties data
num.Cases2<-as.numeric(unlist(Case2))
num.Deaths2<-as.numeric(unlist(Deaths2))
AS.Date2<-as.Date(unlist(Date))
char.County<-as.character(unlist(County))
class(AS.Date2)

#print vector to check data 
num.Cases2
num.Deaths2
AS.Date2
char.County

#merge data sets in usmap and the NYT covid data set for statistics purposes 
us_map_data<-merge(us.states.csv, citypop)
us_map_data
us_map_data_2<-merge(us.counties.csv, citypop)
us_map_data_2

#diagnositic statistics. Reports mean. For Deaths and Cases, find a work around for mean. You need a 7-day rolling average
sapply(us_map_data, mean, na.rm=TRUE)
sapply(us_map_data_2, mean, na.rm=TRUE)

#creates image file and plots a map. Then saves file to the directory 
#This code sums the death columns automatically.Some images use scientific notation to report cases. Please note that the scale map_df[,values] does not display the number of deaths/cases correctly in the 
#most updated file. This program was written in May 2020 when the cases/death numbers were not quite as large.As a result, the color of the graphs are off when using the most updated data set

jpeg(file = "INSERT FULL FILE PATH for saving image/Northeast Region Death.jpeg", width = 1050, height = 1050)
map1<-plot_usmap(data=us_map_data, values="deaths", color="white", include = .northeast_region, labels=TRUE,label_color="white")+ theme(legend.position="top")+labs(color="Deaths")
map1
dev.off()

map1


jpeg(file = "INSERT FULL FILE PATH for saving image/East North Central.jpeg", width = 1050, height = 1050)
map2<-plot_usmap(data=us_map_data, values="deaths", color="white", include = .east_north_central, labels=TRUE,label_color="white")+ theme(legend.position="top")+labs(color="Deaths")  
map2
dev.off()

map2

jpeg(file = "INSERT FULL FILE PATH for saving image/Northeast Region Cases.jpeg", width = 1050, height = 1050)
map3<-plot_usmap(data=us_map_data, values="cases", color="white", include = .northeast_region, labels=TRUE,label_color="white")+ theme(legend.position="top")+labs(color="Cases") 
map3
dev.off()

map3

jpeg(file = "INSERT FULL FILE PATH for saving image/Mid Atlantic Death.jpeg", width = 1050, height = 1050)
map4<-plot_usmap(data=us_map_data, values="deaths", color="white", include = .mid_atlantic, labels=TRUE,label_color="white")+ theme(legend.position="top")+labs(color="Deaths")
map4
dev.off()

map4

jpeg(file = "INSERT FULL FILE PATH for saving image/Mid Atlantic Cases.jpeg", width = 1050, height = 1050)
map5<-plot_usmap(data=us_map_data, values="cases", color="white", include = .mid_atlantic, labels=TRUE,label_color="white")+ theme(legend.position="top")+labs(color="Cases")
map5
dev.off()

map5

jpeg(file = "INSERT FULL FILE PATH for saving image/NJ Cases.jpeg", width = 1050, height = 1050)
map6<-plot_usmap(data=us_map_data_2, values="cases", region="counties", include = "NJ",labels=TRUE,label_color="white")+ theme(legend.position="top")+labs(color="Cases")
map6
dev.off()

map6

jpeg(file = "INSERT FULL FILE PATH for saving image/NJ Deaths.jpeg", width = 1050, height = 1050)
map7<-plot_usmap(data=us_map_data_2, values="deaths", region="counties", include = "NJ",labels=TRUE,label_color="white")+ theme(legend.position="top")+labs(color="Deaths")
map7
dev.off()

map7

jpeg(file = "INSERT FULL FILE PATH for saving image/US Deaths.jpeg", width = 1050, height = 1050)
map8<-plot_usmap(data=us_map_data, values="deaths", color="white", labels=TRUE,label_color="white")+ theme(legend.position="top")+labs(color="Deaths")
map8
dev.off()

map8

jpeg(file = "INSERT FULL FILE PATH for saving image/US Cases.jpeg", width = 1050, height = 1050)
map9<-plot_usmap(data=us_map_data, values="cases", color="white", labels=TRUE,label_color="white")+ theme(legend.position="top")+labs(color="Cases")
map9
dev.off()

map9
