class Movie < ActiveRecord::Base
  # attr_accessible :gallery_id, :name, :image, :remote_image_url
  DURATION_OPTIONS = [
    ['less than 90 min', 'short'],
    ['90-120 min', 'medium'], 
    ['more than 120 min', 'long']
  ]
  has_many :reviews 
  has_many :categories, through: :movie_categories

  accepts_nested_attributes_for :categories
  # belongs_to :user

  # validates :user,
  #       presence: true
  mount_uploader :image, ImageUploader

  validates :title,
    presence: true

  validates :director,
    presence: true

  validates :runtime_in_minutes,
    numericality: { only_integer: true }

  validates :description,
    presence: true

  validates :release_date,
    presence: true

  validate :release_date_is_in_the_past

  def review_average
    if reviews.size == 0
      return "No current rating"
    else
      reviews.sum(:rating_out_of_ten)/reviews.size
    end
  end

  protected

  def release_date_is_in_the_past
    if release_date.present?
      errors.add(:release_date, "should be in the past") if release_date > Date.today
    end
  end

end
