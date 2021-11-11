class ProductsController < ApplicationController

  before_action  :set_product, only: %i[show edit update destroy]
  before_action  :user_is_admin, only: %i[create edit update destroy]

  def index
    @products = Product.all
    # redirect_to root_url
  end
  
    def show
      @product = Product.find(params[:id])
    end
 
    def new
      @product = Product.new
      
    end

  def create
    @product = Product.new(product_params)
    # respond_to do |format|
      if @product.save
        # product_save_success_response(format,
        #                               'Product was successfully created.')
        redirect_to @product
      else
        # product_save_failure_response(format, :new)
        render :new
      end
  end


  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
      if @product.update(product_params)
        # product_save_success_response(format,
        #                               'Product was successfully updated.')
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
    params.require(:product).permit(:name, :description, :picture, :price)
  end

end

