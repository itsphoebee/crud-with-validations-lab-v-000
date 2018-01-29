class Song < ActiveRecord::Base
  validates :title, presence: true
  #validates :released, inclusion: {in: %w(true false)}
  validates :artist_name, presence: true
  validate :must_have_release_year_if_released

  def must_have_release_year_if_released
    if released.valid? && release_year.blank?
      errors.add(:release_year, "cannot be blank if song was released" )
    end
  end

end
