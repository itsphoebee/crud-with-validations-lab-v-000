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



end
