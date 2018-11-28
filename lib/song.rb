require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize
    @@all << self
  end

  def self.create
    Song.new
  end

  # def self.create
  #   song = Song.new
  #   song.save
  #   song
  # end

  def self.new_by_name (song_name)
    new_song = self.create
    new_song.name = song_name
    new_song
  end

  def self.create_by_name (song_name)
    self.new_by_name(song_name)
  end

  def self.find_by_name (song_name)
     @@all.detect do |song| song.name == song_name
     end
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|x| x.name}

  end

  def self.new_from_filename(filename)
     names = filename.split(/\.| - /)
     result = self.create_by_name(names[1])
     result.artist_name = names[0]
     result
  end

  # def self.new_from_filename(filename)
  #   parts = filename.split(" - ")
  #   artist_name = parts[0]
  #   song_name = parts[1].gsub(".mp3", "")
  #   song = self.new
  #   song.name = song_name
  #   song.artist_name = artist_name
  #   song
  # end

  def self.create_from_filename(file_name)
   self.new_from_filename(file_name)
  end

  # def self.create_from_filename(filename)
  #   parts = filename.split(" - ")
  #   artist_name = parts[0]
  #   song_name = parts[1].gsub(".mp3", "")
  #
  #   song = self.create
  #   song.name = song_name
  #   song.artist_name = artist_name
  #   song
  # end

  def self.destroy_all
    @@all.clear
    #or    self.all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
