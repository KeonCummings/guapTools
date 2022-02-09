source('coin-gecko-data.r')
source('twitter-data.r')


guapTools <- function(ticker, num){
	d <- downloadTickerSymbol(ticker, num)
	d <- orderByLikeCount(d)

	print('getting sentiment data')

	vaderConvert <- function(d) {
		text = convertTweetTextToString(d)
		sentiment = get_vader(text)
		vaderScore = as.double(sentiment[[3]]) 
	}

	scoreData <- lapply(d$text, vaderConvert)
	scoreData <- unlist(scoreData)
	d$scores <- scoreData

	attr(d, "class") <- "guapTools"
	d
}

# guapTools.addVader <- function(d) {
	
# }
