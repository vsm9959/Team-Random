class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:new, :edit, :update, :destroy, :create, :usersales]
  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.all
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
    @sale = Sale.find(params[:id])
    @sale_address = @sale.address_line1 + " " + @sale.address_line2 + " " + @sale.city + " " + @sale.state
    @geocode = Geokit::Geocoders::GoogleGeocoder.geocode(@sale_address)
    @latlng = @geocode.ll
    @lat, @lng = @latlng.split(",")
    print("Lat = " + @lat)
    print("Lng = " + @lng)
    @products =  Product.where(sale_id: @sale.id)
  end

  # GET /sales/new
  def new
    @sale = Sale.new
  end

  # GET /sales/1/edit
  def edit
    if @sale.user_auth_token != @current_user.auth_token
        redirect_to sales_url, notice: 'You do not have authorization to update the sale.'
    end 
  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.create(sale_params)
    respond_to do |format|
    #if @sale.user_auth_token != @current_user.auth_token
     # format.html { redirect_to sales_url, notice: 'You do not have authorization to creat a new sale.' }
        if @sale.save
          format.html { redirect_to @sale, notice: 'Sale was successfully created.' }
          format.json { render :show, status: :created, location: @sale }
        else
          format.html { render :new }
          format.json { render json: @sale.errors, status: :unprocessable_entity }
        end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
      respond_to do |format|
      if @sale.user_auth_token != @current_user.auth_token
        format.html { redirect_to sales_url, notice: 'You do not have authorization to update the sale.' }
      elsif @sale.update(sale_params)  
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
      respond_to do |format|
        if @sale.user_auth_token != @current_user.auth_token
          format.html { redirect_to sales_url, notice: 'You do not have authorization to delete the sale.' }
        else @sale.destroy
          format.html { redirect_to sales_url, notice: 'Sale was successfully deleted.' }
          format.json { head :no_content }
        end
      end
  end
  def usersales
    @usersales ||= []
    Sale.all.each do |sale|
      if sale.user_auth_token == @current_user.auth_token 
       @usersales = @usersales.to_a.push sale
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:title, :description, :address_line1, :address_line2, :city, :state, :posted_date, :zip_code, :image, :image_file_name, :user_auth_token)
    end  
end
