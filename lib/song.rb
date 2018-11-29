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
    new_Song = self.new
    new_Song.save
    new_Song 
  end 
  
  def self.new_by_name(name)
    song = self.new 
    song.name = name; song 
  end 
  
  def self.create_by_name(name)
    song = self.create 
    song.name = name; song 
  end 

  def self.find_by_name(name)
    all.find {|song| song.name == name} 
  end 
  
  def self.find_or_create_by_name(name)
    if find_by_name(name)
      find_by_name(name)
    else 
      create_by_name(name)
    end 
  end 
  
  def self.alphabetical
    all.sort_by { |song| song.name }
  end
  
  def self.new_from_filename(filename)
    an_array = filename.split /\s\-\s|\.mp3/
    song = new_by_name(an_array[1])
    song.artist_name = an_array[0]
    song
  end 
  
  def self.create_from_filename(filename)
    an_array = filename.split /\s\-\s|\.mp3/
    song = create_by_name(an_array[1])
    song.artist_name = an_array[0]
    song
  end 
  
  def self.destroy_all
    @@all = []
  end
end
