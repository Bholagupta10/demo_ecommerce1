class ProductsController < ApplicationController
  http_basic_authenticate_with name: "products", password: "secret", except: [:index, :show]

  def index
    if current_user.role == 'Buyer'
      @products = Product.all
    else
      @products = current_user.products
    end
  end 

  def buy_now
    @product = Product.find(params[:id])
    @product.update_column(:quanity, @product.quanity-1)
    redirect_to products_path
  end
  
  def add_now
    @product = Product.find(params[:id])
    @product.update_column(:quanity, @product.quanity+1)
    redirect_to products_path
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      product_save_success_response(format,
                                      'Product was successfully updated.')
        redirect_to @product
      else
        render :edit
      end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to root_path
  end
  
  def product_params
    params.require(:product).permit(:user_id,:name, :quanity, :brand, :details, :price)
  end

end

