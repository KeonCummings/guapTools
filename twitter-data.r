library(rtweet)
library(dplyr)
library(vader)
library(NLP)


ticker_symbol <- "$"

combineTickerSymbol <- function(ticker, s = ticker_symbol){
	ticker = paste(c(s, ticker), collapse='')
	return(ticker)
}

downloadTickerSymbol <- function(ticker, num){
	t = combineTickerSymbol(ticker)
	tweets <- search_tweets(t, n = num, include_rts = FALSE)
	return(tweets)
}

convertTweetTextToString <- function(tweet_text){
	t = as.String(tweet_text)
	return(t)
}

getSentiment <- function(tweet_text) {
	t = get_vader(tweet_text)
	return(t)
}

orderByLikeCount <- function(tweet_data){
	tweet_data <- tweet_data %>% arrange(desc(favorite_count))
	return(tweet_data)
}

#remove row if url_t.co is empty
#create data table with screen_name, created_at, tweet_text, favorite_count, retweet_count
#create a column for vader compound score
#create a column that is Boolean values for Negative Sentiment rows
#create a column that is Boolean values for Positive Sentiment rows
