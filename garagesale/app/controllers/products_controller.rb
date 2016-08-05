class ProductsController < ApplicationController
  before_action :set_products
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET sales/1/products
  def index
    @products = @sale.products
  end

  # GET sales/1/products/1
  def show
  end

  # GET sales/1/products/new
  def new
    @product = @sale.products.build
  end

  # GET sales/1/products/1/edit
  def edit
  end

  # POST sales/1/products
  def create
    @product = @sale.products.build(product_params)

    if @product.save
      redirect_to([@product.sale, @product], notice: 'Product was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT sales/1/products/1
  def update
    if @product.update_attributes(product_params)
      redirect_to([@product.sale, @product], notice: 'Product was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE sales/1/products/1
  def destroy
    @product.destroy

    redirect_to sale_products_url(@sale)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_products
      @sale = Sale.find(params[:sale_id])
    end

    def set_product
      @product = @sale.products.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:name, :price)
    end
end
