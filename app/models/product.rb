class Product < ApplicationRecord
  has_and_belongs_to_many :categories

  has_many :variation
  has_many :colors, through: :variations
  has_many :sizes, through: :variations


  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 10 }

  def to_s
    name
  end

  
end
