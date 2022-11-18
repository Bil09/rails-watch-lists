class Movie < ApplicationRecord
  has_many :bookmarks
  MOVIES = Movie.all.map { |m| m.title }
end
