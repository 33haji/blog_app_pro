class SnsController < ApplicationController
  def index
  end
  
  def show_tweet
    # ツイートを取得するユーザの情報を入力(https://apps.twitter.com/app/13387945/keys)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key = 'kCkMgUTATeUvpA35bwaiStQGz'
      config.consumer_secret = 'M72sdleYaODgvesih5kmELMZ1QZDkvjaKIeKi6FZcZzDVT97nI'
      config.access_token = '421844065-FvliSOfqAcmp5zrvRJnKWQhmloc9kBE5JktqR6Qq'
      config.access_token_secret = 'DhyTBuW6UcMK7hR5vZhoNpLxlVtjr8h9gHlxWW8hQFvtX'
    end
    
    # 過去100ツイートを取得
    tweets = client.user_timeline(:count => 100).map do |tweet|
      {
        icon: tweet.user.profile_image_url,
        text: tweet.full_text,
        rt: tweet.retweet_count,
        fv: tweet.favorite_count,
        date: tweet.created_at.in_time_zone.strftime("%Y-%m-%d %H:%M:%S"),
        image: tweet.media.first.nil? ? 'no_image.png' : tweet.media.first.media_url
      }
    end
    # 'いいね'の多い10ツイート
    @favorite_tweets = tweets.sort{|a, b| b[:fv] <=> a[:fv] }.take(10)
    # 順位を決定する
    @ranking = get_tweet_ranking(@favorite_tweets)
  end
  
  def show_instagram
    # Instagramのユーザー情報を入力(https://www.instagram.com/developer/clients/5047b6c5fe7142b4a33efdb1072b0442/edit/)
    Instagram.configure do |config|
      config.client_id = "5047b6c5fe7142b4a33efdb1072b0442"
      config.client_secret = "cd1ba1ac8ec24c3281b5993e9125b03e"
    end
    
    # 過去100件の投稿を取得
    articles = Instagram.user_recent_media("3252535225", {:count => 100}, access_token: '3252535225.5047b6c.b736a42d1a6543e794595e722d9d81ea')
    # 'いいね'の多い10件
    @favorite_articles = articles.sort{|a, b| b[:likes][:count] <=> a[:likes][:count] }.take(10)
    # 順位を決定する
    @ranking = get_instagram_ranking(@favorite_articles)
  end
  
  private
  
    # Tweetランキングを示す配列を返す
    def get_tweet_ranking(tweets)
      ranking = []
      count = 1
      rank = 1
      pre_fv = 0
      tweets.each do |tweet|
        if ranking.empty? || pre_fv == tweet[:fv]
          ranking << rank
          pre_fv = tweet[:fv]
        elsif pre_fv != tweet[:fv] && count <= 3
          rank = rank + 1
          ranking << rank
          pre_fv = tweet[:fv]
        else
          ranking << 0
        end
        count = count + 1
      end
      ranking
    end
    
    # Instagramの投稿ランキングを示す配列を返す
    def get_instagram_ranking(articles)
      ranking = []
      count = 1
      rank = 1
      pre_fv = 0
      articles.each do |article|
        if ranking.empty? || pre_fv == article[:likes][:count]
          ranking << rank
          pre_fv = article[:likes][:count]
        elsif pre_fv != article[:likes][:count] && count <= 3
          rank = rank + 1
          ranking << rank
          pre_fv = article[:likes][:count]
        else
          ranking << 0
        end
        count = count + 1
      end
      ranking
    end
end