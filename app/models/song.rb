require 'pry'
class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :artist_name, presence: true
  validate :must_have_release_year_if_released, :release_year_cannot_be_in_the_future, :cannot_release_same_song_twice_a_year

  def must_have_release_year_if_released
    if released? && release_year.blank?
      errors.add(:release_year, "cannot be blank if song was released" )
    end
  end

  def release_year_cannot_be_in_the_future
    if release_year.present? && release_year > Time.now.year
      errors.add(:release_year, "cannot be in the future")
    end
  end

  def cannot_release_same_song_twice_a_year
    if title.present? && release_year.present? && artist_name.present?
      a = Song.find_by(title: title, release_year: release_year, artist_name: artist_name)
      binding.pry
      if a
        errors.add(:title, "cannot release same song twice in a year")
      end
    end
  end


end
