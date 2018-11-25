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
    song.save
    song
  end

  def self.new_by_name(song_title)
    song = self.new
    song.name = song_title
    song
  end

  def self.create_by_name(song_title)
    song = self.new
    song.save
    song.name = song_title
    song
  end

  def self.find_by_name(name)
    @@all.find{ |song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(file)
  new_song = Song.new
  file.split('-').collect do |word|
    if word.include?('.mp3')
      word.slice!(".mp3")
      new_song.name= word.lstrip
    else
      new_song.artist_name= word.rstrip
    end
  end
  new_song
end

  def self.create_from_filename(file)
    all << new_from_filename(file); all[-1]
  end

  def self.destroy_all
    self.all.clear
  end


end
