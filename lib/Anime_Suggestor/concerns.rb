require 'pry'
require '../Anime_Suggestor.rb'
module Scrape
  module InstanceMethods
    @@all=[]
    def save
      @@all<<self
    end
  end
  module ClassMethods
    @@all=[]
    def all
      @@all
    end
  end
end
