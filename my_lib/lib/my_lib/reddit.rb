require 'redditkit'
require 'faraday'
require 'faraday_middleware'


=begin
class that implements the methods to call the reddit API  
Author: Ronald Angel 18/05/2014
version: 1.0
=end

class Reddit

=begin
creating a client using redditkit in this case only for my use (remember is only a test so I do not want to get params)
=end  
  def initialize
    @client = RedditKit::Client.new 'rangel89_1', '11caldas'
  end


=begin
this method call the first trend article found in Reddit API using the wrapper redditkit
=end 
  def obtain_article 
    #getting the first article in the front_page
    if (@client.signed_in?)
	    articles = RedditKit.front_page
	    article = articles.first
	end
    return article 
  end
end



