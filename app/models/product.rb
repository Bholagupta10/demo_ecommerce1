class Product < ApplicationRecord
  has_many :products, dependent: :destroy
  validates :name, presence: true 
  validates :details, presence: true, length: { minimum: 10  } 

end
