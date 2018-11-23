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
    all << Song.new; all[-1]
  end

  def self.new_by_name(name)
    new_song = Song.new
    new_song.name= name; new_song
  end

  def self.create_by_name(song_name)
    all << Song.new
    all[-1].name = song_name; all[-1]
  end

  def self.find_by_name(name)
    all.find{|song|song.name == name}
  end

  def self.find_or_create_by_name(name)
    match = find_by_name(name)
    if match == nil then create_by_name(name); else match end
  end

  def self.alphabetical
    all.sort_by{|inst| inst.name}
  end

  def self.new_from_filename(filename)
    new_song = Song.new
    filename.split('-').collect do |word|
      if word.include?('.mp3')
        word.slice!(".mp3")
        new_song.name= word.lstrip
      else
        new_song.artist_name= word.rstrip
      end
    end
    new_song
  end

  def self.create_from_filename(filename)
    all << new_from_filename(filename); all[-1]
  end

  def self.destroy_all
    all.clear
  end

end
