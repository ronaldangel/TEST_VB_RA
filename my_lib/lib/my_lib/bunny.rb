require 'mongoid'
class Bunny
  include Mongoid::Document
  include Mongoid::Timestamps
  field :article_title, type: String
  field :bunny_video, type: String
end