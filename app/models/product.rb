class Product < ApplicationRecord
  validates :name, presence: true 
  validates :details, presence: true, length: { minimum: 10  } 

end
