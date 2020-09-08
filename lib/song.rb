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
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      song = self.find_by_name(name)
      song
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name}
  end


  def self.new_from_filename(name)
    data = name.split(" - ")
    info = data.collect do |x|
      artist_name = x[0]
      song_name = x[1]
      song_name = song_name.delete".mp3"
      song = self.new
      song.name = song_name
      song.artist_name = artist_name
      song
      binding.pry
    end
    info
  end



  def self.destroy_all
    self.all.clear
  end

end
