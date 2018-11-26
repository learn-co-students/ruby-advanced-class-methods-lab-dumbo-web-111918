class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
  	song = self.new
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

  def self.find_by_name(name)
  	@@all.find {|x| x.name==name}
  end

  def self.find_or_create_by_name(name)
  	find_by_name(name) || create_by_name(name)
  end

  def self.alphabetical
  	@@all.sort_by{ |m| m.name.downcase }
  end

  def self.new_from_filename(filename)
  	song = self.new
  	song_name = filename.split('.')[0].split(' - ')
  	song.name = song_name[1]
  	song.artist_name = song_name[0]
  	@@all << song
  	song
  end

  def self.create_from_filename(filename)
  	song = self.new
  	song_name = filename.split('.')[0].split(' - ')
  	song.name = song_name[1]
  	song.artist_name = song_name[0]
  	@@all << song
  end

  def self.all
    @@all
  end

  def self.destroy_all
  	@@all.clear
  end

  def save
    self.class.all << self
  end

end