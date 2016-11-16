#安裝套件
install.packages("XML")
install.packages("RCurl")
install.packages("httr")

#清空記憶體與載入套件
rm(list=ls(all.names=TRUE))
library(XML)
library(RCurl)
library(httr)

#解析出文章中指定段落內容
urlPath <- "https://www.ptt.cc/bbs/movie/index.html"
temp    <- getURL(urlPath, encoding = "big5")
xmldoc  <- htmlParse(temp)
title   <- xpathSApply(xmldoc, "//div[@class=\"title\"]", xmlValue)

title#印出來

alltitle = data.frame()
subtitle = data.frame(title)
alltitle=rbind(alltitle,subtitle)
