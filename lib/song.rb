require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []


  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song

#binding.pry
 end


 def self.create_by_name(name)
song = self.create
 song.name = name
 song

#binding.pry

 end

 def self.find_by_name(song)
self.all.find do |name|
  name.name == song


  end
end

def self.find_or_create_by_name(song)
  self.find_by_name(song) || self.create_by_name(song)
end

def self.alphabetical
  self.all.sort_by do |song|
    song.name
  #binding.pry
end
end

def self.new_from_filename(name)
  full_song = name.split(" - ")
  artist = name.split(" - ")[0]
  song_name = name.split(' - ')[1].split(".")[0]

  song = self.new
   song.name = song_name
   song.artist_name = artist
   song
#binding.pry
end

def self.create_from_filename(name)


full_song = name.split(" - ")
artist = name.split(" - ")[0]
song_name = name.split(' - ')[1].split(".")[0]

song = self.create
 song.name = song_name
 song.artist_name = artist
 song
end

def self.destroy_all
  self.all.clear
end

end
