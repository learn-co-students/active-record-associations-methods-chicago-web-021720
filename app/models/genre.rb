class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    songs = Song.where("genre_id = ?", self.id)
    songs.count

  end
    
    # return the number of songs in a genre

  def artist_count
    songs = Song.where("genre_id = ?", self.id)
    artists = []
    songs.each do |song|
      artists << song.artist
    end
    artists = artists.uniq
    artists.count
    # return the number of artists associated with the genre
  end

  def all_artist_names
    all_of_them = []
    songs = Song.where("genre_id = ?", self.id)
    artists = []
    songs.each do |song|
      artists << song.artist
    end
    artists = artists.uniq
    artists.each do |artist|
      all_of_them << artist.name
    end
    all_of_them
    # return an array of strings containing every musician's name
  end
end
