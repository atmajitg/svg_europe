##############################################
##loading the libraries and initial raw data
##############################################
# link https://commons.wikimedia.org/wiki/File:Eastern-Europe-map2.svg
library(dplyr)
dbtgdp = read.csv("dbtgdp.csv", stringsAsFactors = FALSE) # load the data in r
##############################################
##Assigning colors to the data
##############################################
brks = c(0,25,60,75,100,160,190)
clrs = cut(dbtgdp$Value, breaks=brks, labels=c("#1b7837","#7fbf7b","#d9f0d3","#e7d4e8","#af8dc3","#762a83"))
##############################################
##assigning the 2 letter Euro country code
##############################################
a = dbtgdp[,1]
a =gsub("AUT","at",a)
a = gsub("BEL","be",a)
a = gsub("FIN","fi",a)
a = gsub("FRA","fr",a)
a = gsub("DEU","de",a)
a = gsub("GRC","gr",a)
a = gsub("IRA","ie",a)
a = gsub("IRL","il",a)
a = gsub("ITA","it",a)
a = gsub("LUX","lu",a)
a = gsub("NLD","nl",a)
a = gsub("PRT","pt",a)
a = gsub("SVK","sk",a)
a = gsub("ESP","es",a)
a = gsub("EST","ee",a)
a = gsub("SVN","si",a)
##############################################
##binding ALL THE DATA and filtering it
##############################################
dbtgdp=cbind(dbtgdp,clrs,a)
euro.area.1995 = filter(dbtgdp, TIME==1995) # extract the data for 1995
euro.area.1995$Value= round(euro.area.1995$Value,2) # round the debt to gdp ratio to 2 decimal places
euro.area.2015 = filter(dbtgdp, TIME==2015) # extract the data for 2015
euro.area.2015$Value= round(euro.area.2015$Value,2) # round the debt to gdp ratio to 2 decimal places
##############################################
##generate the css <style> tags for the svg
##############################################
pstedata = matrix(NA,nrow=nrow(euro.area.2015),ncol = 2)
for ( i in 1:nrow(euro.area.2015)){
  pstedata[i,1]= paste("#",euro.area.2015[i,10],sep="")
  pstedata[i,2]= paste(pstedata[i,1]," ","{","fill:",euro.area.2015[i,9],"!important","}",sep=" ")
}

write.table(pstedata[,2],file="2015.csv",row.names = FALSE) # save the style tags



