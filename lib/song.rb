class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end
  
  def self.all=(val)
    @@all = val
  end

  def save
    self.class.all << self
  end

  def self.create
    @@all << Song.new
    self.all[-1]
  end
  
  def self.new_by_name(name)
    new_song = self.create
    new_song.name = name
    new_song
  end
  
  def self.create_by_name(name)
    self.new_by_name(name)
  end
  
  def self.find_by_name(name)
    self.all.find do |x|
      x.name == name
    end
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end
  
  def self.alphabetical
    self.all.sort_by {|x| x.name}
  end
  
  def self.new_from_filename(file_name)
    names = file_name.split(/\.| - /)
    result = self.create_by_name(names[1])
    result.artist_name = names[0]
    result
  end
  
  def self.create_from_filename(file_name)
    self.new_from_filename(file_name)
  end
  
  def self.destroy_all
    self.all = []
  end
end
