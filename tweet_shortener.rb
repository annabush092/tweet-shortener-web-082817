def dictionary
  {
    "hello" => "hi",
    "to" => "2",
    "too" => "2",
    "two" => "2",
    "for" => "4",
    "four" => "4",
    "be" => "b",
    "you" => "u",
    "at" => "@",
    "and" => "&"
  }
end

def word_substituter(tweet)
  tweet_array = tweet.split(" ")
  edited_tweet = []
  tweet_array.each do |word|
    dictionary_match = dictionary.keys.find do |dictionary_key|
      dictionary_key == word.downcase
    end
    if dictionary_match != nil
      edited_tweet << dictionary[dictionary_match]
    else
      edited_tweet << word
    end
  end
  edited_tweet.join(" ")
end

def bulk_tweet_shortener(tweet_array)
  tweet_array.each do |tweet|
    puts word_substituter(tweet)
  end
end

def selective_tweet_shortener(tweet)
    if tweet.size > 140
      word_substituter(tweet)
    else
      tweet
    end
end

def shortened_tweet_truncator(tweet)
  edited_tweet = selective_tweet_shortener(tweet)
  if edited_tweet.size > 140
    edited_tweet[0...137] + "..."
  else
    edited_tweet
  end
end
