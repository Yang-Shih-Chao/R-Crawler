install.packages("XML")
install.packages("RCurl")
install.packages("httr")
rm(list=ls(all.names=TRUE))#清除??�??��?�憶�?
library(XML)
library(RCurl)
library(httr)
lastpage <- unlist(xpathSApply(htmlParse( getURL(paste0("https://www.ptt.cc/bbs/Food/index.html"))),  "//div[@class='btn-group btn-group-paging']/a",xmlGetAttr, "href"))[2]
