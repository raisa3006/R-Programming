
#Method 1: Select the file manually
stat <- read.csv(file.choose())
stat

#method 2: Set the working directory and read data
getwd()
#windows
setwd("C:\\Users\\Ketaki\\Desktop\\Job\\R for Data Science")
getwd()
rm(stat)
stat <- read.csv("DemographicData.csv")
stat

#-------------------------Exploring data
nrow(stat) #number of rows
ncol(stat) #number of columns
head(stat)
tail(stat, n=8)
str(stat)
summary(stat)

#-------------------Using $ sign

stat
head(stat)
stat$Internet.users[2]
levels(stat$Income.Group)

#-----------Basic operations with data frames

stat[1:10,] #subsetting
stat[3:10,]
stat[c(4,100),]

stat[1,]
is.data.frame(stat[1,])

stat$Birth.rate + stat$Internet.users

#add column

head(stat)
stat$Mycalc <- stat$Birth.rate * stat$Internet.users
# test of knowledge

stat$xyz <- 1:5
head(stat, n=12)

#removing column

stat$Mycalc <- NULL
stat$xyz <- NULL

#------------------------ Filtering data frames
head(stat)
filter <- stat$Internet.users < 2
stat[filter,]

stat[stat$Birth.rate >40,]
stat[stat$Birth.rate >40 & stat$Internet.users < 2,]
stat[stat$Income .Group == "High income",]
levels(stat$Income.Group)
stat
stat[stat$Country.Name == "Turkey",]

#------------------  Intro to qplot()

?qplot()

qplot(data= stat,x= Internet.users)
qplot(data= stat, x=Income.Group, y= Birth.rate, size=I(3),
      color = I("blue"))
qplot(data=stat,x=Income.Group, y= Birth.rate, geom="boxplot")

#-------------------- Visualizing what we need

qplot(data=stat, x=Internet.users, y= Birth.rate)
qplot(data=stat, x=Internet.users, y= Birth.rate,
      color=I("red"), size=I(4))

qplot(data=stat, x=Internet.users, y= Birth.rate,
      color=Income.Group, size=I(4))
#-------------------- Creating data frames
mydf <- data.frame(Countries_2012_Dataset,Codes_2012_Dataset,Regions_2012_Dataset)
head(mydf)
#colnames(mydf) <- c("Country", "Code", "Region")
#head(mydf)
rm(mydf)

mydf <- data.frame(Country=Countries_2012_Dataset,Code=Codes_2012_Dataset,Region=Regions_2012_Dataset)
head(mydf)
summary(mydf)
#-------------------------Merging data frames

head(stat)
head(mydf)

merged <- merge(stat, mydf, by.x="Country.Code", by.y="Code")
head(merged)
merged$Country <- NULL
str(merged)
tail(merged)
#------------------------Vizualization with qplot

qplot(data=merged,x=Internet.users, y= Birth.rate, 
      color=Region, size=I(4))
#1. shapes
qplot(data=merged,x=Internet.users, y= Birth.rate, 
      color=Region, size=I(4),shape=I(17))
#shape 2
qplot(data=merged,x=Internet.users, y= Birth.rate, 
      color=Region, size=I(4),shape=I(15))
qplot(data=merged,x=Internet.users, y= Birth.rate, 
      color=Region, size=I(4),shape=I(23))
#2. Transparency
qplot(data=merged,x=Internet.users, y= Birth.rate, 
      color=Region, size=I(4), shape=I(19),
      alpha=I(0.6), main="Birth rate vs Internet users")









