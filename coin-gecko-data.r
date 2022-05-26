library(httr)
library(jsonlite)
library(dplyr)
# library(geckor)

getCoinGeckoCoinList <- function(){
	res = GET('https://api.coingecko.com/api/v3/coins/list')
	data = fromJSON(rawToChar(res$content))
	return(data)
}

getCoinGeckoCoinListData <- function(page){
	res = GET('https://api.coingecko.com/api/v3/coins/markets',
		query = list(vs_currency = 'usd',
					 per_page = 250,
					 page = page))
	data = fromJSON(rawToChar(res$content))
	return(data)
}

searchCoinGeckoListData <- function(coin, coinGeckoData){
	c = coinGeckoData %>% filter(symbol == coin)
	return(c)
}



getCoinGeckoLinkedData <- function(num){	
	linkedData = list()
	for (i in 1:num) {
		linkedData[[i]] = getCoinGeckoCoinListData(i)
		# Sys.sleep(5) 
	}
	return(linkedData)
}

bindCoinGeckoSearchPages <- function(coinGeckoData){
	c = rbind_pages(coinGeckoData[sapply(coinGeckoData, length)>0])
	# c = rbind_pages(coinGeckoData)
	c  = c[which(c$total_volume > 1),,drop = FALSE]
	return(c)
}