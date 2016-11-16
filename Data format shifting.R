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


#alltitle2 = data.frame(alltitle$titleURL[1:8])
alltitle2 = data.frame()

for (i in 1:length(alltitle$titleURL))
{
  
  if(i%%8==0)
  {
    print(i)

    alltitle2=cbind(alltitle2,data.frame(alltitle$titleURL[(i-7):i]))
  }
 
}
rm(alltitle3)
