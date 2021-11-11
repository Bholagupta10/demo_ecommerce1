class LineItem < ApplicationRecord
end


# it take the item in sequence
# bin/rails generate model line_items quantity:integer product_id:integer   cart_id:integer  order_id:integer 


$ bin/rails generate controller static_pages index --skip-routes    