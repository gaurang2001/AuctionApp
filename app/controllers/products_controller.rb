class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:show, :edit, :update, :destroy, :bid]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    @products.each do |prod|
      if prod.pid == 1
        prod.bb = current_user.id
        prod.tbid += 1
        if prod.price <= prod.pbidprice && prod.tbid != 1
          prod.bb = prod.pbid
          prod.price = prod.pbidprice
          prod.tbid -= 1
        else
          prod.pbidprice = prod.price
          prod.pbid = prod.bb
        end
        prod.pid = 0
        prod.save
      end
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  def bid
    if Time.now < @product.deadline
        @product = Product.find(params[:id])
        @product.bb = current_user.id
        @product.tbid += 1
    else
      redirect_to products_url
    end
    if Time.now > @product.deadline && @product.bb == current_user.id
      @product.claimed_by = current_user.id
    end
    @product.save
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    @product.user = current_user
    @product.uname = current_user.name;
    @product.contact = current_user.contact;
    @product.pid = 0
    Time.zone = "UTC"
    @product.price = @product.startbid 
    @product.pbidprice = @product.price

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    if params[:bid]
      @product.pid = 1
    end
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:pid, :name, :uname, :desc, :startbid, :deadline, :contact, :image, :bb, :price, :tbid, :claimed_by, :pbid, :pbidprice)
    end
end
