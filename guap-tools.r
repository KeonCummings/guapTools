source('coin-gecko-data.r')
source('twitter-data.r')


# login <- function() {
	
# }

# guapTools <- function(x,...) {
# 	UseMethod("guapTools")
# }


guapTools <- function(ticker, numTweets, pages){
	#Load Twitter Data
  print("loadind twitter data")
	data <- downloadTickerSymbol(ticker, numTweets)
	print("order and filter twitter data")
	data <- orderByLikeCount(data)
	#load coinGeckodata
	print("getting coin gecko data")
	cg <- getCoinGeckoLinkedData(pages)
		print("bind coin gecko data")
	cg <- bindCoinGeckoSearchPages(cg)
	allCoinData <- cg
	print("search coin gecko data")
	cg <- searchCoinGeckoListData(ticker, cg)
	
	listData <- list("twitterData" = data, "coinData" = cg, "allCoinData" = allCoinData )
	# class(listData) <- "guapTools"
	listData
}


guapTools.list <- function(obj) {
	obj$twitterData$scores
}



# getAllSentiment.guapTools <- function(obj) {
# 	allData <- list()
# 	d <- obj$allCoinData$symbol

# 	lapply(d, function(x) {
# 		allData$x = downloadTickerSymbol(x,5)
# 	})
# }