class Product < ActiveRecord::Base
  has_many :orders
  has_many :comments
  validates :name, :description, :image_url, :color, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: { greater_than: 0,
            message: "must be a number greater than 0" }
  def average_rating
    comments.average(:rating).to_f
  end

end
