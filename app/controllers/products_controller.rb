class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:list]
  before_action :authenticate_user!, except: [:index, :show, :search, :list]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all.order("created_at desc").page(params[:page])
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = current_user.products.build
  end

  # GET /products/1/edit
  def edit
  end

  #GET
  def list
    @products = Product.where(user_id: params[:user_id]).page(params[:page])
  end

  def search
    @products = nil
    if params[:product][:category] != ""
      if params[:product][:val] == ""
        @products = Product.where(brand: params[:product][:category]).page(params[:page])
      else
        if params[:product][:type] == "" || params[:product][:type] == "Title"
          @products = Product.where("title LIKE ? AND brand = ?", "%#{params[:product][:val]}%", params[:product][:category]).page(params[:page])
        elsif params[:product][:type] == "Seller"
          @userid = User.where("name LIKE ?", "%#{params[:product][:val]}%")
          @products = Product.where({ user_id: [@userid.ids], brand: [params[:product][:category]]} ).page(params[:page])
        else
          @products = Product.where(brand: params[:product][:category]).page(params[:page])
        end
      end
    else
      if params[:product][:val] == ""
        @products = Product.all.order("created_at desc").page(params[:page])
      else
        if params[:product][:type] == "" || params[:product][:type] == "Title"
          @products = Product.where("title LIKE ? ", "%#{params[:product][:val]}%").page(params[:page])
        elsif params[:product][:type] == "Seller"
          @userid = User.where("name LIKE ? ", "%#{params[:product][:val]}%")
          @products = Product.where({ user_id: [@userid.ids] }).page(params[:page])
        else
          @products = Product.all.order("created_at desc").page(params[:page])
        end
      end
    end


    render 'products/index'
  end

  # POST /products
  # POST /products.json
  def create
    @product = current_user.products.build(product_params)

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
    @locs = Location.where(product_id: @product.id, status: 0)
    if @locs.count > 0
      redirect_to @product, alert: 'Unable to delete, product has pending delivery.'
    else 
      @locs = Location.where(product_id: @product.id)
      @locs.each do |l|
        l.destroy
      end
    end
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
    rescue ActiveRecord::RecordNotFound => e
      routing_error and return
    end

    def set_user
      @user = User.find(params[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      routing_error and return
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:brand, :model, :description, :condition, :finish, :title, :price, :quantity, :image)
    end
end
