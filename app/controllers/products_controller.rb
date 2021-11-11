class ProductsController < ApplicationController

  before_action  :set_product, only: %i[show edit update destroy]
  before_action  :user_is_admin, only: %i[create edit update destroy]

  def index
    @product = Product.all
    # redirect_to root_url
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        product_save_success_response(format,
                                      'Product was successfully created.')
      else
        product_save_failure_response(format, :new)
      end
    end
  end

  # The show action calls Article.find (mentioned previously) with the ID captured 
  # by the route parameter. The returned article is stored in the @article instance variable

  def show
    @product = Product.find(params[:id])
  end


  # The new action instantiates a new article, but does not save it. This article will 
  # be used in the view when building the form. By default, the new action will render
  def new
    @product = Product.new
    
  end



end
