require_relative  'my_lib/reddit'
require_relative  'my_lib/voicebunny'
require_relative  'my_lib/mongo_action'
=begin
Module that execute code that call Reddit get the last article 
and create a new speddy project in the voice bunny API
=end
module MyLib
  def execute 

  	#reddit call
  	reddit_delegate = Reddit.new
	article = reddit_delegate.obtain_article

	#voice bunny call and param sending
	bunny_delegate = VoiceBunny.new
	bunny_respose  = bunny_delegate.add_speddy_project(article.title)
	

	#save respose in Mongo DB
	mongo_delegate = MongoAction.new
	mongo_delegate.convertJson2Object(bunny_respose, article.title)

  end 
end


