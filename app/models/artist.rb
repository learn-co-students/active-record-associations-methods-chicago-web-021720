class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def get_genre_of_first_song
    first_song = Artist.first.songs[0].genre
    #return the genre of the artist's first saved song
  end

  def song_count
    self.songs.count
    #return the number of songs associated with the artist
  end

  def genre_count
    array = []
    self.songs.each do |song|
      array << song.genre 
    end
    array = array.uniq
    array.count
    #return the number of genres associated with the artist
  end
end
