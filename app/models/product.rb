class Product < ApplicationRecord
  validates :name, presence: true 
  validates :details, presence: true, length: { minimum: 10  } 

  belongs_to :user

end


  # Active Record will no longer automatically recognize the bi-directional association:

  # belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  # has_and_belongs_to_many :user 