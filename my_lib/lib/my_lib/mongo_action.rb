require 'json'
require 'mongoid'
require_relative  'bunny'
require 'hashie'

=begin
class that implements the action to save the responses in a Mongo DB 
Author: Ronald Angel 18/05/2014
version: 1.0
=end

class MongoAction

=begin
creating a client using redditkit in this case only for my use (remember is only a test so I do not want to get params)
=end  
	def convertJson2Object(response_body, article_title)
		 bunny = nil 
		 begin  
			
			Mongoid.load!("mongoid.yml", :development)
		    

		    bunny = Bunny.new(bunny_video: response_body['project']['reads'][0]['urls']['Part001']['default'],
				article_title: article_title )

		    bunny.save!
		   

		#I know I must manage exceptions from especific to general, but in this case (test) I do not have much time
		rescue Exception => e 
			puts e.message  
		  	puts e.backtrace.inspect  
		ensure
	  		Mongoid::Sessions.default.disconnect
		end

		return bunny

	end

end
