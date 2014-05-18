require 'redditkit'
require 'faraday'
require 'faraday_middleware'


=begin
class that implements the methods to call the Voice Bunny API  
Author: Ronald Angel 18/05/2014
version: 1.0
=end

class VoiceBunny

=begin
creating a client using the Bunny API in this case only for my use (remember is only a test so I do not want to get params)
=end  
  def initialize
    @conn = nil
    @api_id = "30291"
    @api_key = "56ac35424ab1091e754bed76f9a3af8e"
    @conn = Faraday.new(:url =>("https://"+ @api_id+":"+@api_key +"@api.voicebunny.com"),:ssl => {:verify => false}) do |builder|
    builder.use Faraday::Request::Multipart
    builder.use Faraday::Request::UrlEncoded
    builder.use Faraday::Response::ParseJson
    builder.use Faraday::Adapter::NetHttp     
    end
  end


=begin
this method add a new speedy project with the article title
=end 
  def add_speddy_project (article_title)
    unless @conn.nil?
      response = @conn.post '/projects/addSpeedy.json', {
      script: '{
              "Part001":"the last trend in our search engine is: #{article_title} [with animosity] by Ronald Angel"
          }',
      title: "#{article_title}",
      language: 'eng-us',
      genderAndAge: 'middleAgeMale',
      lifetime: 86400,
      remarks: 'I want a really friendly voice, in the Part002 please be enfatic.',
      syncedRecording: 1,
      test:1,
      ping: 'api@voicebunny.com',
      price: 50
    }
    return response.body
    end
  end
end
