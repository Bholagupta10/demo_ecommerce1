class Product < ApplicationRecord
  validates :name, presence: true 
  validates :details, presence: true, length: { minimum: 10  } 
  belongs_to :user
  has_many :order_items
end
