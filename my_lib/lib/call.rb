require './my_lib.rb'
include MyLib

bunny_respose_object = execute
puts " se ha publicado el video: #{bunny_respose_object.bunny_video} en una BD Mongo, ahora consultalo en la web"
