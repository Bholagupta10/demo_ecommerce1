class CartsController < ApplicationController
	
	def index
		@cart_items = current_user.cart.cart_items
	end

	def show 
		@product = Product.find(params[:id])
	end

	def add_to_cart
		cart = current_user.cart
		product = Product.find(params[:product_id])
		ci = cart.cart_items.find_by(product_id: product.id)	
		if ci.blank?
		  cart.cart_items.create(product_id: product.id, quanity: 1, total: product.price)
		else
		  ci.update(product_id: product.id, quanity: (ci.quanity + 1), total: (ci.quanity + 1)*(product.price))
		end
		cart.total = cart.cart_items.pluck(:total).reduce(:+)
		cart.save!
		redirect_to root_path
	end

  def remove_from_cart
	cart_item = CartItem.find(params[:cart_item])
	cart_item.destroy
    redirect_to carts_path
	end
end