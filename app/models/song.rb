class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :Released, inclusion: {in: %w(true false)}
  validates :artist_name, presence: true
end
