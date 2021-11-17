class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # after_create :set_default_role
  # belong_to :role, optional: true 

  # validates :first_name, :last_name, presence :true

  # def full_name
  #   "#{first_name} #{last_name}"
  # end
  # has_many :products, dependent: :destroy

  has_many :product, class_name: 'Product', foreign_key: :user_id 
  # has_one :user_id

end



