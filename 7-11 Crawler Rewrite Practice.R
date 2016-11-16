
install.packages("httr")
install.packages("XML")
library(httr)
library(XML)


rm(list=ls(all.names=TRUE))#清除所有記憶體
res = GET("http://emap.pcsc.com.tw/lib/areacode.js")
resText = content(res,"text",encoding = "utf8")
matches = gregexpr("AreaNode[(][^,]+(,[^,]+){3}",resText)##轉成LIST
cityCodesStr = unlist(regmatches(resText,matches))##用unlist轉回型態CHARACTOR

cityCodes = lapply(cityCodesStr[2:length(cityCodesStr)],function(str){
  
  return(str)
})##lapply之後會變成LIST

class(cityCodesStr)
class(cityCodes)

cityCodes = lapply(cityCodesStr[2:length(cityCodesStr)],function(str){
  matches = gregexpr("[']([^']+)[']",str)
  return(gsub("'","",unlist(regmatches(str,matches))))
})
cityCodesDf = data.frame(do.call(rbind,cityCodes))##將每筆資料用列的方式合併
colnames(cityCodesDf) = c("cityName","cityCode")##把表頭名子換掉
View(cityCodesDf)
