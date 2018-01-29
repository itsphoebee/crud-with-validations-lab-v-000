class Song < ActiveRecord::Base
  validates :title, presence: true
  #validates :released, inclusion: {in: %w(true false)}
  validates :artist_name, presence: true
  validate :must_have_release_year_if_released, :release_year_cannot_be_in_the_future

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
    a = Song.all.find_by(title: title)
    if a.release_year == release_year
      errors.add(:release_year, "cannot release same song twice in a year")
    end
      
  end
  
end
