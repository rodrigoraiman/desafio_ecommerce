class Category < ApplicationRecord
  has_and_belongs_to_many :products
  has_many :sub_categories, class_name: 'Category', foreign_key: :parent_id, dependent: :destroy

  belongs_to :parent, class_name: 'Category', optional: true
  scope :children, ->(id) {where(parent_id: id)}

  
end
