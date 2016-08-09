require 'pry'

class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre

  def get_genre_name
  	self.genre.name
  end

  def drake_made_this
    # when this method is called it should assign the song's artist to Drake
    if Artist.find_by(name: "Drake") == nil
    	drake = Artist.new(name: "Drake")
    	drake.save
    	self.artist_id = drake.id
    	self.artist
	else
		self.artist_id = Artist.find_by(name: "Drake").id
		self.artist
	end
  end

end