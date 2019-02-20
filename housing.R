rm(list=ls(all=T))
setwd('D:\\kaggle\\HOUSING')
getwd()
trainh<-read.csv("train.csv",header = T,sep =",")
str(trainh)
dim(trainh)

sum(is.na(trainh))
colSums(is.na(trainh))

#Utilities - important but will need classification
#Neighbourhood - imp
#BldgType
# HouseStyle
# YearBuilt
# OverallQual
# OverallCond
# SalePrice

estimate  <- subset(trainh,select= c(LotArea,BldgType,HouseStyle,YearBuilt,OverallQual,OverallCond,SalePrice))
sum(is.na(estimate))
str(estimate)
summary(estimate)
colSums(is.na(estimate))
install.packages("DMwR")

house_dummy <- dummy.data.frame(estimate,names=c("BldgType","HouseStyle"))



colnames(house_dummy)

model <-lm(SalePrice~.,data=house_dummy)

par(mfrow=c(2,2))
plot(model)
summary(model)