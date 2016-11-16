install.packages("XML")
install.packages("RCurl")
install.packages("httr")
rm(list=ls(all.names=TRUE))#清除所有記憶體
library(XML)
library(RCurl)
library(httr)

startNo = 1
endNo   = 10##頁數起始宣告
subPath = "https://www.ptt.cc/bbs/joke/index"
alltitle = data.frame()
for( i in c(startNo:endNo) )##跑一到十頁次
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
for( j in 1:length(alltitle$titleURL))##把抓出來的東西一一存檔
{
  content = paste(mainURL,alltitle$titleURL[j],sep="")
  filename = paste("C:/Users/Katusha/Desktop/temp/temp", j, ".txt", sep = "")
  write(content, filename)

}