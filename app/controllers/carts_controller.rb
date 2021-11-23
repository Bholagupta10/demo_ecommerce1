class CartsController < ApplicationController
    # before_filter :require_login  

    def add_item
      @product = Product.find(params[:id])
    #   item = cart[product_id] || { "quantity" => 0 }
    #   item["quantity"] += 1
    #   cart[product_id] = item
    #   update_cart cart
  
    #   redirect_to :back
    end
    def show
      @product = Product.find(params[:id])
    end
  

end
