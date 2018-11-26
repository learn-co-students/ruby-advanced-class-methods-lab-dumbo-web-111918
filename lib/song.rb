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
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end


  def self.find_by_name(song_name)
    instance = @@all.find{|x| x.name == song_name}
    instance
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    names = @@all.map { |x| x.name  }
    names.sort!
    new_array = []
    for x in names
      for y in @@all
        if x == y.name
          new_array.push(y)
        end
      end
    end
    new_array
  end

  def self.new_from_filename(filename)
    artist_songType = filename.split(" - ")
    song_type = artist_songType[1].split(".")
    song = self.new
    song.name = song_type[0]
    song.artist_name = artist_songType[0]
    song
  end

  def self.create_from_filename(filename)
    artist_songType = filename.split(" - ")
    song_type = artist_songType[1].split(".")
    song = self.new
    song.name = song_type[0]
    song.artist_name = artist_songType[0]
    @@all << song
    song
  end

  def self.destroy_all
    @@all = []
  end
end
# artist - songname.mp3
# song = Song.create_by_name("Band")
# song2 = Song.create_by_name("What")
# song3 = Song.create_by_name("Cool")
#
# puts Song.alphabetical
#
# puts song.artist_name