install.packages("XML")
install.packages("RCurl")
install.packages("httr")
rm(list=ls(all.names=TRUE))#清除????????憶???
library(XML)
library(RCurl)
library(httr)

startNo = 1
endNo   = 10##???數起???宣???
subPath = "https://www.ptt.cc/bbs/joke/index"
alltitle = data.frame()
for( i in c(startNo:endNo) )##跑???????????次
{
  print(i)
  urlPath  = paste(subPath, i, ".html", sep = "")
  temp     = getURL(urlPath)
  xmlData  = htmlParse(temp) 
  titleURL = xpathSApply(xmlData, "//div[@class=\"title\"]/a//@href")
  #titleURL2 = xpathSApply(xmlData, "//div[@class=\"title\"]",xmlValue)
  subtitle = data.frame(titleURL)
  alltitle = rbind(alltitle, subtitle)
}
mainURL<-"https://www.ptt.cc"

content = paste(mainURL,alltitle$titleURL,sep="")
filename = paste("C:/Users/Katusha/Desktop/temp/temp.txt", sep = "")
write(content, filename)

alltitle$titleURL <- as.character(alltitle$titleURL)
subtitle$titleURL <- as.character(subtitle$titleURL)

#alltitle2 = data.frame(alltitle$titleURL[1:8])

###############################
grp <- rep(1:ceiling(192/8), each=8) # 192 can be replaced by nrow(alltitle) 每個數字會跑出8次

alltitle2=as.data.frame(split(alltitle$titleURL[1:192], grp))
##依照上面的結果迴圈結果將派給不同數字,再將同數字的分成同組

c(1,1,2,2)
alltitle2=as.data.frame(split(alltitle$titleURL[1:4], c(1,1,2,2)))
