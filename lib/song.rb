require 'pry'
class Song
  attr_accessor :name, :artist_name, :song, :filename
  @@all = []
  #summary
  #self is the class, when I dont have a name at all in initialize, i will have to use self
  #as the class
  #we thought we needed def initialize but we commented it out below as don't need it
  #most of the time when you initialze it will have an argument
    #we have to pass in name to use it in body, we are calling initialize
    #which needs info of name to initialize
  #note: for wrong no of arguments error: given is where it is called but i expected in my definition

  #def initialize
    #@name = name
    ## we only need this if we needed a name to do this
  #end


  def self.all
    @@all
  end

  def self.create
    #instantiates and saves the song, and it returns the new song that was created
    song = self.new
    @song = song
    self.all << @song
    @song
    #doesn't need a title, it calls new first to create the instance
    #song.name=(name) would be setting the name here but the tests don't require a name
    #that is being done below
  end

  def self.new_by_name(name)
    #instantiates a song with a name property
     song = Song.new
     song.name=(name) #doing the writer here for name, returns the new name that we could pass in
     #here we return the song
     song
     #ive created a song that can has .name because in initalize i didn't do that, i dont
     #even have an initialize for these tests
  end

  def self.create_by_name(name)
    #instantiates and saves a song with a name property
    # we need to give it a name so we can use self.new_by_name
    # if i dont call new_by_name below would have rewritten that method's code
    new_song_instance = self.new_by_name(name) # store in variable as need to return it
    #@@all << self i can't push in self because that is the class
    @@all << new_song_instance
    new_song_instance
   end


   def self.find_by_name(name)
     result = false
	   result = self.all.find do |song|
		song.name == name
	end
    result
  end

  def self.find_or_create_by_name(name)
# invokes .find_by_name and .create_by_name instead of repeating code
#     returns the existing Song object (doesn't create a new one) when provided the title of an existing Song
#     creates a new Song object with the provided title if one doesn't already exist
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
 end

#this one gives you only the song names
# def self.alphabetical
#   #binding.pry
#   song_names = @@all.map do |song|
#    song.name
#   end
#    song_names.sort
#  end
  def self.alphabetical
    @@all.sort! do |a,b|
      a.name <=> b.name
    end
  end

#what is this doing and why do i need it?
  def save
    self.class.all << self
  end

   def self.new_from_filename(filename)
      array = filename.split("- ")
      song = Song.new
      song.artist_name=(array[0]).strip#creating a writer
      song.name=(array[1].chomp(".mp3")) #creating a writer
      #song.artist_name = artist_name
      #song.name = name
      song
   end

  def self.create_from_filename(filename)
    #initializes and saves a song and artist_name based on the filename format
    song = self.new_from_filename(filename)
    @@all << song
      song
  end
  def self.destroy_all
    @@all.clear
  end
end
