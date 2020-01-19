require_relative './concerns.rb'
class Studios
  extend Scrape::ClassMethods
  include Scrape::InstanceMethods
  @@all=[]
  attr_accessor :name, :studio, :url
  def initialize(name)
    @name=name
    save
  end
  def self.all
    @@all
  end
  def save
    @@all<<self
  end
  def self.today
    puts self.all.each_with_index{|studio, index|puts "#{index+1} #{studio.name}"}
  end
  def url
    @formatted = self.name.split(' ').join('_').scan(/\w+/).join('').split('_').join('-').downcase
    @url = "https://www.anime-planet.com/anime/studios/#{@formatted}"
  end
  def animes
    Anime.all.each do |anime|
      if anime.studio==self
        puts anime.name
      end
    end
  end
  def studio=
    self.class.all.find{|studio|studio.url==self.url}
  end
end

studio_names=xml1.css('tr a').text.split(/\d+ anime/)
studio_1= Studios.new(studio_names[0])
studio_2= Studios.new(studio_names[1])
studio_3= Studios.new(studio_names[2])
studio_4= Studios.new(studio_names[3])
studio_5= Studios.new(studio_names[4])
