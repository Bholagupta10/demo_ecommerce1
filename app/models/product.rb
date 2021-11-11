class Product < ApplicationRecord
    # model is done and code is also done 
    # mount_uploader :picture, ProductPictureUploader
    has_many :line_items, dependent: :destroy
    has_many :orders, through: :line_items
    def self.search(search)
        where('name LIKE ?', "%#{search}%")
      end
end


