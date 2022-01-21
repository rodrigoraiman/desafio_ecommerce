class Category < ApplicationRecord
  has_and_belongs_to_many :products
  has_many :subcategories, class_name: 'Category', foreign_key: :parent_id, dependent: :destroy
  scope :children, ->(id) {where(parent_id: id)}

  
end
