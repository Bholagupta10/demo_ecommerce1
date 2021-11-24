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
		cart_items = cart.cart_items
		cart.cart_items.create(product_id: product.id, quanity: 1, total: product.price)
		cart.total = cart.cart_items.pluck(:total).reduce(:+)
		cart.save!
		redirect_to root_path
	end

  def remove_from_cart
		cart = current_user.cart
		product = Product.find(params[:product_id])
		cart_items = cart.cart_items
		cart.cart_items.delete(product_id: product.id, quanity: 1, total: product.price)
		cart.total = cart.cart_items.pluck(:total).reduce(:-)
		cart.delete!
    redirect_to carts_path
	end
end
