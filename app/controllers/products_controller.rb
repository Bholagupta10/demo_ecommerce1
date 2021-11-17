class ProductsController < ApplicationController
  http_basic_authenticate_with name: "products", password: "secret", except: [:index, :show]

  def index
    @products = Product.all
    # # redirect_to root_url
    # if @product.buyers
    #   @products = Product.all
    # else  
    #   @product = Products.sellers
    # end

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
        # product_save_failure_response(format, :edit)
        render :edit
      end
  end

  # def destroy
  #   @product.destroy
  #   respond_to do |format|
  #     format.html { redirect_to products_url }
  #     format.json { head :no_content }
  #     flash[:info] = 'Product was successfully destroyed.'
  #   end
  # end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to root_path
  end

  # def set_product
  #   @product = Product.find(params[:id])
  # end

  # def product_save_success_response(format, message)
  #   format.html { redirect_to @product }
  #   format.json { render :show, status: :created, location: @product }
  #   flash[:info] = message
  # end

  # def product_save_failure_response(format, action)
  #   format.html { render action }
  #   format.json do
  #     render json: @product.errors,
  #            status: :unprocessable_entity
  #   end
  # end

  def product_params
    params.require(:product).permit(:name, :quanity, :brand, :details, :price)
  end

end

