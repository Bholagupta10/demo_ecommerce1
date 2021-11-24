class Cart < ApplicationRecord
  has_many :cart_items
  belongs_to :user

  # LOGIC
  # def sub_total
  #   sum = 0
  #   cart_items.each do |cart_item|
  #     sum += cart_item.total_price
  #   end
  #   sum
  # end
end
